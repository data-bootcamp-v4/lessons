-- ============================================================
-- SQL WINDOW FUNCTIONS
-- Bank database
-- ============================================================

USE bank;


-- ============================================================
-- 1. GROUP BY: WHAT HAPPENS TO THE ROWS?
-- ============================================================

-- You already know how to aggregate data with GROUP BY.
--
-- Example: one average per loan status.

SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status;


-- GROUP BY collapses rows.
--
-- With GROUP BY, every selected column must either:
--
-- - appear in GROUP BY, or
-- - be aggregated.
--
-- Therefore, we cannot keep arbitrary individual loan rows
-- and also return the group summary in the same grouped result.


-- ============================================================
-- 2. FIRST WINDOW FUNCTION: OVER() WITHOUT PARTITION BY
-- ============================================================

-- Window Functions solve a different problem:
-- they preserve the individual rows.
--
-- Start with the simplest possible window:
--
-- OVER()
--
-- Empty OVER() means:
-- use all rows in the current result as one window.

SELECT loan_id,
       amount,
       AVG(amount) OVER () AS overall_average
FROM loan;


-- Compare this with:

SELECT AVG(amount) AS overall_average
FROM loan;


-- The aggregate query returns one row.
-- The Window Function keeps every loan row
-- and adds the overall average beside it.


-- We can also compare each row with the overall average.

SELECT loan_id,
       amount,
       AVG(amount) OVER () AS overall_average,
       amount - AVG(amount) OVER () AS difference_from_average
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Return every loan together with the maximum loan amount.
--
-- 2. Keep these individual columns visible:
--
--       loan_id
--       amount
--
-- 3. Add a column containing:
--
--       maximum amount - current loan amount
--
-- 4. Compare the number of rows returned by:
--
--       SELECT MAX(amount) FROM loan;
--
--    and the Window Function version.



-- ============================================================
-- 3. PARTITION BY: GROUPS WITHOUT COLLAPSING ROWS
-- ============================================================

-- Now suppose we do not want the overall average.
--
-- We want:
--
-- every loan
--     +
-- the average amount for loans with the SAME STATUS


-- First recall the GROUP BY solution:

SELECT status,
       AVG(amount) AS status_average
FROM loan
GROUP BY status;


-- This gives us one row per status.
--
-- But if we want to keep:
--
-- loan_id
-- status
-- amount
--
-- then GROUP BY cannot simply preserve those individual rows.


-- This is where PARTITION BY becomes useful.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
       ) AS status_average
FROM loan;


-- Conceptually:
--
-- GROUP BY status
--        ↓
-- one row per status
--
--
-- PARTITION BY status
--        ↓
-- all loan rows remain
-- but the Window Function calculates
-- separately inside each status


-- Several Window Functions can use the same partition.

SELECT loan_id,
       status,
       amount,
       AVG(amount) OVER (
           PARTITION BY status
       ) AS status_average,
       MIN(amount) OVER (
           PARTITION BY status
       ) AS status_minimum,
       MAX(amount) OVER (
           PARTITION BY status
       ) AS status_maximum
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Using GROUP BY, calculate the average loan amount
--    for each duration.
--
-- 2. Now use a Window Function to return:
--
--       loan_id
--       duration
--       amount
--       average amount for that duration
--
-- 3. Compare the number of rows returned by both queries.
--
-- 4. Explain why PARTITION BY allows us to keep loan_id
--    and amount while GROUP BY does not.


-- ============================================================
-- 4. ORDER BY INSIDE OVER()
-- ============================================================

-- ORDER BY inside OVER() determines the order
-- used by the Window Function.

-- Final ORDER BY determines how the result is displayed.

SELECT loan_id,
       amount,
       ROW_NUMBER() OVER (
           ORDER BY amount DESC
       ) AS row_number_by_amount
FROM loan
ORDER BY loan_id;


-- The Window Function ranks by amount.
-- The final result is displayed by loan_id.



-- ============================================================
-- 5. ROW_NUMBER()
-- ============================================================

SELECT loan_id,
       amount,
       ROW_NUMBER() OVER (
           ORDER BY amount DESC
       ) AS row_number
FROM loan;


-- Restart numbering inside each loan status.

SELECT loan_id,
       status,
       amount,
       ROW_NUMBER() OVER (
           PARTITION BY status
           ORDER BY amount DESC
       ) AS row_number_in_status
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Number all loans from shortest duration to longest.

-- 2. Restart the numbering for each status.

-- 3. Return:
--
--       loan_id
--       status
--       duration
--       row number within status



-- ============================================================
-- 6. RANK() AND DENSE_RANK()
-- ============================================================

-- ROW_NUMBER()
-- Every row receives a unique number.
--
-- RANK()
-- Equal values share a rank and gaps may appear.
--
-- DENSE_RANK()
-- Equal values share a rank but no gaps appear.

SELECT loan_id,
       amount,
       ROW_NUMBER() OVER (
           ORDER BY amount DESC
       ) AS row_number,
       RANK() OVER (
           ORDER BY amount DESC
       ) AS amount_rank,
       DENSE_RANK() OVER (
           ORDER BY amount DESC
       ) AS dense_amount_rank
FROM loan;


-- Rank inside each status.

SELECT loan_id,
       status,
       amount,
       RANK() OVER (
           PARTITION BY status
           ORDER BY amount DESC
       ) AS amount_rank_in_status
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Rank loans by duration using:
--
--       ROW_NUMBER()
--       RANK()
--       DENSE_RANK()
--
-- 2. Inspect rows where several loans have the same duration.
--
-- 3. Explain the difference between the three functions.



-- ============================================================
-- 7. LAG()
-- ============================================================

-- LAG() retrieves a value from a previous row
-- according to the order defined in the window.

SELECT account_id,
       date,
       LAG(date) OVER (
           ORDER BY date
       ) AS previous_account_date
FROM account;


-- The first row has no previous row,
-- so LAG() returns NULL.


-- Use the previous value in a calculation.

SELECT account_id,
       date,
       LAG(date) OVER (
           ORDER BY date
       ) AS previous_account_date,
       DATEDIFF(
           date,
           LAG(date) OVER (ORDER BY date)
       ) AS days_since_previous_account
FROM account;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Return every account together with the previous account_id
--    according to account creation date.

-- 2. Return:
--
--       account_id
--       date
--       previous_account_date
--
-- 3. Explain why the first row contains NULL.



-- ============================================================
-- 8. LAG() WITH PARTITION BY
-- ============================================================

-- LAG() can restart inside groups.
--
-- Example:
-- compare each transaction with the previous transaction
-- from the same account.

SELECT account_id,
       trans_id,
       date,
       amount,
       LAG(amount) OVER (
           PARTITION BY account_id
           ORDER BY date, trans_id
       ) AS previous_transaction_amount
FROM trans;


-- Conceptually:
--
-- PARTITION BY account_id
--          ↓
-- separate each account
--          ↓
-- ORDER BY date, trans_id
--          ↓
-- define transaction sequence
--          ↓
-- LAG(amount)
--          ↓
-- previous transaction amount


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Return each transaction together with the previous
--    transaction date for the same account.

-- 2. Add a column containing the difference between:
--
--       current amount - previous amount



-- ============================================================
-- 9. LEAD()
-- ============================================================

-- LEAD() follows the same idea as LAG(),
-- but accesses a following row.

SELECT account_id,
       date,
       LAG(date) OVER (
           ORDER BY date
       ) AS previous_account_date,
       LEAD(date) OVER (
           ORDER BY date
       ) AS next_account_date
FROM account;


-- LAG()  -> previous row
-- LEAD() -> following row



-- ============================================================
-- 10. CTE + WINDOW FUNCTION
-- ============================================================

-- Window Functions often work best after preparing
-- the correct level of detail first.
--
-- Example:
-- rank accounts by total loan amount.

-- Step 1: build the aggregated result.

SELECT account_id,
       SUM(amount) AS total_loan_amount
FROM loan
GROUP BY account_id;


-- Validate:
-- one row should now represent one account.


-- Step 2: wrap the result in a CTE.

WITH account_loan_totals AS (
    SELECT account_id,
           SUM(amount) AS total_loan_amount
    FROM loan
    GROUP BY account_id
)
SELECT *
FROM account_loan_totals;


-- Step 3: rank the prepared rows.

WITH account_loan_totals AS (
    SELECT account_id,
           SUM(amount) AS total_loan_amount
    FROM loan
    GROUP BY account_id
)
SELECT account_id,
       total_loan_amount,
       RANK() OVER (
           ORDER BY total_loan_amount DESC
       ) AS loan_rank
FROM account_loan_totals;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a CTE that returns:
--
--       account_id
--       transaction_count
--
--    from trans.

-- 2. Validate that one row represents one account.

-- 3. Rank accounts from highest to lowest transaction_count.

-- 4. Return:
--
--       account_id
--       transaction_count
--       rank



-- ============================================================
-- 11. MONTHLY ANALYTICAL PATTERN WITH LAG()
-- ============================================================

-- Typical analytical workflow:
--
-- raw activity
--      ↓
-- aggregate by month
--      ↓
-- monthly metric
--      ↓
-- LAG(metric)
--      ↓
-- previous month metric
--
-- This pattern can be used for:
--
-- - Monthly Active Users (MAU)
-- - revenue change
-- - transaction volume change
-- - loan activity change


-- Example with the bank data:
-- count transactions by year and month first.

WITH monthly_transactions AS (
    SELECT DATE_FORMAT(CONVERT(date, DATE), '%Y-%m') AS month,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY DATE_FORMAT(CONVERT(date, DATE), '%Y-%m')
)
SELECT month,
       transaction_count,
       LAG(transaction_count) OVER (
           ORDER BY month
       ) AS previous_month_transactions
FROM monthly_transactions;


-- Extend the calculation to absolute change.

WITH monthly_transactions AS (
    SELECT DATE_FORMAT(CONVERT(date, DATE), '%Y-%m') AS month,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY DATE_FORMAT(CONVERT(date, DATE), '%Y-%m')
)
SELECT month,
       transaction_count,
       LAG(transaction_count) OVER (
           ORDER BY month
       ) AS previous_month_transactions,
       transaction_count
           - LAG(transaction_count) OVER (
                 ORDER BY month
             ) AS monthly_change
FROM monthly_transactions;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Build a monthly summary of total transaction amount.

-- 2. Use LAG() to return the previous month's total.

-- 3. Add a column containing:
--
--       current month total - previous month total



-- ============================================================
-- 12. COMPLETE WINDOW FUNCTION WORKFLOW
-- ============================================================

-- Before writing the final query:
--
-- 1. What is the business question?
--
-- 2. What should ONE ROW represent?
--
-- 3. Do I need aggregation first?
--
-- 4. Build the base query.
--
-- 5. Validate.
--
-- 6. Which rows belong to the same analytical group?
--       -> PARTITION BY
--
-- 7. Does the calculation need an order?
--       -> ORDER BY inside OVER()
--
-- 8. Which Window Function solves the problem?
--
-- 9. Add ONE Window Function.
--
-- 10. Validate again.



-- ============================================================
-- FINAL CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Return every loan together with:
--
--       loan_id
--       status
--       amount
--       average amount for that status
--
--    Preserve every loan row.


-- 2. Rank loans by amount within each status using RANK().


-- 3. Repeat the previous exercise using DENSE_RANK().
--    Compare the results when ties occur.


-- 4. For each account, retrieve its transactions together with
--    the previous transaction amount using LAG().


-- 5. Create a CTE with one row per account containing:
--
--       account_id
--       total transaction amount
--
--    Then rank accounts by that total using a Window Function.


-- 6. Build a monthly transaction count and compare each month
--    with the previous month using LAG().


-- 7. Choose one SQL Quest business question for which
--    preserving individual rows while adding analytical context
--    would be useful.
--
--    Document:
--
--       what one row should represent
--       whether aggregation is needed first
--       whether PARTITION BY is needed
--       whether ORDER BY inside OVER() is needed
--       which Window Function is appropriate



-- ============================================================
-- SELF-LEARNING: NTILE()
-- ============================================================

-- NTILE(n) divides ordered rows into approximately equal-sized
-- groups or "buckets".
--
-- Example:

SELECT loan_id,
       amount,
       NTILE(4) OVER (
           ORDER BY amount
       ) AS amount_bucket
FROM loan;


-- Important:
--
-- NTILE(2) does NOT calculate the median.
--
-- It divides the ordered rows into two approximately
-- equal-sized groups.



-- ============================================================
-- SELF-LEARNING: WINDOW FRAMES
-- ============================================================

-- Window Frames define more precisely which nearby rows
-- participate in a calculation.
--
-- They are useful for:
--
-- - running totals
-- - moving averages
-- - rolling calculations
--
-- Example syntax:
--
-- ROWS BETWEEN ...
-- AND ...
--
-- They are not required for the core exercises in this lesson.
--
-- For simple previous-period comparisons, LAG() is enough.
