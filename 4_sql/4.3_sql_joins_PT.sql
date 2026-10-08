-- ============================================================
-- SQL JOINS
-- Bank database
-- ============================================================

USE bank;

-- ============================================================
-- 1. WHY DO WE NEED JOINS?
-- ============================================================

-- Example question:
-- Which district does each account belong to?
--
-- account information  -> account
-- district information -> district
--
-- ERD relationship:
-- account.district_id = district.A1

-- ============================================================
-- 2. BUILDING THE FIRST JOIN STEP BY STEP
-- ============================================================

SELECT account_id,
       district_id
FROM account
LIMIT 10;

SELECT a.account_id,
       a.district_id
FROM account AS a
LIMIT 10;

-- General syntax:
--
-- SELECT ...
-- FROM left_table AS l
-- JOIN right_table AS r
--     ON l.related_column = r.related_column;

SELECT *
FROM account AS a
INNER JOIN district AS d
    ON a.district_id = d.A1
LIMIT 10;

SELECT a.account_id,
       d.A2 AS district_name
FROM account AS a
INNER JOIN district AS d
    ON a.district_id = d.A1
LIMIT 20;

-- CHECK FOR UNDERSTANDING
-- 1. Join client and district. Retrieve client_id and district name.
-- 2. Limit the result to 20 rows.
-- 3. Add a meaningful alias to the district name column.

-- ============================================================
-- 3. INNER JOIN
-- ============================================================

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
INNER JOIN loan AS l
    ON a.account_id = l.account_id;

SELECT a.account_id,
       l.loan_id,
       l.amount
FROM account AS a
JOIN loan AS l
    ON a.account_id = l.account_id;

-- CHECK FOR UNDERSTANDING
-- 1. Join disp and card. Retrieve disp_id, account_id, card_id and card type.
-- 2. Compare COUNT(*) from disp with COUNT(*) from disp INNER JOIN card.
-- 3. Explain why the row counts differ.

-- ============================================================
-- 4. LEFT JOIN
-- ============================================================

SELECT a.account_id,
       a.district_id,
       l.loan_id,
       l.duration,
       l.amount
FROM account AS a
LEFT JOIN loan AS l
    ON a.account_id = l.account_id;

-- ============================================================
-- 5. RIGHT JOIN
-- ============================================================

SELECT a.account_id,
       a.district_id,
       l.loan_id,
       l.duration,
       l.amount
FROM account AS a
RIGHT JOIN loan AS l
    ON a.account_id = l.account_id;

SELECT a.account_id,
       a.district_id,
       l.loan_id,
       l.duration,
       l.amount
FROM loan AS l
LEFT JOIN account AS a
    ON l.account_id = a.account_id;

-- CHECK FOR UNDERSTANDING
-- 1. Retrieve all dispositions, including those without a card.
--    Return disp_id, account_id, card_id and card type.
-- 2. Rewrite the previous query using RIGHT JOIN by reversing the tables.
-- 3. Compare the results.

-- ============================================================
-- 6. CHOOSING THE JOIN TYPE
-- ============================================================

-- ON answers: How are the tables connected?
-- JOIN type answers: Which records must survive?
--
-- INNER JOIN -> only matching rows
-- LEFT JOIN  -> all rows from the left table
-- RIGHT JOIN -> all rows from the right table

-- ============================================================
-- 7. JOINS WITH MORE THAN TWO TABLES
-- ============================================================

SELECT *
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
LIMIT 20;

-- Conceptually:
-- client JOIN disp -> intermediate result

SELECT *
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
INNER JOIN account AS a
    ON d.account_id = a.account_id
LIMIT 20;

-- Conceptually:
-- (client JOIN disp) JOIN account

SELECT c.client_id,
       d.type AS disposition_type,
       a.account_id,
       a.frequency
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
INNER JOIN account AS a
    ON d.account_id = a.account_id
LIMIT 50;

-- CHECK FOR UNDERSTANDING
-- 1. Build a join between account, disp and card.
--    Retrieve account_id, disp_id, card_id and card type.
-- 2. Refine it so that only gold cards are returned.
-- 3. Order the result by account_id.

-- ============================================================
-- 8. USING A BRIDGE TABLE
-- ============================================================

-- client -> disp -> account
-- disp acts as the bridge table.
--
-- client.client_id = disp.client_id
-- disp.account_id  = account.account_id

-- ============================================================
-- 9. VALIDATING JOIN RESULTS
-- ============================================================

SELECT COUNT(*) AS number_of_accounts
FROM account;

SELECT COUNT(*) AS number_of_loans
FROM loan;

SELECT COUNT(*) AS matched_account_loan_rows
FROM account AS a
INNER JOIN loan AS l
    ON a.account_id = l.account_id;

-- CHECK FOR UNDERSTANDING
-- 1. Count rows in disp.
-- 2. Count rows in card.
-- 3. Count rows returned by disp INNER JOIN card.
-- 4. Explain the difference.

-- ============================================================
-- 10. COMBINING JOINS WITH WHERE
-- ============================================================

SELECT c.client_id,
       d.type AS disposition_type,
       a.account_id,
       a.frequency
FROM client AS c
INNER JOIN disp AS d
    ON c.client_id = d.client_id
INNER JOIN account AS a
    ON d.account_id = a.account_id
WHERE d.type = 'OWNER'
ORDER BY c.client_id;

-- ============================================================
-- 11. COMBINING JOINS WITH AGGREGATION
-- ============================================================

SELECT d.A2 AS district_name,
       COUNT(c.client_id) AS number_of_clients
FROM client AS c
INNER JOIN district AS d
    ON c.district_id = d.A1
GROUP BY d.A2
ORDER BY number_of_clients DESC;

SELECT a.frequency,
       COUNT(DISTINCT a.account_id) AS number_of_accounts
FROM account AS a
INNER JOIN disp AS d
    ON a.account_id = d.account_id
GROUP BY a.frequency
ORDER BY number_of_accounts DESC;

-- CHECK FOR UNDERSTANDING
-- 1. Count the number of cards for each card type using disp and card.
-- 2. Count the number of account owners for each account frequency.
-- 3. Sort from highest to lowest count.

-- ============================================================
-- 12. FULL OUTER JOIN CONCEPT
-- ============================================================

-- MySQL does NOT implement FULL OUTER JOIN directly.

-- ============================================================
-- 13. EMULATING FULL OUTER JOIN IN MYSQL
-- ============================================================

SELECT a.account_id,
       a.district_id,
       l.loan_id,
       l.duration,
       l.amount
FROM account AS a
LEFT JOIN loan AS l
    ON a.account_id = l.account_id

UNION

SELECT a.account_id,
       a.district_id,
       l.loan_id,
       l.duration,
       l.amount
FROM account AS a
RIGHT JOIN loan AS l
    ON a.account_id = l.account_id;

-- ============================================================
-- 14. COMPLETE JOIN WORKFLOW
-- ============================================================

-- 1. What information do I need?
-- 2. Which table(s) contain it?
-- 3. Do the tables contain corresponding information?
--    Check the ERD and follow PK/FK relationships.
-- 4. From which table do I want all records?
-- 5. How do I want to combine the records?
-- 6. Build the JOIN.
-- 7. Refine the query.
-- 8. Validate the result.

-- ============================================================
-- FINAL CHECK FOR UNDERSTANDING
-- ============================================================

-- 1. Retrieve each client's ID together with the district name.
-- 2. Retrieve all dispositions and any associated card information.
-- 3. Retrieve all clients together with the accounts they can manipulate.
-- 4. Modify the previous query so that only account owners remain.
-- 5. For each account frequency, count the number of owners.
-- 6. Choose one SQL Quest business question previously blocked because
--    its information was stored in different tables. Document the tables,
--    relationship path and join type, then build the query progressively.

-- ============================================================
-- SELF-LEARNING: SELF JOIN
-- ============================================================

SELECT a1.account_id AS account_1,
       a2.account_id AS account_2,
       a1.district_id
FROM account AS a1
INNER JOIN account AS a2
    ON a1.district_id = a2.district_id
   AND a1.account_id < a2.account_id
ORDER BY a1.district_id;

-- ============================================================
-- SELF-LEARNING: CROSS JOIN
-- ============================================================

-- A CROSS JOIN combines every row from one table
-- with every row from another table.
--
-- It is useful when we deliberately want to generate
-- every possible combination between two sets of records.
--
-- Examples of possible use cases:
--
-- - every product combined with every store;
-- - every employee combined with every available shift;
-- - every category combined with every region.
--
-- Unlike the joins studied in the main lesson,
-- a CROSS JOIN does not require an ON condition.
--
-- General syntax:
--
-- SELECT ...
-- FROM table1
-- CROSS JOIN table2;
--
-- The number of rows grows very quickly:
--
-- rows in result = rows in table1 * rows in table2
--
-- Therefore, use CROSS JOIN carefully.
--
-- Simple example using the bank database:
-- combine every card with every district.
--
-- This is only a syntax demonstration. In a real analysis,
-- use CROSS JOIN only when all possible combinations
-- are actually meaningful.

SELECT c.card_id,
       d.A1 AS district_id,
       d.A2 AS district_name
FROM card AS c
CROSS JOIN district AS d
LIMIT 20;
