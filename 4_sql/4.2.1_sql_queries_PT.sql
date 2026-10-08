-- ============================================================
-- BASIC SQL QUERIES
-- Bank database
-- ============================================================

-- 1. EXPLORING THE DATABASE

SHOW DATABASES;
USE bank;
SHOW TABLES;
DESCRIBE trans;

SELECT *
FROM trans
LIMIT 10;

-- CHECK FOR UNDERSTANDING
-- 1. Display all the tables available in the bank database.
-- 2. Inspect the structure of the loan table.
-- 3. Display the first 5 rows of the loan table.


-- 2. SELECTING DATA

SELECT *
FROM trans
LIMIT 10;

SELECT trans_id,
       account_id,
       date,
       type
FROM trans
LIMIT 10;

SELECT trans_id,
       account_id,
       date,
       type
FROM bank.trans
LIMIT 10;

SELECT bank.trans.trans_id,
       bank.trans.account_id,
       bank.trans.date,
       bank.trans.type
FROM bank.trans
LIMIT 10;


-- 3. ALIASES

SELECT trans_id AS transaction_id,
       account_id AS account,
       date AS transaction_date,
       type AS transaction_type
FROM trans
LIMIT 10;

SELECT t.trans_id,
       t.account_id,
       t.date,
       t.type
FROM trans AS t
LIMIT 10;


-- 4. DISTINCT VALUES

SELECT status
FROM loan;

SELECT DISTINCT status
FROM loan;

SELECT DISTINCT type AS card_type
FROM card;


-- 5. COUNTING RECORDS

SELECT COUNT(*) AS number_of_transactions
FROM trans;

SELECT COUNT(card_id) AS cards_with_id
FROM card;

SELECT COUNT(DISTINCT type) AS number_of_card_types
FROM card;

-- CHECK FOR UNDERSTANDING
-- 1. Retrieve a list of the unique card types from the card table.
-- 2. Retrieve all district names from the district table.
--    Display the column using the alias district_name.
-- 3. Retrieve the district names and regions.
--    Display them as district_name and region_name.
-- 4. Modify the previous query so that only the first 30 rows are returned.
-- 5. Count the total number of loans in the loan table.
-- 6. How many different loan statuses exist?


-- 6. FILTERING WITH WHERE

SELECT *
FROM loan
WHERE status = 'B';

SELECT loan_id,
       account_id,
       amount
FROM loan
WHERE amount > 100000;

SELECT *
FROM loan
WHERE status <> 'B';


-- 7. COMBINING CONDITIONS

SELECT *
FROM loan
WHERE status = 'B'
  AND amount > 100000;

SELECT *
FROM loan
WHERE status = 'B'
  AND amount > 100000
  AND duration <= 24;

SELECT *
FROM loan
WHERE status = 'B'
   OR status = 'D';

SELECT *
FROM loan
WHERE (status = 'B' OR status = 'D')
  AND amount > 200000;

SELECT *
FROM `order`
WHERE NOT k_symbol = 'SIPO';

SELECT *
FROM `order`
WHERE k_symbol <> 'SIPO';


-- 8. FILTERING WITH IN

SELECT *
FROM loan
WHERE status = 'B'
   OR status = 'D';

SELECT *
FROM loan
WHERE status IN ('B', 'D');

-- CHECK FOR UNDERSTANDING
-- 1. Retrieve all districts with more than 100000 inhabitants.
--    Display the district name as district_name and the
--    number of inhabitants as population.
--    Hint: inspect the district table or use the case study
--    documentation to identify the required columns.
-- 2. Retrieve all junior cards.
-- 3. Modify the previous query so that only the first 10 rows are returned.
-- 4. Retrieve loans with status B or D.
-- 5. From those loans, retrieve only those whose amount is greater than 100000.
-- 6. Retrieve loans whose duration is not greater than 24 months.


-- 9. FILTERING RANGES WITH BETWEEN

SELECT loan_id,
       account_id,
       amount
FROM loan
WHERE amount BETWEEN 100000 AND 200000;

SELECT *
FROM trans
WHERE date BETWEEN 971231 AND 981231
LIMIT 20;


-- 10. PATTERN MATCHING WITH LIKE

SELECT *
FROM district
WHERE A2 LIKE 'K%';

SELECT *
FROM district
WHERE A2 LIKE '%K';

SELECT *
FROM district
WHERE A2 LIKE '%K%';

SELECT *
FROM district
WHERE A2 LIKE '____';


-- 11. PATTERN MATCHING WITH REGEXP

SELECT *
FROM district
WHERE A2 REGEXP '^K';

SELECT *
FROM district
WHERE A2 REGEXP 'K$';

-- CHECK FOR UNDERSTANDING
-- 1. Retrieve transactions whose date is between 930101 and 930115.
-- 2. Find the different district names that start with M using LIKE.
-- 3. Solve the previous exercise again using REGEXP.
-- 4. Find the different district names that end with M.
-- 5. Find district names that contain the sequence "ov".


-- 12. WORKING WITH NULL

SELECT *
FROM `order`
WHERE k_symbol IS NULL;

SELECT *
FROM `order`
WHERE k_symbol IS NOT NULL;

SELECT *
FROM `order`
WHERE k_symbol = '';


-- 13. ORDERING RESULTS

SELECT *
FROM trans
ORDER BY amount;

SELECT *
FROM trans
ORDER BY amount ASC;

SELECT *
FROM trans
ORDER BY amount DESC;

SELECT *
FROM trans
ORDER BY date,
         amount;

SELECT *
FROM trans
ORDER BY date DESC,
         amount ASC;

-- CHECK FOR UNDERSTANDING
-- 1. Retrieve the 10 largest loans. Display loan_id, account_id and amount.
-- 2. Retrieve junior cards ordered by their issue date.
-- 3. Retrieve the first 20 loans with status B or D,
--    ordered from highest to lowest amount.
-- 4. Retrieve all districts whose names begin with P,
--    sorted alphabetically by district name.
-- 5. Retrieve all rows from the order table where k_symbol
--    is not NULL, ordered by amount from highest to lowest.


-- 14. PUTTING EVERYTHING TOGETHER

SELECT loan_id,
       account_id,
       amount
FROM loan
WHERE status IN ('B', 'D')
  AND amount > 100000
ORDER BY amount DESC
LIMIT 10;

-- Writing order:
-- SELECT
-- FROM
-- WHERE
-- ORDER BY
-- LIMIT
--
-- Logical processing order:
-- FROM
-- WHERE
-- SELECT
-- ORDER BY
-- LIMIT


-- FINAL CHECK FOR UNDERSTANDING

-- 1. Retrieve the 10 largest loans whose duration is 24 months or less.
--    Display loan_id, account_id, amount and duration.
--    Sort them from highest to lowest amount.

-- 2. Find the unique district names beginning with the letter B.
--    Display the result as district_name and sort it alphabetically.

-- 3. Retrieve all cards whose type is either junior or gold.
--    Return only the first 20 rows.

-- 4. Count how many different card types exist.

-- 5. Choose one table that we have not explored much during the lesson.
--    a. Inspect its structure.
--    b. Display its first 10 rows.
--    c. Identify one categorical column.
--    d. Retrieve its unique values.
--    e. Write one meaningful filter using that column.


-- SELF-LEARNING
-- If you finish early, explore more advanced regular expressions in MySQL.
-- Try patterns using:
--   ^   beginning of a string
--   $   end of a string
--   []  character sets
--   |   alternatives
--   +   one or more repetitions
--   *   zero or more repetitions
--
-- Advanced REGEXP syntax is NOT required for the Basic SQL Queries lab.
