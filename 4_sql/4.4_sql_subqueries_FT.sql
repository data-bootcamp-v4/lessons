-- ============================================================
-- SQL SUBQUERIES
-- Bank database | MySQL 8.x
-- ============================================================

USE bank;

-- ============================================================
-- 1. WHY DO WE NEED SUBQUERIES?
-- ============================================================

-- Business question: Which loans are larger than the average loan?
-- We can calculate the average first:

SELECT ROUND(AVG(amount), 2) AS average_loan_amount
FROM loan;

-- We could copy the result into WHERE, but that would hard-code
-- a value that may become outdated when the data changes.
-- Instead, SQL can calculate the comparison value dynamically.

-- ============================================================
-- 2. SCALAR SUBQUERIES: ONE VALUE
-- ============================================================

-- Build the inner query first, then insert it into the outer query.
-- The inner query below returns exactly one value.

SELECT loan_id,
       amount
FROM loan
WHERE amount > (
    SELECT AVG(amount)
    FROM loan
)
ORDER BY amount DESC;

-- The comparison works because > expects a single value.
-- Pandas connection: compare a Series with a calculated scalar:
-- df.loc[df['amount'] > df['amount'].mean(), ['loan_id', 'amount']]
-- Notice: no rounding inside the comparison. Rounding is for display.

-- CHECK FOR UNDERSTANDING
-- 1. Find the loan(s) with the largest amount.
--    First calculate MAX(amount), then use it in a subquery.
-- 2. Find loans whose duration exceeds the average duration.

-- ============================================================
-- 3. SUBQUERIES WITH GROUP BY AND HAVING
-- ============================================================

-- Business question: Which loan statuses have an average loan
-- amount greater than the overall average loan amount?
-- Step 1: calculate the overall average.

SELECT AVG(amount) AS overall_average
FROM loan;

-- Step 2: calculate the average for each status.

SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status;

-- Step 3: compare each group with the overall average.

SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status
HAVING AVG(amount) > (
    SELECT AVG(amount)
    FROM loan
)
ORDER BY average_amount DESC;

-- WHERE filters rows; HAVING filters groups.
-- A scalar subquery can supply a comparison value to either.
-- Pandas connection: compare grouped means with the overall mean.

-- CHECK FOR UNDERSTANDING
-- Return the loan statuses whose average duration exceeds
-- the overall average loan duration.

-- ============================================================
-- 4. SUBQUERIES RETURNING MULTIPLE VALUES: IN
-- ============================================================

-- Business question: Which accounts belong to districts in
-- Central Bohemia? A region may contain several districts.
-- Step 1: find the district IDs in the requested region.

SELECT A1 AS district_id
FROM district
WHERE A3 = 'central Bohemia';

-- Step 2: use those IDs to filter accounts.

SELECT account_id,
       district_id
FROM account
WHERE district_id IN (
    SELECT A1
    FROM district
    WHERE A3 = 'central Bohemia'
)
ORDER BY account_id;

-- The subquery returns one COLUMN but potentially many ROWS.
-- IN checks whether district_id belongs to that set of values.
-- Pandas connection: df['district_id'].isin(district_ids)
-- A subquery used with IN does not need a table alias.

-- CHECK FOR UNDERSTANDING
-- 1. Find the district IDs belonging to Prague.
-- 2. Retrieve clients living in those districts using IN.
-- 3. Run the inner query separately and inspect its results.

-- ============================================================
-- 5. SUBQUERIES IN FROM: DERIVED TABLES
-- ============================================================

-- Sometimes we need to calculate a result that itself has
-- several rows and columns, then query that result as a table.
-- Business question: What is the average number of transactions
-- per account? We must count transactions for each account first.

-- Step 1: create one row per account with its transaction count.

SELECT account_id,
       COUNT(*) AS number_of_transactions
FROM trans
GROUP BY account_id;

-- Step 2: use that result as a derived table in FROM.

SELECT ROUND(AVG(t.number_of_transactions), 2)
           AS average_transactions_per_account
FROM (
    SELECT account_id,
           COUNT(*) AS number_of_transactions
    FROM trans
    GROUP BY account_id
) AS t;

-- IMPORTANT: In MySQL, every derived table in FROM needs an alias
-- (AS t here), even if the inner query returns only one column.
-- It is the LOCATION of the subquery, not the number of columns,
-- that determines this alias requirement.
-- Pandas connection: groupby(...).size(), then mean() on the result.
-- This average includes accounts present in trans; accounts with
-- zero transactions are not included in the inner result.

-- CHECK FOR UNDERSTANDING
-- 1. Calculate average loan amount for each loan duration.
-- 2. Put that query in FROM and name the derived table s.
-- 3. Return only durations with an average amount above 150000.

-- ============================================================
-- 6. SUBQUERY VS JOIN
-- ============================================================

-- We can often answer the same question in different ways.
-- Example: accounts in Central Bohemia.

-- Approach A: subquery. The inner query supplies district IDs.

SELECT account_id,
       district_id
FROM account
WHERE district_id IN (
    SELECT A1
    FROM district
    WHERE A3 = 'central Bohemia'
);

-- Approach B: JOIN. Combine accounts with district information.

SELECT a.account_id,
       a.district_id
FROM account AS a
INNER JOIN district AS d
    ON a.district_id = d.A1
WHERE d.A3 = 'central Bohemia';

-- Neither method is automatically faster in every situation.
-- Prefer a clear query, verify the results, and investigate
-- performance only when necessary.
-- Note that JOINs can duplicate rows if the matching key on
-- the other side is not unique; always consider cardinality.

-- CHECK FOR UNDERSTANDING
-- Explain which version you find easier to read and why.
-- Compare the returned account IDs to validate both versions.

-- ============================================================
-- 7. A RELIABLE SUBQUERY WORKFLOW
-- ============================================================

-- 1. Identify the business question.
-- 2. Decide what information the outer query needs.
-- 3. Write and execute the inner query independently.
-- 4. Inspect its output: one value, a set of values, or a table.
-- 5. Choose the correct SQL construct:
--       one value      -> =, >, <, >=, <=, <>
--       several values -> IN (...)
--       table          -> FROM (...) AS alias
-- 6. Embed the inner query and execute the complete query.
-- 7. Validate that the result answers the original question.

-- ============================================================
-- FINAL CHALLENGE
-- ============================================================

-- Prepare a short loan analysis using the bank database.
-- A. List loans with amounts above the overall average.
-- B. Show statuses whose average loan amount exceeds the
--    overall average loan amount.
-- C. Use a derived table to find loan durations with an
--    average loan amount above 150000.
-- D. For each query, explain what the subquery returns and
--    why the outer query can use that result.

-- ============================================================
-- TAKEAWAYS
-- ============================================================

-- * A subquery is a query nested inside another SQL query.
-- * Build and test the inner query first.
-- * Scalar subqueries return one value for comparisons.
-- * IN accepts a set of values from a one-column subquery.
-- * A subquery in FROM is a derived table and requires an alias.
-- * WHERE filters rows; HAVING filters aggregated groups.
-- * A JOIN and a subquery can sometimes solve the same problem.
-- * Always validate both the inner and the complete query.

-- OPTIONAL SELF-LEARNING
-- Nested and correlated subqueries (including EXISTS) are useful
-- advanced patterns, but are not required for this introduction.
