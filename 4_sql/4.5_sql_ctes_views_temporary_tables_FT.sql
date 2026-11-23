-- ============================================================================
-- SQL: COMMON TABLE EXPRESSIONS, VIEWS AND TEMPORARY TABLES
-- Database: Czech Bank (MySQL 8.x)
-- ============================================================================

USE bank;

-- LEARNING GOALS
-- 1. Break a complex question into smaller, testable SQL queries.
-- 2. Write one CTE and combine multiple CTEs.
-- 3. Create and reuse a View and a Temporary Table.
-- 4. Choose the simplest appropriate strategy for each problem.

-- ============================================================================
-- 1. FROM SUBQUERIES TO CTEs
-- ============================================================================

-- Business question: Which accounts have more than 100 transactions?
-- We already know how to calculate transaction counts using GROUP BY.
-- First, write the simplest possible query.

SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id
LIMIT 10;

-- We could put this calculation inside a derived table (a subquery in FROM).
-- Remember: every derived table in FROM needs an alias in MySQL.

SELECT account_counts.account_id,
       account_counts.transaction_count
FROM (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
) AS account_counts
WHERE account_counts.transaction_count > 100;

-- A CTE gives that intermediate result a descriptive name.
-- WITH defines the CTE; the SELECT after it uses the CTE.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
)
SELECT account_id,
       transaction_count
FROM account_transactions
WHERE transaction_count > 100;

-- Python analogy: a lambda is a short-lived expression often used inline.
-- A CTE is also defined where it is needed, rather than being saved as a
-- permanent database object. But a lambda is a FUNCTION; a CTE is a named
-- RESULT SET, so the analogy concerns scope, not what the object represents.
-- A CTE exists only during the statement immediately following WITH.
-- This separate statement would fail:
-- SELECT * FROM account_transactions;

-- QUICK CHECK 1 (2-3 minutes)
-- Create a CTE called account_amounts containing account_id and
-- SUM(amount) AS total_amount from trans. Return only rows where
-- total_amount > 100000. First test the SELECT inside the CTE.


-- ============================================================================
-- 2. MULTIPLE CTEs: BUILD, VALIDATE, COMBINE
-- ============================================================================

-- Business question: For accounts with loans, show the number of
-- transactions and total loan amount. Each metric is calculated separately.

-- Piece A: one row per account with transactions.
SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id
LIMIT 10;

-- Piece B: one row per account with loans.
SELECT account_id,
       SUM(amount) AS total_loan_amount
FROM loan
GROUP BY account_id
LIMIT 10;

-- Both CTEs are defined after a SINGLE WITH keyword, separated by commas.
-- INNER JOIN keeps accounts appearing in both intermediate results.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
),
account_loans AS (
    SELECT account_id,
           SUM(amount) AS total_loan_amount
    FROM loan
    GROUP BY account_id
)
SELECT at.account_id,
       at.transaction_count,
       al.total_loan_amount
FROM account_transactions AS at
INNER JOIN account_loans AS al
    ON at.account_id = al.account_id
ORDER BY al.total_loan_amount DESC;

-- A later CTE can also refer to an earlier CTE.
-- Here, the second CTE adds a business rule to the first one.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
),
busy_accounts AS (
    SELECT account_id,
           transaction_count
    FROM account_transactions
    WHERE transaction_count >= 100
)
SELECT ba.account_id,
       ba.transaction_count,
       a.district_id
FROM busy_accounts AS ba
INNER JOIN account AS a
    ON ba.account_id = a.account_id
ORDER BY ba.transaction_count DESC;

-- VALIDATION QUESTIONS
-- What does one row represent in each CTE?
-- Does an INNER JOIN exclude accounts with no loans or transactions?
-- Would LEFT JOIN be better if we needed ALL accounts with transactions?

-- QUICK CHECK 2 (3-4 minutes)
-- Write TWO CTEs:
--   account_transactions: transaction count per account (from trans)
--   account_orders: order count per account (from `order`)
-- Join them by account_id and display both counts.
-- Note: `order` is a reserved SQL keyword; use backticks.


-- ============================================================================
-- 3. VIEWS: SAVE THE QUERY DEFINITION
-- ============================================================================

-- Suppose other reports need transaction counts per account.
-- A View saves a SELECT definition in the database, not a fixed snapshot
-- of its result. It remains available across statements and sessions.
-- A normal MySQL View does not store its own result rows.

DROP VIEW IF EXISTS account_transaction_summary_ft;

CREATE VIEW account_transaction_summary_ft AS
SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;

-- Query the View as though it were a table.
SELECT *
FROM account_transaction_summary_ft
ORDER BY transaction_count DESC
LIMIT 10;

-- Reuse the same definition in a different query.
SELECT a.district_id,
       AVG(v.transaction_count) AS avg_transactions_per_account
FROM account_transaction_summary_ft AS v
INNER JOIN account AS a
    ON v.account_id = a.account_id
GROUP BY a.district_id
ORDER BY avg_transactions_per_account DESC
LIMIT 10;

-- The View definition persists until DROP VIEW is executed.
-- Its query is evaluated against the underlying data when used.
-- SHOW CREATE VIEW account_transaction_summary_ft;

-- QUICK CHECK 3 (2-3 minutes)
-- Create a View called account_loan_summary_ft with account_id and
-- SUM(amount) AS total_loan_amount from loan. Query accounts whose
-- total_loan_amount exceeds 200000.
-- Remember to use DROP VIEW IF EXISTS before CREATE VIEW.


-- ============================================================================
-- 4. TEMPORARY TABLES: REUSE STORED INTERMEDIATE DATA
-- ============================================================================

-- A Temporary Table stores a result that is accessible through separate
-- statements in the CURRENT database session only.
-- Unlike a View, it does NOT automatically refresh when source data changes.

DROP TEMPORARY TABLE IF EXISTS temp_account_transactions_ft;

CREATE TEMPORARY TABLE temp_account_transactions_ft AS
SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;

-- First statement: inspect the stored result.
SELECT *
FROM temp_account_transactions_ft
LIMIT 10;

-- Second statement: reuse the same rows for a different question.
SELECT account_id,
       transaction_count
FROM temp_account_transactions_ft
WHERE transaction_count > 100
ORDER BY transaction_count DESC;

-- IMPORTANT: VIEW vs TEMPORARY TABLE (SAME BUSINESS METRIC)
-- Both objects above calculate transaction_count per account.
-- The View stores the SELECT definition; the Temporary Table stores
-- the rows calculated at the time CREATE TEMPORARY TABLE runs.
--
-- VISUAL COMPARISON (illustrative numbers, not actual bank data)
--
--                           VIEW                 TEMPORARY TABLE
--                       (query definition)      (stored snapshot)
--                              |                        |
-- Source data: 50 tx     SELECT -> 50           SELECT -> 50
--                              |                        |
-- Source adds 10 tx            v                        v
-- Source data: 60 tx     SELECT -> 60           SELECT -> 50
--                                                (until refreshed)
--
-- A View recalculates from the current source data when queried.
-- A Temporary Table does not automatically update when trans changes.
-- You can explicitly INSERT/UPDATE its rows or recreate it.
--
-- PYTHON / PANDAS ANALOGY
--
-- def count_transactions(df):
--     return df.groupby("account_id").size()
--
-- transaction_counts = count_transactions(df)
--
-- After df changes:
--   count_transactions(df)  # computes a new result, like querying a View
--   transaction_counts      # keeps the old result, like a Temporary Table
--
-- KEY DEFINITION
-- A VIEW STORES THE QUERY DEFINITION; A TEMPORARY TABLE STORES
-- THE QUERY RESULTS AT THE TIME OF CREATION.
--
-- Note: both comparisons assume that source data changes are committed
-- and visible to the session executing the SELECT.

-- The table disappears when the session ends, or we can remove it now.
DROP TEMPORARY TABLE IF EXISTS temp_account_transactions_ft;

-- QUICK CHECK 4 (2-3 minutes)
-- Create temp_account_loans_ft with account_id and total loan amount.
-- Query it in TWO independent SELECT statements, using different filters.
-- Then drop it. Make your code safe to rerun.


-- ============================================================================
-- 5. FINAL CHALLENGE: CHOOSE AND COMBINE
-- ============================================================================

-- Business question: Identify districts with at least 100 accounts, and
-- report the number of accounts and the average loan amount per district.
-- Build and validate the intermediate pieces before combining them.
-- Suggested approach (no solution provided):
--   1. One CTE: account counts by district (from account).
--   2. Another CTE: average loan amount by district
--      (JOIN loan to account; GROUP BY district_id).
--   3. JOIN both CTEs and filter districts with >= 100 accounts.
--   4. Sort by average loan amount descending.
-- Think: What happens to districts without loans if you use INNER JOIN?

-- REFLECTION: WHICH STRATEGY WOULD YOU USE?
-- A. A named intermediate result inside one complex SELECT.
-- B. A reusable query definition for reports next week.
-- C. A snapshot of calculated data reused across statements in one session.
-- D. A simple AVG() in a WHERE subquery, used only once.
-- Not every problem needs a CTE, View, or Temporary Table.


-- ============================================================================
-- 6. COMPARISON: WHEN SHOULD I USE EACH STRATEGY?
-- ============================================================================

-- FEATURE                    CTE                 VIEW               TEMPORARY TABLE
-- ---------------------------------------------------------------------------------
-- Defined with               WITH                CREATE VIEW        CREATE TEMPORARY TABLE
-- Available for              One statement       Until dropped      Current session
-- Reuse in later statements  No                  Yes                Yes (same session)
-- Stores result rows         Not guaranteed*     No (normal View)   Yes
-- Reflects source changes    On next execution   On next query      No automatic refresh
-- Best for                   Readable multi-step Reusable SQL logic Reused intermediate data
--                            queries
--
-- * MySQL's optimizer may merge or materialize a CTE internally.
--   A CTE does not guarantee that results are physically stored.
--
-- DECISION GUIDE
-- Need an intermediate result within ONE statement?          -> CTE
-- Need a saved query definition across sessions?             -> VIEW
-- Need stored intermediate rows for this session?            -> TEMPORARY TABLE
-- Need only a simple one-off calculation?                     -> SUBQUERY or SELECT
--
-- Performance is NOT automatically better with any one option.
-- Choose for clarity, scope and reuse first; measure performance if needed.

-- ============================================================================
-- 7. TAKEAWAYS AND CLEANUP
-- ============================================================================

-- 1. A CTE names a result set for a single SQL statement.
-- 2. Multiple CTEs share one WITH clause; later CTEs can use earlier ones.
-- 3. Validate each intermediate SELECT before combining results.
-- 4. A View saves a query definition and reflects current source data.
--    A Temporary Table stores a snapshot until you explicitly change it.
-- 5. Choose a tool based on lifetime, reuse and readability.
-- 6. Use DROP IF EXISTS to make demonstrations easier to rerun.

-- Clean up the View created in this demonstration.
-- If you completed Quick Check 3, also remove its View when finished.
DROP VIEW IF EXISTS account_transaction_summary_ft;

-- Optional cleanup after Quick Checks:
-- DROP VIEW IF EXISTS account_loan_summary_ft;
-- DROP TEMPORARY TABLE IF EXISTS temp_account_loans_ft;
