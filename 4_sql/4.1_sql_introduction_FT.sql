-- ============================================================
-- INTRODUCTION TO SQL
-- Database: Czech Bank (bank) | MySQL 8.x
-- ============================================================
-- GOAL
-- Explore a relational database and retrieve basic information.
-- Learning path: inspect -> select -> rename -> identify unique values -> count.
--

-- ============================================================
-- 1. EXPLORING A DATABASE
-- ============================================================
-- A relational design is implemented as tables and columns.
-- First, inspect what exists before writing a query.

SHOW DATABASES;

USE bank;

SHOW TABLES;

DESCRIBE trans;

-- A quick look at the actual data:
SELECT *
FROM trans
LIMIT 5;

-- QUICK CHECK 1
-- 1. Inspect the structure of the loan table.
-- 2. Display the first 5 rows of the loan table.


-- ============================================================
-- 2. SELECT AND FROM
-- ============================================================
-- SELECT specifies which columns to retrieve.
-- FROM specifies the table.
-- LIMIT restricts the number of rows returned.
-- Avoid SELECT * when you only need a few columns.

SELECT trans_id,
       account_id,
       date,
       type
FROM trans
LIMIT 10;

-- You can qualify a table with its database name:
SELECT trans_id,
       account_id,
       date,
       type
FROM bank.trans
LIMIT 10;

-- PANDAS CONNECTION
-- df[["trans_id", "account_id", "date", "type"]].head(10)
-- Both select columns and show the first 10 rows.
-- SQL runs the query in the database; Pandas operates on a DataFrame.

-- QUICK CHECK 2
-- Retrieve loan_id, account_id and amount from loan.
-- Display only the first 8 rows.


-- ============================================================
-- 3. ALIASES WITH AS
-- ============================================================
-- Aliases rename columns in the query result, not in the stored table.

SELECT loan_id AS loan_number,
       account_id AS customer_account,
       amount AS loan_amount
FROM loan
LIMIT 10;

-- Table aliases are especially useful in JOIN queries.
SELECT t.trans_id,
       t.account_id,
       t.type
FROM trans AS t
LIMIT 5;

-- PANDAS CONNECTION
-- df.rename(columns={"amount": "loan_amount"})
-- This produces a DataFrame with a different column name;
-- SQL's AS changes only the result of this query.

-- QUICK CHECK 3
-- Display card_id and type from card, renaming type as card_type.
-- Limit the output to 10 rows.


-- ============================================================
-- 4. DISTINCT: FINDING UNIQUE VALUES
-- ============================================================
-- Many records can share the same categorical value.
-- DISTINCT returns unique combinations of the selected columns.

SELECT status
FROM loan;

SELECT DISTINCT status
FROM loan;

SELECT DISTINCT type AS card_type
FROM card;

-- PANDAS CONNECTION
-- df["status"].unique()          # unique values as an array
-- df[["status"]].drop_duplicates()  # unique rows as a DataFrame

-- QUICK CHECK 4
-- Retrieve the unique values of the frequency column in account.


-- ============================================================
-- 5. COUNT: HOW MANY RECORDS?
-- ============================================================
-- COUNT(*) counts rows.
-- COUNT(column) counts non-NULL values in that column.
-- COUNT(DISTINCT column) counts distinct non-NULL values.

SELECT COUNT(*) AS number_of_loans
FROM loan;

SELECT COUNT(card_id) AS cards_with_id
FROM card;

SELECT COUNT(DISTINCT type) AS number_of_card_types
FROM card;

-- PANDAS CONNECTION
-- len(df)                   # row count
-- df["card_id"].count()    # non-missing values
-- df["type"].nunique()     # distinct non-missing values

-- QUICK CHECK 5
-- How many different loan statuses exist?
-- Return the result as number_of_statuses.


-- ============================================================
-- FINAL CHALLENGE
-- ============================================================
-- Explore a table that we have not used much: district.
-- 1. Inspect its structure.
-- 2. Display its first 5 rows.
-- 3. Retrieve the district names (column A2), using district_name
--    as the column alias. Display only the first 10 rows.
-- 4. Count the total number of districts.
-- BONUS: How many distinct regions (column A3) are represented?


-- ============================================================
-- TAKEAWAYS
-- ============================================================
-- SHOW / DESCRIBE -> understand the database structure
-- SELECT / FROM   -> choose data to retrieve
-- LIMIT           -> keep output manageable
-- AS              -> label output clearly
-- DISTINCT        -> identify unique values
-- COUNT           -> count rows or non-NULL values
--
