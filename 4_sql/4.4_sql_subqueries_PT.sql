-- ============================================================
-- SQL SUBQUERIES
-- Bank database
-- ============================================================

USE bank;


-- ============================================================
-- 1. WHY DO WE NEED SUBQUERIES?
-- ============================================================

-- Sometimes one query needs the result produced by another query.
--
-- Example business question:
--
-- Which loans have an amount greater than the average loan amount?
--
-- First, we need to know the average loan amount.

SELECT ROUND(AVG(amount), 2) AS average_loan_amount
FROM loan;


-- If we manually copied that result into another query, it might work today...
--
-- SELECT loan_id,
--        amount
-- FROM loan
-- WHERE amount > 145000;
--
-- ...but the data can change.
--
-- In an OLTP database, new rows may appear continuously.
-- A hard-coded value that is correct now may be wrong later.
--
-- Better:
-- let SQL calculate the current value every time the query runs.


-- ============================================================
-- 2. SCALAR SUBQUERY
--    A SUBQUERY THAT RETURNS ONE VALUE
-- ============================================================

-- Step 1: inner query

SELECT AVG(amount)
FROM loan;


-- Step 2: outer query with a fixed value

SELECT loan_id,
       amount
FROM loan
WHERE amount > 145000;


-- Step 3: replace the fixed value with the inner query

SELECT loan_id,
       amount
FROM loan
WHERE amount > (
    SELECT AVG(amount)
    FROM loan
);


-- Conceptually:
--
-- INNER QUERY
--     ↓
-- one value
--     ↓
-- OUTER QUERY


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Retrieve the loan or loans with the maximum amount.
--
--    First write and run the query that returns the maximum amount.
--    Then use it as a scalar subquery.

-- 2. Retrieve all loans whose duration is greater than the
--    average loan duration.

-- 3. Before embedding the subquery, run it independently
--    and verify that it returns exactly one value.



-- ============================================================
-- 3. SCALAR SUBQUERIES WITH AGGREGATION
-- ============================================================

-- Business question:
--
-- Which loan statuses have an average loan amount greater than
-- the overall average loan amount?

-- Step 1: overall average

SELECT AVG(amount) AS overall_average
FROM loan;


-- Step 2: average for each status

SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status;


-- Step 3: compare each group against the scalar subquery

SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status
HAVING AVG(amount) > (
    SELECT AVG(amount)
    FROM loan
)
ORDER BY average_amount DESC;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Calculate the average loan duration for all loans.

-- 2. Calculate the average duration for each loan status.

-- 3. Return only the statuses whose average duration
--    is greater than the overall average duration.



-- ============================================================
-- 4. SUBQUERY OUTPUT SHAPE
-- ============================================================

-- The operator used by the outer query depends on
-- what the subquery returns.
--
-- ONE VALUE
--    ↓
-- scalar subquery
--    ↓
-- =  >  <  >=  <=  <>
--
--
-- SEVERAL VALUES
--    ↓
-- multiple-value subquery
--    ↓
-- IN (...)
--
--
-- TABLE
--    ↓
-- inline view / derived table
--    ↓
-- FROM (subquery) AS alias



-- ============================================================
-- 5. MULTIPLE-VALUE SUBQUERY
--    A SUBQUERY THAT RETURNS A LIST
-- ============================================================

-- Business question:
--
-- Which accounts belong to districts in Central Bohemia?

-- Step 1: find the district IDs

SELECT A1
FROM district
WHERE A3 = 'central Bohemia';


-- This query may return several values.
--
-- Therefore, the outer query should not use:
--
-- WHERE district_id = (...)
--
-- Instead, use IN.


-- Step 2: use the list of district IDs

SELECT account_id,
       district_id
FROM account
WHERE district_id IN (
    SELECT A1
    FROM district
    WHERE A3 = 'central Bohemia'
);


-- Conceptually:
--
-- INNER QUERY
--     ↓
-- list of district IDs
--     ↓
-- OUTER QUERY
--     ↓
-- WHERE district_id IN (...)


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Find the district IDs belonging to Prague.

-- 2. Use those district IDs in a subquery to retrieve
--    the corresponding clients.

-- 3. Run the inner query first.
--    How many values does it return?

-- 4. Explain why IN is appropriate here.



-- ============================================================
-- 6. BUILD SUBQUERIES FROM THE INSIDE OUT
-- ============================================================

-- Good workflow:
--
-- 1. Identify what the outer query needs.
-- 2. Write the inner query.
-- 3. Run it independently.
-- 4. Inspect the result.
-- 5. Determine its shape:
--       one value
--       several values
--       table
-- 6. Embed it.
-- 7. Run the outer query.
-- 8. Validate again.


-- ============================================================
-- 7. INLINE VIEW
--    A SUBQUERY THAT RETURNS A TABLE
-- ============================================================

-- A subquery can also appear in FROM.
--
-- In that case, the subquery result behaves like a table.
--
-- IMPORTANT:
-- a derived table MUST have a unique alias.


-- Step 1: build a table-like result

SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status;


-- Step 2: use that result as a derived table

SELECT s.status,
       s.average_amount
FROM (
    SELECT status,
           AVG(amount) AS average_amount
    FROM loan
    GROUP BY status
) AS s
WHERE s.average_amount > 150000;


-- Conceptually:
--
-- INNER QUERY
--     ↓
-- returns a table
--     ↓
-- AS s
--     ↓
-- OUTER QUERY
-- reads from that derived table


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create an inner query that returns:
--
--       duration
--       average_amount
--
--    grouped by loan duration.

-- 2. Use that result as an inline view.

-- 3. Give the derived table a unique alias.

-- 4. In the outer query, keep only rows whose
--    average_amount is greater than 150000.



-- ============================================================
-- 8. WHY INLINE VIEWS NEED AN ALIAS
-- ============================================================

-- This is valid:

SELECT s.status,
       s.average_amount
FROM (
    SELECT status,
           AVG(amount) AS average_amount
    FROM loan
    GROUP BY status
) AS s;


-- The alias "s" gives the derived table a name.
--
-- The outer query can then refer to:
--
-- s.status
-- s.average_amount
--
-- Think of it as:
--
-- subquery result
--      ↓
-- temporary table
--      ↓
-- needs a table name
--      ↓
-- alias



-- ============================================================
-- 9. SUBQUERY VS JOIN
-- ============================================================

-- Some problems can be solved with either a subquery or a JOIN.
--
-- Example:
-- Accounts from Central Bohemia.


-- Version 1: subquery

SELECT account_id,
       district_id
FROM account
WHERE district_id IN (
    SELECT A1
    FROM district
    WHERE A3 = 'central Bohemia'
);


-- Version 2: JOIN

SELECT a.account_id,
       a.district_id
FROM account AS a
INNER JOIN district AS d
    ON a.district_id = d.A1
WHERE d.A3 = 'central Bohemia';


-- Do not assume that one method is always better.
--
-- First ask:
--
-- Which version is easier to understand?
-- Which version expresses the problem more naturally?
-- Which version is easier to validate?
--
-- Performance may also matter in real systems,
-- but that depends on indexes, data size and the query optimizer.



-- ============================================================
-- 10. DO NOT HARD-CODE QUERY RESULTS
-- ============================================================

-- Avoid this pattern:

-- SELECT *
-- FROM loan
-- WHERE amount > 145000;


-- if 145000 was obtained by running:

-- SELECT AVG(amount)
-- FROM loan;


-- The database may change.
--
-- New loans may be inserted.
-- Existing values may be updated.
-- The average may change.
--
-- Better:

SELECT loan_id,
       amount
FROM loan
WHERE amount > (
    SELECT AVG(amount)
    FROM loan
);


-- This query always compares against the CURRENT average.
--
-- General principle:
--
-- DATA CHANGES
--      ↓
-- DERIVED VALUES CHANGE
--      ↓
-- DO NOT HARD-CODE THEM


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Explain why this is fragile:
--
--    WHERE amount > 145000
--
--    if 145000 was calculated from the database.

-- 2. Rewrite the logic so the comparison always uses
--    the current average loan amount.



-- ============================================================
-- 11. COMBINING SUBQUERIES WITH WHERE AND HAVING
-- ============================================================

-- WHERE filters individual rows.

SELECT loan_id,
       amount
FROM loan
WHERE amount > (
    SELECT AVG(amount)
    FROM loan
);


-- HAVING filters aggregated groups.

SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status
HAVING AVG(amount) > (
    SELECT AVG(amount)
    FROM loan
);


-- The subquery only supplies a value.
--
-- WHERE and HAVING still keep their original meanings.



-- ============================================================
-- 12. VALIDATING SUBQUERIES
-- ============================================================

-- A subquery can run without syntax errors and still be wrong.
--
-- Validate:
--
-- - What does the inner query return?
-- - One value, several values or a table?
-- - Does that result make sense?
-- - Is the outer operator compatible with that shape?
-- - Does the final result answer the business question?


-- ============================================================
-- FINAL CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Retrieve all loans whose amount is greater than
--    the average loan amount.
--
--    Build the inner query first.


-- 2. Retrieve all loans whose duration is equal to
--    the maximum loan duration.


-- 3. Retrieve all clients from districts in Prague
--    using a multiple-value subquery.


-- 4. Build an inline view that calculates:
--
--       status
--       average_amount
--
--    Then use an outer query to keep only rows
--    where average_amount is greater than 150000.


-- 5. For each exercise above, identify whether
--    the subquery returns:
--
--       one value
--       several values
--       a table


-- 6. Choose one business question from your SQL Quest
--    that could naturally be solved using a subquery.
--
--    Document:
--
--       what the outer query needs
--       what the inner query should return
--       the expected output shape
--
--    Then build and test the inner query before embedding it.



-- ============================================================
-- SELF-LEARNING: NESTED SUBQUERIES
-- ============================================================

-- A subquery can contain another subquery.
--
-- Conceptually:
--
-- OUTER QUERY
--     ↓
-- SUBQUERY
--     ↓
-- SUBQUERY
--
-- Build from the innermost query outward.
--
-- Test each level independently before adding another layer.
--
-- Deep nesting can become difficult to read,
-- so use it only when it genuinely helps express the problem.



-- ============================================================
-- SELF-LEARNING: CORRELATED SUBQUERIES
-- ============================================================

-- Most subqueries in this lesson are non-correlated.
--
-- They can run independently:
--
-- SELECT AVG(amount)
-- FROM loan;
--
-- A correlated subquery is different:
-- it depends on a value from the current row
-- of the outer query.
--
-- These are often used with EXISTS.
--
-- They are an important SQL concept,
-- but they are beyond the core objectives of this session.
