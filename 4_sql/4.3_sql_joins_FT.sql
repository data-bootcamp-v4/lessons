-- ============================================================
-- SQL JOINS: COMBINING RELATED TABLES
-- Database: Czech Bank (bank) | MySQL 8.x
-- ============================================================
-- GOAL
-- Retrieve information stored across related tables, choose
-- the appropriate JOIN and check that the result makes sense.
-- Learning path: relationships -> JOIN type -> multiple tables
-- -> validation -> aggregation.
--
-- PREREQUISITES
-- SELECT, WHERE, aliases, COUNT, GROUP BY and ORDER BY.

USE bank;

-- ============================================================
-- 1. WHY DO WE NEED JOINS?
-- ============================================================
-- Business question: Which district does each account belong to?
-- The account table stores district_id; the district table
-- stores the district name (A2).
--
-- Recall the ERD: account.district_id -> district.A1.
-- A JOIN connects rows through related columns, usually a
-- foreign key and the corresponding primary key.

SELECT account_id, district_id
FROM account
LIMIT 10;

SELECT A1 AS district_id, A2 AS district_name
FROM district
LIMIT 10;

-- General pattern:
-- SELECT ...
-- FROM first_table AS a
-- JOIN second_table AS b
--     ON a.foreign_key = b.primary_key;

SELECT a.account_id,
       d.A2 AS district_name
FROM account AS a
INNER JOIN district AS d
    ON a.district_id = d.A1
LIMIT 10;

-- PANDAS CONNECTION
-- pd.merge(accounts, districts, left_on="district_id",
--          right_on="A1", how="inner")
-- SQL aliases a and d work like short names for the two tables.
-- Qualifying columns (a.account_id) prevents ambiguity.

-- QUICK CHECK 1
-- Join client and district. Return client_id and district_name.
-- Show only 10 rows. Which columns form the relationship?


-- ============================================================
-- 2. INNER JOIN: ONLY MATCHING ROWS
-- ============================================================
-- INNER JOIN keeps only rows for which the ON condition matches.
-- JOIN without INNER means the same thing in MySQL.

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
INNER JOIN loan AS l
    ON a.account_id = l.account_id;

-- Not every account has a loan, so some accounts disappear.
-- Think about the relationship: one account may have zero or
-- more related rows in another table.

-- PANDAS CONNECTION
-- pd.merge(accounts, loans, on="account_id", how="inner")

-- QUICK CHECK 2
-- Join disp and card using disp_id. Return disp_id, account_id,
-- card_id and card type. Why are some dispositions missing?


-- ============================================================
-- 3. LEFT JOIN AND RIGHT JOIN: KEEP UNMATCHED ROWS
-- ============================================================
-- LEFT JOIN keeps ALL rows from the table after FROM.
-- If no match exists, columns from the right table are NULL.

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
LEFT JOIN loan AS l
    ON a.account_id = l.account_id
ORDER BY a.account_id;

-- To find accounts WITHOUT loans, filter the unmatched rows.
-- This is a common and useful pattern.

SELECT a.account_id
FROM account AS a
LEFT JOIN loan AS l
    ON a.account_id = l.account_id
WHERE l.loan_id IS NULL;

-- RIGHT JOIN keeps ALL rows from the table after RIGHT JOIN.
-- Swapping table order lets us express the same requirement
-- with LEFT JOIN, which is often easier to read.

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
RIGHT JOIN loan AS l
    ON a.account_id = l.account_id;

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM loan AS l
LEFT JOIN account AS a
    ON a.account_id = l.account_id;

-- PANDAS CONNECTION
-- pd.merge(accounts, loans, on="account_id", how="left")
-- pd.merge(accounts, loans, on="account_id", how="right")
--
-- Remember:
-- ON determines HOW rows are related.
-- JOIN type determines WHICH unmatched rows are retained.

-- QUICK CHECK 3
-- Return every disposition, including those without a card.
-- Display disp_id, account_id, card_id and card type.
-- Then retrieve ONLY dispositions without a card.


-- ============================================================
-- 4. JOINING MORE THAN TWO TABLES
-- ============================================================
-- Business question: Which clients can operate which accounts?
-- The relationship path in the ERD is:
-- client -> disp -> account
--
-- disp links clients and accounts. It is an association/bridge
-- table; its type column distinguishes OWNER and DISPONENT.
-- Build the query incrementally: first two tables, then three.

SELECT c.client_id,
       d.account_id,
       d.type AS disposition_type
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
LIMIT 10;

SELECT c.client_id,
       d.account_id,
       d.type AS disposition_type,
       a.frequency
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
INNER JOIN account AS a
    ON d.account_id = a.account_id
LIMIT 20;

-- Filter after joining to answer a more specific question.
SELECT c.client_id,
       d.account_id,
       a.frequency
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
INNER JOIN account AS a
    ON d.account_id = a.account_id
WHERE d.type = 'OWNER'
ORDER BY c.client_id;

-- PANDAS CONNECTION
-- intermediate = clients.merge(disp, on="client_id")
-- result = intermediate.merge(accounts, on="account_id")
-- result = result.loc[result["type"] == "OWNER"]

-- QUICK CHECK 4
-- Follow the path account -> disp -> card.
-- Return account_id, disp_id, card_id and card type.
-- Keep only gold cards; sort by account_id.


-- ============================================================
-- 5. VALIDATING RESULTS: COUNT ROWS, NOT JUST COLUMNS
-- ============================================================
-- A query can run successfully and still answer the wrong
-- question. Check row counts and the cardinality in the ERD.
-- A one-to-many JOIN may produce MORE rows than its left table.

SELECT COUNT(*) AS total_dispositions
FROM disp;

SELECT COUNT(*) AS total_cards
FROM card;

SELECT COUNT(*) AS dispositions_with_cards
FROM disp AS d
INNER JOIN card AS c
    ON d.disp_id = c.disp_id;

-- COUNT(*) counts result rows; COUNT(DISTINCT ...) counts
-- unique entities. These are not always the same quantity.

SELECT COUNT(*) AS joined_rows,
       COUNT(DISTINCT a.account_id) AS unique_accounts
FROM account AS a
INNER JOIN disp AS d
    ON a.account_id = d.account_id;

-- QUICK CHECK 5
-- Count rows in account and loan separately, then count rows
-- after INNER JOIN. Explain the differences using the ERD.


-- ============================================================
-- 6. COMBINING JOINS WITH GROUP BY
-- ============================================================
-- Business question: How many clients belong to each district?
-- First connect the tables; then aggregate the joined result.

SELECT d.A2 AS district_name,
       COUNT(c.client_id) AS number_of_clients
FROM client AS c
INNER JOIN district AS d
    ON c.district_id = d.A1
GROUP BY d.A1, d.A2
ORDER BY number_of_clients DESC;

-- Be careful with duplicate entities after a one-to-many JOIN.
-- This query counts account OWNERS by account frequency.

SELECT a.frequency,
       COUNT(DISTINCT a.account_id) AS number_of_accounts
FROM account AS a
INNER JOIN disp AS d
    ON a.account_id = d.account_id
WHERE d.type = 'OWNER'
GROUP BY a.frequency
ORDER BY number_of_accounts DESC;

-- PANDAS CONNECTION
-- joined = clients.merge(districts, left_on="district_id",
--                        right_on="A1", how="inner")
-- summary = joined.groupby("A2")["client_id"].count()

-- QUICK CHECK 6
-- Count cards by card type. Use disp and card in the query.
-- Return card type and number of cards, highest count first.


-- ============================================================
-- 7. FULL OUTER JOIN: CONCEPT AND MYSQL WORKAROUND
-- ============================================================
-- FULL OUTER JOIN retains matching AND unmatched rows from
-- BOTH tables. MySQL 8.x has no FULL OUTER JOIN keyword.
-- We can combine LEFT JOIN and RIGHT JOIN with UNION.
-- UNION removes duplicate result rows (UNION ALL does not).
--
-- With account and loan, the result may resemble LEFT JOIN
-- because each loan refers to an existing account.

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
LEFT JOIN loan AS l
    ON a.account_id = l.account_id
UNION
SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
RIGHT JOIN loan AS l
    ON a.account_id = l.account_id;

-- PANDAS CONNECTION
-- pd.merge(accounts, loans, on="account_id", how="outer")


-- ============================================================
-- FINAL CHALLENGE: ACCOUNT OWNERS BY DISTRICT
-- ============================================================
-- Produce a report with:
-- 1. district_name and number_of_accounts.
-- 2. Only accounts whose disposition type is OWNER.
-- 3. One row per district; sort by number_of_accounts descending.
--
-- Build it step by step:
-- a. Identify the path district -> client -> disp -> account.
-- b. Join the necessary tables using the ERD.
-- c. Filter OWNER dispositions.
-- d. Aggregate and validate the number of distinct accounts.
-- BONUS: Explain why counting joined rows can sometimes
--        overstate the number of distinct accounts.


-- ============================================================
-- TAKEAWAYS
-- ============================================================
-- ERD / PK / FK       -> identify how tables are connected
-- INNER JOIN          -> keep only matching rows
-- LEFT JOIN           -> keep every row from the left table
-- RIGHT JOIN          -> keep every row from the right table
-- ON                  -> specify the relationship between rows
-- IS NULL             -> identify unmatched rows after LEFT JOIN
-- Multiple JOINs      -> follow a path through related tables
-- COUNT(DISTINCT ...) -> count entities, not repeated join rows
-- JOIN + GROUP BY     -> summarise information across tables
-- FULL OUTER JOIN     -> LEFT JOIN UNION RIGHT JOIN in MySQL
--
-- WORKFLOW
-- Question -> tables -> ERD path -> JOIN type -> ON condition
-- -> select/filter -> validate -> aggregate if needed.
