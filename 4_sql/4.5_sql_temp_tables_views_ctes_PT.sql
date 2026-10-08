-- ============================================================
-- SQL TEMPORARY TABLES, VIEWS AND CTEs
-- Bank database
-- ============================================================

USE bank;


-- ============================================================
-- 1. WHY INTERMEDIATE RESULTS MATTER
-- ============================================================

-- Complex SQL queries are easier to build when we separate
-- the problem into smaller pieces.
--
-- General workflow:
--
--   BUILD
--     ↓
--   VALIDATE
--     ↓
--   COMBINE
--     ↓
--   VALIDATE AGAIN
--
-- CTEs, Views and Temporary Tables help us organize
-- and reuse intermediate information in different ways.



-- ============================================================
-- 2. COMMON TABLE EXPRESSIONS (CTEs)
-- ============================================================

-- A CTE is a named result set that exists only while
-- the following SQL statement is being executed.
--
-- General syntax:
--
-- WITH cte_name AS (
--     SELECT ...
-- )
-- SELECT ...
-- FROM cte_name;


-- ============================================================
-- 3. ONE CTE
-- ============================================================

-- Business question:
--
-- Which accounts have made more transactions
-- than the average account?


-- Step 1:
-- Build the intermediate result first.

SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;


-- Validate:
--
-- - Do we have one row per account?
-- - Does transaction_count make sense?


-- Step 2:
-- Turn that query into a named CTE.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
)
SELECT *
FROM account_transactions;


-- Step 3:
-- Use the CTE in the final query.

WITH account_transactions AS (
    SELECT account_id,
           COUNT(*) AS transaction_count
    FROM trans
    GROUP BY account_id
)
SELECT account_id,
       transaction_count
FROM account_transactions
WHERE transaction_count > (
    SELECT AVG(transaction_count)
    FROM account_transactions
)
ORDER BY transaction_count DESC;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a CTE called account_totals that returns:
--
--       account_id
--       total_transaction_amount
--
--    using SUM(amount) from trans.

-- 2. Query the CTE and return only accounts whose
--    total_transaction_amount is greater than 100000.

-- 3. Before writing WITH, first run and validate
--    the query that will become the CTE.



-- ============================================================
-- 4. MULTIPLE CTEs
-- ============================================================

-- A query can define more than one CTE.
--
-- General syntax:
--
-- WITH cte_a AS (
--     ...
-- ),
-- cte_b AS (
--     ...
-- )
-- SELECT ...
-- FROM cte_a
-- JOIN cte_b
--     ON ...;


-- Business question:
--
-- Build an account report containing:
--
-- - number of transactions per account
-- - total amount borrowed per account


-- Piece A:
-- transactions per account

SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;


-- Piece B:
-- loan amount per account

SELECT account_id,
       SUM(amount) AS total_loan_amount
FROM loan
GROUP BY account_id;


-- Now name both pieces and combine them.

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


-- Think of the query as:
--
-- account_transactions
--        ↓
--      validate
--
-- account_loans
--        ↓
--      validate
--
-- account_transactions + account_loans
--        ↓
--       JOIN
--        ↓
--      validate


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a CTE called account_transactions containing:
--
--       account_id
--       transaction_count

-- 2. Create another CTE called account_orders containing:
--
--       account_id
--       number_of_orders
--
--    using the `order` table.

-- 3. Join both CTEs using account_id.

-- 4. Return:
--
--       account_id
--       transaction_count
--       number_of_orders

-- 5. Sort the result by transaction_count descending.



-- ============================================================
-- 5. CTE SCOPE
-- ============================================================

-- A CTE only exists for the statement immediately
-- following the WITH clause.

WITH loan_summary AS (
    SELECT account_id,
           SUM(amount) AS total_loan_amount
    FROM loan
    GROUP BY account_id
)
SELECT *
FROM loan_summary;


-- This would fail if executed as a new statement:
--
-- SELECT *
-- FROM loan_summary;
--
-- because the CTE no longer exists.



-- ============================================================
-- 6. VIEWS
-- ============================================================

-- A View is a saved query definition.
--
-- Unlike a CTE, it remains available in the database
-- after the original statement has finished.
--
-- General syntax:
--
-- CREATE VIEW view_name AS
-- SELECT ...


-- ============================================================
-- 7. CREATE A VIEW
-- ============================================================

-- Suppose we frequently need the number of transactions
-- for each account.

CREATE VIEW account_transaction_summary AS
SELECT account_id,
       COUNT(*) AS transaction_count
FROM trans
GROUP BY account_id;


-- Query the View as if it were a table.

SELECT *
FROM account_transaction_summary
LIMIT 20;


-- Reuse it in another query.

SELECT account_id,
       transaction_count
FROM account_transaction_summary
WHERE transaction_count > 100
ORDER BY transaction_count DESC;


-- The View stores the query definition.
--
-- If the underlying data changes, querying the View
-- reflects the current data.


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a View called account_loan_summary containing:
--
--       account_id
--       total_loan_amount
--
--    using SUM(amount).

-- 2. Query the View.

-- 3. Return only accounts whose total_loan_amount
--    is greater than 200000.



-- ============================================================
-- 8. INSPECTING AND REMOVING VIEWS
-- ============================================================

-- SHOW FULL TABLES can be useful to distinguish
-- regular tables from Views.

SHOW FULL TABLES;


-- Remove a View when it is no longer needed.

-- DROP VIEW account_transaction_summary;


-- If you run the script several times, the View may already exist.
-- You can remove it first and recreate it:
--
-- DROP VIEW IF EXISTS account_transaction_summary;



-- ============================================================
-- 9. TEMPORARY TABLES
-- ============================================================

-- A Temporary Table stores an intermediate result
-- physically for the current database session.
--
-- General syntax:
--
-- CREATE TEMPORARY TABLE temp_table_name AS
-- SELECT ...
--
-- It can then be reused in several independent statements
-- during the same session.



-- ============================================================
-- 10. CREATE A TEMPORARY TABLE
-- ============================================================

-- Build a temporary summary of transaction amounts.

CREATE TEMPORARY TABLE temp_account_transactions AS
SELECT account_id,
       SUM(amount) AS total_transaction_amount
FROM trans
GROUP BY account_id;


-- Query the temporary table.

SELECT *
FROM temp_account_transactions
LIMIT 20;


-- Reuse it in another statement.

SELECT account_id,
       total_transaction_amount
FROM temp_account_transactions
WHERE total_transaction_amount > 100000
ORDER BY total_transaction_amount DESC;


-- The table remains available during the current session.
--
-- It disappears automatically when the session ends.


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a Temporary Table called temp_account_loans
--    containing:
--
--       account_id
--       total_loan_amount

-- 2. Query it.

-- 3. Return only accounts whose total_loan_amount
--    is greater than 200000.

-- 4. Run another independent SELECT using the same
--    Temporary Table.



-- ============================================================
-- 11. REMOVE A TEMPORARY TABLE
-- ============================================================

DROP TEMPORARY TABLE IF EXISTS temp_account_transactions;


-- It is good practice to remove temporary objects
-- when they are no longer needed.



-- ============================================================
-- 12. CTE vs VIEW vs TEMPORARY TABLE
-- ============================================================

-- Ask:
--
-- Do I need this result only inside ONE statement?
--
--     YES
--      ↓
--     CTE
--
--
-- Do I want to save a QUERY DEFINITION
-- and reuse it later?
--
--     YES
--      ↓
--     VIEW
--
--
-- Do I want to MATERIALIZE an intermediate result
-- and reuse it in several statements during this session?
--
--     YES
--      ↓
--     TEMPORARY TABLE



-- ============================================================
-- 13. DO NOT USE A FEATURE JUST BECAUSE YOU CAN
-- ============================================================

-- This is valid:

WITH all_accounts AS (
    SELECT *
    FROM account
)
SELECT *
FROM all_accounts;


-- But this is simpler and clearer:

SELECT *
FROM account;


-- The CTE adds no useful structure here.
--
-- Use CTEs, Views and Temporary Tables when they
-- genuinely improve the organization or reuse of your SQL.



-- ============================================================
-- 14. SUBQUERY vs CTE
-- ============================================================

-- A simple subquery may be completely appropriate.

SELECT loan_id,
       amount
FROM loan
WHERE amount > (
    SELECT AVG(amount)
    FROM loan
);


-- A CTE becomes especially useful when:
--
-- - the intermediate result has meaning;
-- - giving it a name improves readability;
-- - the result is referenced more than once;
-- - the final query contains several logical pieces.



-- ============================================================
-- 15. COMPLETE WORKFLOW
-- ============================================================

-- When a query starts becoming complex:
--
-- 1. What is the final question?
--
-- 2. What pieces of information do I need?
--
-- 3. Can I calculate each piece independently?
--
-- 4. Build the first piece.
--
-- 5. Validate it.
--
-- 6. Build the next piece.
--
-- 7. Validate it.
--
-- 8. Decide how the pieces should be organized:
--
--       Subquery?
--       CTE?
--       View?
--       Temporary Table?
--
-- 9. Combine the pieces.
--
-- 10. Validate the final result.



-- ============================================================
-- FINAL CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. CTE
--
--    Create a CTE containing:
--
--       account_id
--       average_transaction_amount
--
--    Then return only accounts whose average transaction
--    amount is greater than 5000.


-- 2. TWO CTEs
--
--    Create:
--
--       CTE A -> number of transactions per account
--       CTE B -> total loan amount per account
--
--    Join them and return both metrics.


-- 3. VIEW
--
--    Create a View containing:
--
--       district_id
--       number_of_accounts
--
--    using the account table.
--
--    Then query the View and sort by number_of_accounts
--    descending.


-- 4. TEMPORARY TABLE
--
--    Create a Temporary Table containing:
--
--       account_id
--       average_transaction_amount
--
--    Query it in at least two separate SELECT statements.


-- 5. Explain which tool you would choose in each case:
--
--    A. A named intermediate result used only inside one query.
--
--    B. A query definition that should remain available
--       for future queries.
--
--    C. A materialized intermediate result needed by several
--       statements during the current session.


-- 6. Choose one SQL Quest business question that is becoming
--    difficult to read.
--
--    Break it into smaller pieces and decide whether a CTE,
--    View, Temporary Table or simple Subquery would make
--    the solution clearer.



-- ============================================================
-- SELF-LEARNING: RECURSIVE CTEs
-- ============================================================

-- CTEs can also be recursive.
--
-- Recursive CTEs are useful for problems such as:
--
-- - hierarchical data;
-- - organizational structures;
-- - parent/child relationships;
-- - iterative sequences.
--
-- They are powerful, but they are outside the core
-- objectives of this lesson.
