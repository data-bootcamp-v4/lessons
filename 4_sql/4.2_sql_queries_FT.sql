-- ============================================================
-- SQL QUERIES: FILTERING, TRANSFORMING AND AGGREGATING
-- Database: Czech Bank (bank) | MySQL 8.x
-- ============================================================
-- GOAL
-- Build useful queries by combining calculated columns, filters,
-- functions, grouping and aggregation.
-- Learning path: calculate -> filter -> transform -> aggregate.
--
-- PREREQUISITES
-- SELECT, FROM, LIMIT, AS, DISTINCT and COUNT.

USE bank;

-- ============================================================
-- 1. CALCULATED COLUMNS
-- ============================================================
-- Arithmetic expressions can create new columns in query results.
-- They do not modify the underlying table.

SELECT loan_id,
       amount,
       payments,
       amount - payments AS amount_minus_payment,
       ROUND(amount / duration, 2) AS amount_per_month
FROM loan
LIMIT 10;

-- PANDAS CONNECTION
-- df["amount_minus_payment"] = df["amount"] - df["payments"]
-- df["amount_per_month"] = (df["amount"] / df["duration"]).round(2)
-- Note: amount - payments is only an arithmetic illustration;
-- it is NOT the remaining balance of a loan. 'payments' is a
-- scheduled payment amount, not the total amount repaid.

-- QUICK CHECK 1
-- Display loan_id, amount and duration, plus a calculated column
-- named amount_per_year: amount / (duration / 12).
-- Round the calculated value to two decimal places.


-- ============================================================
-- 2. FILTERING ROWS: WHERE
-- ============================================================
-- WHERE keeps rows that satisfy a condition.
-- Common comparisons: =, <>, >, >=, <, <=.

SELECT loan_id, account_id, status, amount
FROM loan
WHERE status = 'B';

SELECT loan_id, account_id, status, amount
FROM loan
WHERE amount > 100000;

-- PANDAS CONNECTION
-- df.loc[df["amount"] > 100000, ["loan_id", "account_id", "amount"]]

-- Combining conditions: AND, OR, NOT.
-- Parentheses make the intended logic explicit.

SELECT loan_id, status, amount, duration
FROM loan
WHERE (status = 'B' OR status = 'D')
  AND amount > 100000;

-- IN is a compact alternative to repeated OR comparisons.
SELECT loan_id, status, amount, duration
FROM loan
WHERE status IN ('B', 'D')
  AND duration <= 24;

-- PANDAS CONNECTION
-- df.loc[df["status"].isin(["B", "D"]) & (df["duration"] <= 24)]

-- QUICK CHECK 2
-- Retrieve loans with status A or C and an amount above 150000.
-- Display loan_id, status, amount and duration.


-- ============================================================
-- 3. RANGES AND TEXT PATTERNS
-- ============================================================
-- BETWEEN includes both endpoints.

SELECT loan_id, amount
FROM loan
WHERE amount BETWEEN 100000 AND 200000;

-- LIKE uses % (any number of characters) and _ (one character).
SELECT A2 AS district_name
FROM district
WHERE A2 LIKE 'K%';

-- REGEXP supports richer patterns, as in Python regular expressions.
-- ^ means start of string; $ means end of string.
SELECT A2 AS district_name
FROM district
WHERE A2 REGEXP '^K';

-- PANDAS CONNECTION
-- df["A2"].str.startswith("K")
-- df["A2"].str.contains(r"^K", regex=True)

-- QUICK CHECK 3
-- 1. Find loans with amounts between 50000 and 100000.
-- 2. Find district names containing 'ov' using LIKE.
-- 3. BONUS: Rewrite the previous pattern using REGEXP.


-- ============================================================
-- 4. MISSING VALUES AND SORTING
-- ============================================================
-- NULL represents missing/unknown data. It is not an empty string.
-- Use IS NULL / IS NOT NULL, not = NULL.
-- The table name `order` is a reserved SQL word: use backticks.

SELECT order_id, account_id, k_symbol
FROM `order`
WHERE k_symbol IS NULL
LIMIT 10;

SELECT order_id, account_id, k_symbol
FROM `order`
WHERE k_symbol = ''
LIMIT 10;

-- ORDER BY sorts the result. ASC is the default; DESC reverses it.
SELECT loan_id, account_id, amount, duration
FROM loan
WHERE status IN ('B', 'D')
ORDER BY amount DESC, duration ASC
LIMIT 10;

-- PANDAS CONNECTION
-- df.sort_values(["amount", "duration"], ascending=[False, True]).head(10)

-- QUICK CHECK 4
-- Retrieve the 5 largest loans with duration <= 24 months.
-- Display loan_id, account_id, amount and duration.


-- ============================================================
-- 5. USEFUL NUMERIC AND STRING FUNCTIONS
-- ============================================================
-- Keep the focus on the pattern: FUNCTION(column_or_expression).

SELECT order_id,
       amount,
       ROUND(amount / 1000, 2) AS amount_in_thousands
FROM `order`
LIMIT 10;

SELECT A2 AS district_name,
       UPPER(A2) AS district_uppercase,
       LEFT(A2, 3) AS first_three_letters
FROM district
LIMIT 10;

-- CONCAT joins strings; LOWER converts text to lowercase.
SELECT A2 AS district_name,
       CONCAT(A2, ' (', LOWER(A3), ')') AS district_and_region
FROM district
LIMIT 10;

-- PANDAS CONNECTION
-- df["A2"].str.upper(), df["A2"].str[:3]
-- df["A2"] + " (" + df["A3"].str.lower() + ")"

-- QUICK CHECK 5
-- Display district names and regions, plus a new column named
-- district_label in the form: REGION - District name.
-- Convert the region to uppercase.


-- ============================================================
-- 6. WORKING WITH DATES
-- ============================================================
-- Inspect the data type before using date functions.
-- In the Czech Bank dataset, date representations differ by table.
-- The card.issued column includes a date followed by a time.

DESCRIBE card;

SELECT card_id, issued
FROM card
LIMIT 5;

-- First isolate the date part, then convert it to a DATE.
-- STR_TO_DATE makes the expected text format explicit.
SELECT card_id,
       issued,
       STR_TO_DATE(SUBSTRING_INDEX(issued, ' ', 1), '%Y-%m-%d')
           AS issue_date
FROM card
LIMIT 10;

-- DATE_FORMAT controls how a valid date is displayed.
SELECT card_id,
       DATE_FORMAT(
           STR_TO_DATE(SUBSTRING_INDEX(issued, ' ', 1), '%Y-%m-%d'),
           '%Y'
       ) AS issue_year
FROM card
LIMIT 10;

-- PANDAS CONNECTION
-- pd.to_datetime(df["issued"].str.split().str[0]).dt.year
-- SQL conversion here affects the query result, not the stored values.

-- QUICK CHECK 6
-- Display card_id, type and the issue month (01-12) as issue_month.
-- Hint: reuse the date conversion and change DATE_FORMAT to '%m'.


-- ============================================================
-- 7. CATEGORISING DATA WITH CASE
-- ============================================================
-- CASE creates categories from conditions, similar to if/elif/else.
-- This is a calculated column, not an update to the table.

SELECT loan_id,
       amount,
       CASE
           WHEN amount < 100000 THEN 'Small'
           WHEN amount < 200000 THEN 'Medium'
           ELSE 'Large'
       END AS loan_size
FROM loan
LIMIT 15;

-- PANDAS CONNECTION
-- The same idea can be implemented with np.select() or a function
-- applied to a Series. Conditions are checked in order.

-- QUICK CHECK 7
-- Create a duration_label column in loan:
-- 'Short' for duration <= 24, otherwise 'Long'.
-- Display loan_id, duration and duration_label.


-- ============================================================
-- 8. AGGREGATING DATA
-- ============================================================
-- Aggregate functions summarise many rows into a result.
-- COUNT(*) counts rows; COUNT(column) ignores NULL values.

SELECT COUNT(*) AS number_of_loans,
       MIN(amount) AS smallest_loan,
       MAX(amount) AS largest_loan,
       ROUND(AVG(amount), 2) AS average_loan,
       SUM(amount) AS total_loan_amount
FROM loan;

-- GROUP BY produces one summary row per group.
SELECT status,
       COUNT(*) AS number_of_loans,
       ROUND(AVG(amount), 2) AS average_loan
FROM loan
GROUP BY status
ORDER BY status;

-- PANDAS CONNECTION
-- df.groupby("status").agg(
--     number_of_loans=("loan_id", "size"),
--     average_loan=("amount", "mean")
-- ).reset_index()

-- QUICK CHECK 8
-- For each loan duration, calculate the number of loans and
-- the maximum loan amount. Sort by duration.


-- ============================================================
-- 9. WHERE VS HAVING
-- ============================================================
-- WHERE filters individual rows BEFORE grouping.
-- HAVING filters groups AFTER aggregation.

SELECT status,
       COUNT(*) AS number_of_loans,
       ROUND(AVG(amount), 2) AS average_loan
FROM loan
WHERE amount > 100000
GROUP BY status;

SELECT status,
       COUNT(*) AS number_of_loans,
       ROUND(AVG(amount), 2) AS average_loan
FROM loan
GROUP BY status
HAVING COUNT(*) >= 20;

-- Both filters can be used in the same query.
SELECT status,
       COUNT(*) AS number_of_loans,
       ROUND(AVG(amount), 2) AS average_loan
FROM loan
WHERE amount > 100000
GROUP BY status
HAVING COUNT(*) >= 10
ORDER BY average_loan DESC;

-- PANDAS CONNECTION
-- First filter rows, then group and aggregate, then filter the
-- resulting summary DataFrame.
-- Logical query processing: FROM -> WHERE -> GROUP BY -> HAVING
-- -> SELECT -> ORDER BY -> LIMIT (simplified).

-- QUICK CHECK 9
-- Among loans with duration <= 36 months, find the statuses with
-- at least 10 loans. Return status, loan count and average amount.


-- ============================================================
-- FINAL CHALLENGE: A LOAN PORTFOLIO REPORT
-- ============================================================
-- Build a compact report for the bank using the loan table.
-- 1. Keep only loans with status B or D.
-- 2. Keep only loans whose amount is at least 100000.
-- 3. Group by status and duration.
-- 4. Return the number of loans and average amount per group.
-- 5. Keep only groups containing at least 2 loans.
-- 6. Sort by average amount, highest first.
-- BONUS: Round the average amount and use clear column aliases.
--
-- Think: which conditions belong in WHERE and which in HAVING?


-- ============================================================
-- TAKEAWAYS
-- ============================================================
-- Expressions / AS   -> calculate and name result columns
-- WHERE / AND / OR   -> filter individual rows
-- IN / BETWEEN       -> express sets and ranges
-- LIKE / REGEXP      -> find text patterns
-- IS NULL            -> test for missing values
-- ORDER BY / LIMIT   -> sort and restrict results
-- Functions          -> transform numbers, strings and dates
-- CASE               -> assign categories from conditions
-- COUNT/SUM/AVG/...  -> summarise records
-- GROUP BY           -> aggregate by category
-- HAVING             -> filter aggregated groups
--
