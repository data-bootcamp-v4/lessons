-- ============================================================================
-- SQL: WINDOW FUNCTIONS
-- MySQL 8.x | Czech Bank database
-- ============================================================================
-- LEARNING GOALS
-- 1. Explain why GROUP BY and window functions return different row counts.
-- 2. Build OVER() step by step: PARTITION BY, ORDER BY, and ROWS BETWEEN.
-- 3. Distinguish calculation order, window frame, and display order.
-- 4. Use running aggregates, ranking functions, and LAG()/LEAD().
-- 5. Combine a CTE with a window function to answer a business question.
--
-- All examples use the bank database. Run the queries one at a time.

USE bank;

-- ============================================================================
-- 1. FROM GROUP BY TO OVER(): KEEPING INDIVIDUAL ROWS
-- ============================================================================
-- Business question: how does each loan compare with the overall loan average?
-- First, a familiar aggregate: one result for the entire table.

SELECT AVG(amount) AS overall_average
FROM loan;

-- GROUP BY creates one result per group, collapsing individual loan rows.
-- In the following query, each output row represents ONE loan status.

SELECT status,
       AVG(amount) AS status_average
FROM loan
GROUP BY status;

-- Why not simply add loan_id and amount to the SELECT above?
-- Neither column is listed in GROUP BY, nor wrapped in an aggregate function
-- such as AVG(), SUM(), or COUNT(). With MySQL's ONLY_FULL_GROUP_BY enabled,
-- selecting these non-grouped columns would be rejected.
-- Adding them to GROUP BY is not the solution: it would change the level of
-- detail, so we would no longer get one row per status.
--
-- What if we want to show each individual loan (loan_id, amount) AND the
-- overall average alongside it? A window function solves that problem.
-- NOTE: aggregate function is the correct term here; an aggregate does not
-- automatically mean a cumulative or running calculation.

-- A window function keeps individual loan rows and adds a calculated column.
-- Empty OVER() means: consider the entire result set as one window.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER () AS overall_average
FROM loan;

-- We can now compare every loan with the same overall average.

SELECT loan_id,
       amount,
       AVG(amount) OVER () AS overall_average,
       amount - AVG(amount) OVER () AS difference_from_average
FROM loan;

-- Python/Pandas analogy:
--   df.groupby('status')['amount'].mean()             -> one value per status
--   df['amount'].mean()                               -> one overall value
--   df['overall_average'] = df['amount'].mean()        -> keep all rows
--
-- QUICK CHECK 1 (2-3 min)
-- Return loan_id, amount, the maximum loan amount, and the difference between
-- that maximum and the current loan amount. Preserve every loan row.


-- ============================================================================
-- 2. ADD PARTITION BY: ONE CALCULATION PER GROUP, STILL KEEPING ALL ROWS
-- ============================================================================
-- PARTITION BY separates the rows into independent analytical groups.
-- Without ORDER BY inside OVER(), AVG() uses the entire partition.
-- Every loan with the same status receives the same status_average.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
       ) AS status_average
FROM loan;

-- Compare several group-level statistics without collapsing rows.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (PARTITION BY status) AS status_average,
       MIN(amount) OVER (PARTITION BY status) AS status_minimum,
       MAX(amount) OVER (PARTITION BY status) AS status_maximum
FROM loan;

-- Pandas analogy:
--   df['status_average'] = df.groupby('status')['amount'].transform('mean')
--
-- QUICK CHECK 2 (2-3 min)
-- Return each loan with the average amount for loans of the same duration.
-- Explain why GROUP BY duration would not preserve loan_id and amount.


-- ============================================================================
-- 3. ADD ORDER BY INSIDE OVER(): THE CALCULATION HAS A SEQUENCE
-- ============================================================================
-- Compare this query with the previous one. Only ORDER BY has been added.
-- IMPORTANT: the column used for ordering does NOT need to be the column
-- being averaged. Here we average amount but order by loan_id.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
       ) AS running_status_average
FROM loan
ORDER BY status, loan_id;

-- Why is the average now running rather than constant within each status?
-- In MySQL 8.x, an aggregate window function with ORDER BY inside OVER(),
-- and without an explicit frame, normally uses this DEFAULT frame:
--
--   RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--
-- It starts at the beginning of the ordered partition and extends through
-- the current ORDER BY value, INCLUDING peers tied on that value.
-- loan_id is unique here, so each row adds exactly one loan to the average.
-- This is NOT caused by AVG(amount) and ORDER BY using the same column.
--
-- IMPORTANT: ORDER BY inside OVER() defines the CALCULATION ORDER.
-- It does NOT guarantee the order in which result rows are displayed.
-- The final ORDER BY (after FROM) defines the DISPLAY ORDER.
--
-- Compare the same running calculation displayed in a different order.
-- The running values do not change; only their displayed positions change.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
       ) AS running_status_average
FROM loan
ORDER BY amount DESC, loan_id;

-- Compare two orders in a single query. Both average amount, but they
-- accumulate the loans in different sequences.
-- The second window uses loan_id to break ties in amount.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
       ) AS running_by_loan_id,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY amount, loan_id
       ) AS running_by_amount
FROM loan
ORDER BY status, loan_id;

-- NOTE: PARTITION BY status ORDER BY status, loan_id would be redundant:
-- status is constant within each partition.
--
-- QUICK CHECK 3 (3 min)
-- 1. Remove ORDER BY loan_id from the first query in this section.
--    Does the average still change from row to row within a status?
-- 2. Restore it, then change only the final ORDER BY to amount DESC.
--    Did the calculated running averages change?
-- 3. Would ORDER BY duration inside OVER() always add exactly one row
--    to the calculation at each step? Think about tied durations.


-- ============================================================================
-- 4. ADD ROWS BETWEEN: CONTROL WHICH ROWS PARTICIPATE
-- ============================================================================
-- Three different concepts:
--
-- PARTITION BY           -> which analytical group does this row belong to?
-- ORDER BY inside OVER() -> what is the calculation sequence within the group?
-- WINDOW FRAME           -> which rows contribute to this aggregate value?
-- final ORDER BY         -> how are the finished results displayed?
--
-- To make a row-by-row running average explicit, use ROWS rather than the
-- default RANGE. Include a tie-breaker to make the order deterministic.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY amount, loan_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_status_average
FROM loan
ORDER BY status, amount, loan_id;

-- We can keep ORDER BY inside OVER() without producing a running average:
-- an explicit frame covering the WHOLE partition restores the same
-- status_average on every loan row.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
           ORDER BY amount, loan_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS full_partition_average
FROM loan
ORDER BY status, amount, loan_id;

-- ROWS BETWEEN: USEFUL BOUNDARIES (within a valid start/end interval)
--
--   UNBOUNDED PRECEDING -> first row of the partition
--   n PRECEDING         -> n rows before the current row
--   CURRENT ROW         -> the current row
--   n FOLLOWING         -> n rows after the current row
--   UNBOUNDED FOLLOWING -> last row of the partition
--
-- Common examples:
--
--   ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--     Running aggregate from the beginning through the current row.
--
--   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
--     Moving aggregate over at most 3 rows: current + previous 2.
--
--   ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
--     Centered moving aggregate over at most 3 rows.
--
--   ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
--     Entire partition, even when an ORDER BY is present.
--
--   ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
--     Current row and all following rows.
--
-- At partition boundaries, fewer rows may be available.
-- ROWS counts rows; RANGE uses ORDER BY values and includes peers (ties).
-- These frame options apply to frame-sensitive aggregate functions;
-- ranking and navigation functions have different semantics.
-- MySQL's default with ORDER BY for frame-sensitive aggregate functions:
--   RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- Without ORDER BY, the default frame covers the entire partition.
--
-- SIDE-BY-SIDE EXPERIMENT: DEFAULT FRAME VS EXPLICIT FRAMES
-- Keep SUM(), PARTITION BY status, and ORDER BY loan_id unchanged.
-- Only the frame changes. loan_id is unique, so the first two columns
-- MUST match: RANGE's peer groups contain one loan each in this example.
-- The third column uses only the current loan and the previous two loans.
-- It is a MOVING sum, not a running sum from the start of the partition.

SELECT loan_id,
       status,
       amount,
       SUM(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
       ) AS running_default,
       SUM(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_explicit,
       SUM(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_last_three
FROM loan
ORDER BY status, loan_id;

-- The three numeric columns can be difficult to compare visually.
-- A single CTE makes it possible to calculate differences between them
-- without repeating all three window expressions in the outer SELECT.
-- We do NOT need a separate CTE for each window calculation.

WITH loan_windows AS (
    SELECT loan_id,
           status,
           amount,
           SUM(amount) OVER (
               PARTITION BY status
               ORDER BY loan_id
           ) AS running_default,
           SUM(amount) OVER (
               PARTITION BY status
               ORDER BY loan_id
               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
           ) AS running_explicit,
           SUM(amount) OVER (
               PARTITION BY status
               ORDER BY loan_id
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           ) AS moving_last_three
    FROM loan
)
SELECT loan_id,
       status,
       amount,
       running_default,
       running_explicit,
       moving_last_three,
       running_default - running_explicit AS default_vs_explicit,
       running_explicit - moving_last_three AS running_vs_moving
FROM loan_windows
ORDER BY status, loan_id;

-- EXPECTED OBSERVATIONS:
-- 1. default_vs_explicit = 0 for every loan in this dataset.
-- 2. running_vs_moving = 0 for the first three loans of each status;
--    from the fourth loan onward, the moving frame drops earlier rows.
--    With positive loan amounts, the difference then becomes positive.
-- 3. This equivalence is NOT universal: if ORDER BY uses a non-unique
--    value (e.g. duration), default RANGE includes tied rows together,
--    while ROWS counts individual rows. Their results can differ.
--
-- QUICK CHECK 4 (3-4 min)
-- 1. Run the side-by-side comparison. Why are the first two sums equal?
-- 2. Why does the third sum differ after the first three loans per status?
-- 3. Change 2 PRECEDING to 4 PRECEDING. What changes?
-- 4. Predict what might happen if ORDER BY loan_id became ORDER BY duration.


-- ============================================================================
-- 5. RUNNING SUM(): SAME PRINCIPLE, DIFFERENT AGGREGATE
-- ============================================================================
-- A running total of loan amounts by status, in loan_id order.
-- We specify ROWS explicitly rather than relying on the default frame.

SELECT loan_id,
       status,
       amount,
       SUM(amount) OVER (
           PARTITION BY status
           ORDER BY loan_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_loan_amount
FROM loan
ORDER BY status, loan_id;

-- For a running total of transactions per account, use the original
-- transaction date encoding and trans_id as a deterministic tie-breaker.
-- The Czech Bank dataset stores dates numerically; ordering by the original
-- encoded date preserves chronology for this dataset.
-- Transaction amounts are signed; this is a running sum of amounts, not
-- necessarily the account balance reported by the bank.

SELECT account_id,
       trans_id,
       `date` AS transaction_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY account_id
           ORDER BY `date`, trans_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_transaction_amount
FROM trans
ORDER BY account_id, `date`, trans_id;

-- Python/Pandas analogy (after sorting by account_id, date, trans_id):
--   df['running_amount'] = df.groupby('account_id')['amount'].cumsum()


-- ============================================================================
-- 6. ORDER BY FOR RANKING: NOT AN AGGREGATE OR A RUNNING TOTAL
-- ============================================================================
-- ROW_NUMBER() gives every row a unique sequential number.
-- RANK() assigns the same rank to ties and leaves gaps after them.
-- DENSE_RANK() assigns the same rank to ties without gaps.
-- These functions use ORDER BY to define a ranking, NOT a running aggregate.
-- For ranking, ORDER BY inside OVER() is required.

SELECT loan_id,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC, loan_id) AS row_number,
       RANK() OVER (ORDER BY amount DESC) AS amount_rank,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_amount_rank
FROM loan
ORDER BY amount DESC, loan_id;

-- Why do we use loan_id only in ROW_NUMBER()?
--
-- ROW_NUMBER() must assign a unique number to every row.
-- loan_id provides a deterministic tie-breaker when amounts match.
--
-- RANK() and DENSE_RANK() deliberately use only amount.
-- This allows loans with the same amount to share a rank.
--
-- Adding loan_id to their ORDER BY would break those ties,
-- because loan_id is unique.
--
-- The final ORDER BY controls only the display order.
--
-- Restart a rank within each status using PARTITION BY.

SELECT loan_id,
       status,
       amount,
       RANK() OVER (
           PARTITION BY status
           ORDER BY amount DESC
       ) AS rank_within_status
FROM loan
ORDER BY status, rank_within_status, loan_id;

-- QUICK CHECK 5 (3 min)
-- Rank loans by duration within each status using both RANK() and
-- DENSE_RANK(). Inspect tied durations and explain the difference.


-- ============================================================================
-- 7. LAG() AND LEAD(): PREVIOUS AND NEXT ROWS
-- ============================================================================
-- LAG() retrieves a value from an earlier row in the defined order.
-- LEAD() retrieves a value from a later row.
-- They are navigation functions, not cumulative aggregate functions.
-- The first LAG() and last LEAD() in each partition normally return NULL.

SELECT account_id,
       trans_id,
       `date` AS transaction_date,
       amount,
       LAG(amount) OVER (
           PARTITION BY account_id
           ORDER BY `date`, trans_id
       ) AS previous_transaction_amount,
       LEAD(amount) OVER (
           PARTITION BY account_id
           ORDER BY `date`, trans_id
       ) AS next_transaction_amount
FROM trans
ORDER BY account_id, `date`, trans_id;

-- We can also calculate the change relative to the previous transaction.

SELECT account_id,
       trans_id,
       amount,
       LAG(amount) OVER (
           PARTITION BY account_id
           ORDER BY `date`, trans_id
       ) AS previous_amount,
       amount - LAG(amount) OVER (
           PARTITION BY account_id
           ORDER BY `date`, trans_id
       ) AS change_from_previous_amount
FROM trans
ORDER BY account_id, `date`, trans_id;

-- QUICK CHECK 6 (3 min)
-- Return each transaction with the previous transaction date for the same
-- account. Explain why the first transaction of each account has NULL.


-- ============================================================================
-- 8. CTE + WINDOW FUNCTION: PREPARE DATA, THEN ANALYZE IT
-- ============================================================================
-- Business question: which accounts have the most transactions?
-- Step 1: GROUP BY prepares one row per account.

SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;

-- Step 2: a CTE names that intermediate result; RANK() analyzes its rows.
-- The window function ranks COUNTS, not individual transactions.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
)
SELECT account_id,
       transaction_count,
       RANK() OVER (
           ORDER BY transaction_count DESC
       ) AS activity_rank
FROM account_transactions
ORDER BY activity_rank, account_id;

-- For monthly trends, the same pattern is:
-- raw transactions -> GROUP BY month -> LAG(monthly metric).
-- This is useful for monthly active customers, transaction volume,
-- and month-over-month changes. The EXTRA lab explores this pattern.


-- ============================================================================
-- 9. FINAL CHALLENGE (INTEGRATED PRACTICE)
-- ============================================================================
-- Business question: identify the most active accounts in each district.
-- 1. Build a CTE with one row per account and its transaction count.
-- 2. Join the account table to obtain district_id.
-- 3. Use RANK() to rank accounts by transaction count WITHIN each district.
-- 4. Display results by district and rank.
-- 5. Explain why GROUP BY is needed before the window function.
-- 6. Explain why the ORDER BY inside OVER() and final ORDER BY have
--    different responsibilities.
-- Optional: use a second CTE to keep only ranks 1 through 3 per district.
-- Remember: a window-function alias cannot be filtered directly in WHERE
-- of the same SELECT; prepare the ranking in a CTE/subquery first.


-- ============================================================================
-- 10. TAKEAWAYS
-- ============================================================================
-- GROUP BY collapses rows; window functions preserve rows in their input.
-- OVER() without PARTITION BY: all input rows form one partition.
-- PARTITION BY: independent analytical groups, without collapsing rows.
-- ORDER BY inside OVER(): logical order used by the window function.
-- Window frame: the subset of ordered rows used by frame-sensitive
--   aggregate functions such as SUM(), AVG(), and COUNT().
-- Final ORDER BY: display order of the query result.
--
-- IMPORTANT DEFAULTS FOR AGGREGATE WINDOW FUNCTIONS IN MYSQL 8.x:
--   Without ORDER BY inside OVER(): entire partition.
--   With ORDER BY but no explicit frame:
--       RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
--   RANGE includes ties on the ORDER BY value; ROWS counts rows.
--   An explicit full-partition frame can prevent running behavior
--   even when ORDER BY appears inside OVER().
--
-- ORDER BY inside OVER() does NOT make every window function cumulative:
--   ROW_NUMBER(), RANK(), DENSE_RANK() use it to assign positions/ranks.
--   LAG() and LEAD() use it to find previous/next values.
--
-- A useful analytical workflow:
--   Define what one row represents -> aggregate if necessary ->
--   choose partition -> choose calculation order -> choose frame if needed ->
--   add window function -> validate -> choose final display order.
