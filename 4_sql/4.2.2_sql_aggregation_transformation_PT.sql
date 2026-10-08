-- ============================================================
-- SQL DATA AGGREGATION AND TRANSFORMATION
-- Bank database
-- ============================================================

USE bank;


-- ============================================================
-- 1. AGGREGATE FUNCTIONS
-- ============================================================

-- COUNT(*) counts rows.
SELECT COUNT(*) AS number_of_loans
FROM loan;


-- COUNT(column) counts non-NULL values.
SELECT COUNT(amount) AS loans_with_amount
FROM loan;


-- COUNT(DISTINCT column) counts unique non-NULL values.
SELECT COUNT(DISTINCT status) AS number_of_statuses
FROM loan;


-- SUM() calculates a total.
SELECT SUM(amount) AS total_loan_amount
FROM loan;


-- AVG() calculates the arithmetic mean.
SELECT AVG(amount) AS average_loan_amount
FROM loan;


-- MIN() and MAX() return the smallest and largest values.
SELECT MIN(amount) AS minimum_loan_amount,
       MAX(amount) AS maximum_loan_amount
FROM loan;


-- Several aggregate functions can be calculated together.
SELECT COUNT(*) AS number_of_loans,
       SUM(amount) AS total_loan_amount,
       MIN(amount) AS minimum_loan_amount,
       MAX(amount) AS maximum_loan_amount,
       AVG(amount) AS average_loan_amount
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Count the number of records in the account table.

-- 2. Count the number of different frequencies in the account table.

-- 3. Calculate the total amount in the `order` table.

-- 4. Calculate the minimum and maximum amount in the `order` table.

-- 5. Calculate the average amount in the `order` table.



-- ============================================================
-- 2. GROUP BY
-- ============================================================

-- GROUP BY changes the level of detail of the result.
-- Instead of obtaining one summary for the whole table,
-- we obtain one summary for each group.

-- Average loan amount for each status.
SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status;


-- Number of loans for each duration.
SELECT duration,
       COUNT(*) AS number_of_loans
FROM loan
GROUP BY duration;


-- Several aggregate functions for each status.
SELECT status,
       COUNT(*) AS number_of_loans,
       MIN(amount) AS minimum_amount,
       MAX(amount) AS maximum_amount,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Count the number of loans for each status.

-- 2. Calculate the average loan amount for each duration.

-- 3. Calculate the minimum and maximum loan amount for each status.

-- 4. Count the number of accounts for each frequency.



-- ============================================================
-- 3. SORTING AGGREGATED RESULTS
-- ============================================================

SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status
ORDER BY average_amount DESC;


SELECT duration,
       COUNT(*) AS number_of_loans
FROM loan
GROUP BY duration
ORDER BY number_of_loans DESC;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Count the number of accounts for each frequency and sort
--    from the most common frequency to the least common.

-- 2. Calculate the average loan amount for each status and sort
--    from highest to lowest average.



-- ============================================================
-- 4. WHERE BEFORE AGGREGATION
-- ============================================================

-- WHERE filters individual rows before GROUP BY is applied.
SELECT duration,
       AVG(amount) AS average_amount
FROM loan
WHERE amount > 100000
GROUP BY duration;


-- Only include loans with status B or D before grouping.
SELECT duration,
       COUNT(*) AS number_of_loans
FROM loan
WHERE status IN ('B', 'D')
GROUP BY duration;



-- ============================================================
-- 5. HAVING AFTER AGGREGATION
-- ============================================================

-- HAVING filters groups after aggregation.
SELECT status,
       AVG(amount) AS average_amount
FROM loan
GROUP BY status
HAVING AVG(amount) > 100000;


-- Filter grouped results based on the number of rows in each group.
SELECT duration,
       COUNT(*) AS number_of_loans
FROM loan
GROUP BY duration
HAVING COUNT(*) > 10;


-- WHERE and HAVING can appear in the same query.
SELECT duration,
       AVG(amount) AS average_amount
FROM loan
WHERE amount > 50000
GROUP BY duration
HAVING AVG(amount) > 100000;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Count the number of loans for each status, but only include
--    groups with more than 50 loans.

-- 2. Calculate the average loan amount for each duration, but only
--    display durations whose average amount is greater than 100000.

-- 3. Use WHERE and GROUP BY together:
--    first keep only loans whose amount is greater than 50000,
--    then calculate the average amount for each status.

-- 4. Extend the previous query so that only groups whose average
--    amount is greater than 100000 remain.



-- ============================================================
-- 6. LOGICAL EXECUTION ORDER
-- ============================================================

-- When aggregation is involved, think about the logical order:
--
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
-- LIMIT

SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
WHERE amount > 50000
GROUP BY status
HAVING AVG(amount) > 100000
ORDER BY average_amount DESC
LIMIT 10;



-- ============================================================
-- 7. NUMERIC TRANSFORMATIONS
-- ============================================================

-- ROUND() controls the number of decimal places.
SELECT ROUND(AVG(amount), 2) AS average_loan_amount
FROM loan;


-- ROUND() is especially useful in grouped summaries.
SELECT status,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status
ORDER BY average_amount DESC;


-- FLOOR() returns the greatest integer less than or equal to a value.
SELECT FLOOR(12.8) AS example_floor;


-- Example using table data.
SELECT FLOOR(AVG(duration)) AS average_duration
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Calculate the average order amount rounded to two decimals.

-- 2. Calculate the average loan amount for each status and round
--    the result to two decimal places.

-- 3. Calculate the average loan duration and return only the integer
--    part using FLOOR().



-- ============================================================
-- SELF-LEARNING: OTHER NUMERIC FUNCTIONS
-- ============================================================

-- MySQL includes many additional numeric functions.
-- Explore them only when they are useful for your analysis.
--
-- Examples:
--
-- CEILING()
-- ABS()
-- MOD()
-- POWER()



-- ============================================================
-- 8. HANDLING NULL VALUES WITH IFNULL()
-- ============================================================

-- IS NULL and IS NOT NULL are useful when filtering rows.
-- IFNULL() replaces a NULL value in the query result.

SELECT order_id,
       k_symbol,
       IFNULL(k_symbol, 'Not Available') AS payment_type
FROM `order`
LIMIT 20;


-- The original table is not modified.
-- IFNULL() only changes the displayed result.


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Retrieve order_id and k_symbol from the `order` table.
--    Add a new column called payment_type that replaces NULL
--    values with 'Unknown'.

-- 2. Compare the original k_symbol column and the transformed
--    result side by side.



-- ============================================================
-- 9. STRING TRANSFORMATIONS
-- ============================================================

-- CONCAT() joins strings together.
SELECT CONCAT('Data', ' ', 'Analytics') AS course_name;


-- Use CONCAT() with table columns.
SELECT client_id,
       CONCAT('Client-', client_id) AS client_label
FROM client
LIMIT 10;


-- SUBSTRING() extracts part of a string.
SELECT SUBSTRING('analytics', 1, 4) AS text_fragment;


-- Example with a column.
SELECT A2 AS district_name,
       SUBSTRING(A2, 1, 3) AS district_prefix
FROM district
LIMIT 20;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a label for each account using CONCAT().
--    Example output:
--    Account-123

-- 2. Retrieve each district name and the first four characters
--    of that name in a new column called district_prefix.

-- 3. Create a label for each loan combining the text 'Loan-'
--    with loan_id.



-- ============================================================
-- SELF-LEARNING: OTHER STRING FUNCTIONS
-- ============================================================

-- Other useful MySQL string functions include:
--
-- LOWER()
-- UPPER()
-- LENGTH()
-- LEFT()
-- RIGHT()
-- TRIM()
--
-- You do not need to memorize all SQL functions.
-- Consult the documentation when a particular transformation
-- is useful.



-- ============================================================
-- 10. DATE AND TIME FUNCTIONS
-- ============================================================

-- MySQL temporal values are normally stored using types such as:
--
-- DATE
-- DATETIME
-- TIMESTAMP
-- TIME
-- YEAR
--
-- For DATE values, MySQL uses the standard representation:
--
-- YYYY-MM-DD
--
-- Example:
-- 2026-09-10
--
-- Remember:
-- the data type of a date and the way it is displayed
-- are two different things.


-- DATEDIFF() returns the number of days between two dates.
SELECT DATEDIFF('2026-09-10', '2026-09-01') AS days_difference;


-- YEAR(), MONTH(), DAY() and DAYOFWEEK() extract date components.
SELECT YEAR('2026-09-10') AS year_value,
       MONTH('2026-09-10') AS month_value,
       DAY('2026-09-10') AS day_value,
       DAYOFWEEK('2026-09-10') AS weekday_number;


-- DAYOFWEEK() returns:
--
-- 1 = Sunday
-- ...
-- 7 = Saturday


-- DATE_FORMAT() controls how a date is displayed.
SELECT DATE_FORMAT('2026-09-10', '%M') AS month_name;

SELECT DATE_FORMAT('2026-09-10', '%W') AS weekday_name;

SELECT DATE_FORMAT('2026-09-10', '%d/%m/%Y') AS european_date_format;


-- ============================================================
-- 11. DATE FUNCTIONS WITH TABLE DATA
-- ============================================================

-- The bank dataset stores some dates in unusual formats.
-- Inspect the data before trying to use date functions.

SELECT loan_id,
       date
FROM loan
LIMIT 10;


-- The loan.date values can be converted to DATE for analysis.
SELECT loan_id,
       date,
       CONVERT(date, DATE) AS loan_date
FROM loan
LIMIT 20;


-- Extract the year from the converted date.
SELECT loan_id,
       DATE_FORMAT(CONVERT(date, DATE), '%Y') AS loan_year
FROM loan
LIMIT 20;


-- The card.issued field contains additional text.
-- First extract the date part.
SELECT card_id,
       issued,
       SUBSTRING_INDEX(issued, ' ', 1) AS issued_date_text
FROM card
LIMIT 20;


-- Then convert it to DATE.
SELECT card_id,
       CONVERT(
           SUBSTRING_INDEX(issued, ' ', 1),
           DATE
       ) AS issued_date
FROM card
LIMIT 20;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Retrieve loan_id and the year of each loan.

-- 2. Retrieve card_id and the year when the card was issued.

-- 3. Retrieve card_id and the issued date formatted so that
--    the month name is displayed.

-- 4. BONUS:
--    Display the issued date using another DATE_FORMAT pattern.



-- ============================================================
-- 12. CASE EXPRESSIONS
-- ============================================================

-- CASE creates conditional values in a query result.

SELECT loan_id,
       amount,
       CASE
           WHEN amount >= 200000 THEN 'Large'
           ELSE 'Small'
       END AS loan_size
FROM loan;


-- CASE can contain several conditions.
SELECT loan_id,
       amount,
       CASE
           WHEN amount >= 300000 THEN 'Large'
           WHEN amount >= 150000 THEN 'Medium'
           ELSE 'Small'
       END AS loan_size
FROM loan;


-- Conditions are evaluated from top to bottom.


-- ============================================================
-- 13. CASE WITH EXISTING CATEGORIES
-- ============================================================

-- The loan.status codes have business meanings described
-- in the case study documentation.

SELECT loan_id,
       account_id,
       status,
       CASE
           WHEN status = 'A' THEN 'Good - Contract Finished'
           WHEN status = 'B' THEN 'Defaulter - Contract Finished'
           WHEN status = 'C' THEN 'Good - Contract Running'
           ELSE 'In Debt - Contract Running'
       END AS status_description
FROM loan;


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Create a new column called amount_category:
--
--       >= 300000  -> 'High'
--       >= 150000  -> 'Medium'
--       otherwise  -> 'Low'
--
--    Return loan_id, amount and amount_category.

-- 2. Create a new descriptive column for loan duration:
--
--       <= 12 months -> 'Short'
--       <= 36 months -> 'Medium'
--       otherwise    -> 'Long'



-- ============================================================
-- 14. COMBINING DATE FUNCTIONS AND CASE
-- ============================================================

-- DAYOFWEEK() can be combined with CASE.

SELECT DAYOFWEEK('2026-09-12') AS weekday_number,
       CASE
           WHEN DAYOFWEEK('2026-09-12') IN (1, 7)
               THEN 'Weekend'
           ELSE 'Workday'
       END AS day_type;


-- This pattern can also be applied to a date column:
--
-- DATE
--   ↓
-- DAYOFWEEK()
--   ↓
-- CASE
--   ↓
-- Weekend / Workday


-- ============================================================
-- CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Use a date of your choice and classify it as Weekend
--    or Workday using DAYOFWEEK() and CASE.

-- 2. Test your query with at least one Saturday or Sunday
--    and one weekday.



-- ============================================================
-- 15. PUTTING EVERYTHING TOGETHER
-- ============================================================

-- Business question:
--
-- Which loan statuses have an average loan amount greater
-- than 100000, ordered from highest to lowest average amount?

SELECT status,
       COUNT(*) AS number_of_loans,
       ROUND(AVG(amount), 2) AS average_amount
FROM loan
GROUP BY status
HAVING AVG(amount) > 100000
ORDER BY average_amount DESC;


-- Break the question into smaller pieces:
--
-- Which table?
-- loan
--
-- For each WHAT?
-- status
--
-- What are we calculating?
-- COUNT(*) and AVG(amount)
--
-- Which groups remain?
-- AVG(amount) > 100000
--
-- How should they be ordered?
-- highest average first



-- ============================================================
-- FINAL CHECK FOR UNDERSTANDING
-- ============================================================

-- Solve the following without copying a complete previous query.


-- 1. For each loan duration:
--
--    - count the number of loans;
--    - calculate the average amount;
--    - round the average to two decimal places;
--    - sort from highest to lowest average amount.


-- 2. Find the loan statuses whose average amount is greater
--    than 120000.
--
--    Return:
--      status
--      number_of_loans
--      average_amount
--
--    Round the average amount to two decimals.


-- 3. In the `order` table, replace NULL k_symbol values with
--    'Not Available' and display the first 20 rows.


-- 4. Create a text label for each loan by combining:
--
--       'Loan-'
--       loan_id
--
--    Return the first 20 results.


-- 5. Retrieve loan_id and a descriptive category based
--    on amount:
--
--       >= 300000  -> High
--       >= 150000  -> Medium
--       otherwise  -> Low


-- 6. Choose one numerical column from a table in the bank
--    database and formulate your own aggregation question.
--
--    Your query should use:
--
--       an aggregate function
--       GROUP BY
--
--    Add WHERE, HAVING, ORDER BY or a transformation function
--    only if they genuinely help answer your question.



-- ============================================================
-- SELF-LEARNING
-- ============================================================

-- SQL contains many more built-in functions than those shown
-- in this lesson.
--
-- Useful examples include:
--
-- NUMERIC
--   CEILING()
--   ABS()
--   MOD()
--   POWER()
--
-- STRING
--   LOWER()
--   UPPER()
--   LENGTH()
--   LEFT()
--   RIGHT()
--   TRIM()
--
-- DATE / TIME
--   YEAR()
--   MONTHNAME()
--   DAYNAME()
--
-- Do not try to memorize every function.
--
-- When you need a transformation:
--
--     define what operation you need
--              ↓
--     check whether MySQL provides a function
--              ↓
--     consult the documentation
--              ↓
--     test it on a small example
--
-- The core skill is knowing what transformation is required,
-- not memorizing the entire MySQL function library.
