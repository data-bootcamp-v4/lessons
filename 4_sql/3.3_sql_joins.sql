-- ==================================================
-- SETTING UP THE DATABASE
-- ==================================================

-- Setting the working database
USE bank;

-- ==================================================
-- BASIC JOINS
-- ==================================================


-- INNER JOIN. 
-- Joining account and loan tables to get information about accounts with associated loans.
-- As you can see, we use simply `join` to do an `inner join`.
SELECT * FROM bank.account AS a
JOIN bank.loan AS l
ON a.account_id = l.account_id;


-- Joining account and loan tables but selecting specific columns.
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.account AS a
JOIN bank.loan AS l
ON a.account_id = l.account_id;

-- For `inner joins`, it doesn't matter which table is the `left table` and which one is the `right table`
-- as we gather the common information. 
-- Now let's use a `left join` to see what happens
-- Using a LEFT JOIN to get all accounts with or without associated loans.
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.account AS a
LEFT JOIN bank.loan AS l
ON a.account_id = l.account_id;

-- As you can see, you get a lot of nulls for columns because not all the accounts have an associated loan
-- and we gather ALL THE INFORMATION IN THE LEFT TABLE (table `account`); ie. all the accounts.

-- Let's see what happens with the previous query if change the join, to be a `right join`
-- Using a RIGHT JOIN to get all loans with or without associated accounts.
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.account AS a
RIGHT JOIN bank.loan AS l
ON a.account_id = l.account_id;

-- As you can see, now we obtain again all the accounts which have an associated loan because we are gathering
-- ALL THE INFORMATION FROM THE RIGHT TABLE (table `loan`)

-- It is very important to keep in mind what table is the `left table` and which is the `right table` and
-- the type of join because this determines what information we will retrieve. 
-- Let's pick the previous query and exchange the `left`and the `right` tables and see what happens.
-- Switching the order of the tables in the RIGHT JOIN.
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.loan AS l
RIGHT JOIN bank.account AS a
ON a.account_id = l.account_id;

-- Again we get nulls!!! 

-- Now let's see how to get an outer join. The idea is to `union` a `left join` with a `right join`
-- Combining results of a LEFT JOIN and a RIGHT JOIN for an OUTER JOIN.
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.account AS a
LEFT JOIN bank.loan AS l
ON a.account_id = l.account_id
UNION
SELECT a.account_id, a.district_id, l.loan_id, l.duration, l.amount FROM bank.account AS a
RIGHT JOIN bank.loan AS l
ON a.account_id = l.account_id;

-- In this case, we can't see any difference with a left join because the left table is bigger than the right table.

-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- 1. Get a list of districts ordered by the number of clients (descending order). Name the columns as: `District_name` and `Number_of_clients` respectively.
-- 2. Get a list of regions ordered by the number of clients (descending order). Name the columns as: `Region_name` and `Number_of_clients` respectively.
-- 3. Get the number of accounts opened by district and year. Name the columns as: `District_name`, `Year` and `Accounts_opened`. Order the results by `District_name` and `Year`.

-- ==================================================

-- ==================================================
-- JOINS WITH MORE THAN TWO TABLES
-- ==================================================

-- Extract all the information from three tables (disp, client, and card). Get all the columns from 3 tables.

-- Joining disp, client, and card tables to get all columns.
SELECT * FROM bank.disp AS d
JOIN bank.client AS c
ON d.client_id = c.client_id
JOIN bank.card AS ca
ON d.disp_id = ca.disp_id;


-- Selecting specific columns from the three tables and filtering by card type.
SELECT d.disp_id, d.type, d.client_id, c.birth_number, ca.type FROM bank.disp AS d
JOIN bank.client AS c
ON d.client_id = c.client_id
JOIN bank.card AS ca
ON d.disp_id = ca.disp_id
WHERE ca.type = 'gold';

-- Joining disp, client, and district tables to get all columns.
SELECT * FROM bank.disp AS d
JOIN bank.client AS c
ON d.client_id = c.client_id
JOIN bank.district AS da
ON da.A1 = c.district_id;

-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- Extend the query below and list `district_name`, `client_id`, and `account_id` for those clients who are the owner of the account. Order the results by `district_name`:

-- ```sql
-- select * from bank.disp as d
-- join bank.client as c
-- on d.client_id = c.client_id
-- join bank.district as da
-- on da.A1 = c.district_id;
-- ```

-- ==================================================

-- ==================================================
-- SELF JOINS
-- ==================================================

-- As the name suggests, a self join is a join on the same table; ie. it allows you to join a table to itself. It is useful for querying hierarchical data or comparing rows within the same table.

-- Using a self join to find accounts from the same district.
SELECT * FROM bank.account a1
JOIN bank.account a2
ON a1.account_id <> a2.account_id
AND a1.district_id = a2.district_id
ORDER BY a1.district_id;

--  Note: In the query before, focus on the <> operator that we used. This is also an example of compound conditions in the join statement.


-- Using a self join to find clients that are both OWNER and DISPONENT.
SELECT * FROM bank.disp d1
JOIN bank.disp d2
ON d1.account_id = d2.account_id
AND d1.type <> d2.type;

-- Lets jut select some columns
SELECT d1.account_id, d1.type as Type1, d2.type as Type2
FROM bank.disp d1
JOIN bank.disp d2
ON d1.account_id = d2.account_id
AND d1.type <> d2.type;

-- As you will see, there are repeated values for each of the account ids. Lets try to solve this problem now.
-- Further refining the query to eliminate duplicate results.
SELECT d1.account_id, d1.type AS Type1, d2.type AS Type2
FROM bank.disp d1
JOIN bank.disp d2
ON d1.account_id = d2.account_id AND d1.type <> d2.type
WHERE d1.type = 'DISPONENT';

-- ==================================================
-- BONUS: CROSS JOINS
-- ==================================================


-- A cross join is used when you wish to create a combination of every row from two tables. The main idea of the cross join is that it returns the Cartesian product of the joined tables. Each row from one table is connected to every other row in the other table.
-- General Syntax:
-- select * from table1
-- cross join table2;

-- Lets say we want to find all the combinations of different card types and ownership of account. We have not talked about sub queries yet. We will cover sub queries in greater detail later.

-- Using CROSS JOIN to find all combinations of different card types and ownership of account.
SELECT * FROM (
  SELECT DISTINCT type FROM bank.card
) sub1
CROSS JOIN (
  SELECT DISTINCT type FROM bank.disp
) sub2;


-- The CROSS JOIN have a high potential to consume more resources and they can cause performance issues as they are computationally very expensive. This is because it produces the number of rows that are returned is the product of number of rows in table 1 times the number of rows in the other table.

