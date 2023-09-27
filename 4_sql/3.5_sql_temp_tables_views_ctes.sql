-- ==================================================
-- SETTING UP THE DATABASE
-- ==================================================

-- Setting the working database
USE bank;

-- ==================================================
-- Temporary Tables
-- ==================================================
-- A temporary table is a short-lived table that exists only for the duration of a session or a specific task within that session.

-- Creating a temporary table 'loan_and_account' to store combined details of loan and account.
CREATE TEMPORARY TABLE bank.loan_and_account
SELECT l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency
FROM bank.loan l
JOIN bank.account a
ON l.account_id = a.account_id;

-- Fetching all records from the newly created temporary table 'loan_and_account'.
SELECT * FROM bank.loan_and_account;

-- Creating another temporary table 'disp_and_account' to store combined details of disp and account.
CREATE TEMPORARY TABLE bank.disp_and_account
SELECT d.disp_id, d.client_id, d.account_id, a.district_id, d.type
FROM bank.disp d
JOIN bank.account a
ON d.account_id = a.account_id;

-- Fetching all records from the newly created temporary table 'disp_and_account'.
SELECT * FROM bank.disp_and_account;



-- ==================================================
-- CTEs (Common Table Expressions)
-- ==================================================
-- A CTE provides a way to define a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.

-- A very simple example to show the general syntax
-- The query after the AS keyword can be any query (from a simple to a very complex)

-- Using a CTE to fetch data from the 'loan' table where status is 'B'.
WITH cte_loan AS (
  SELECT * FROM bank.loan
)
SELECT * FROM cte_loan
WHERE status = 'B';

-- The same result can be achieved without the CTE, as shown below:
SELECT * FROM bank.loan
WHERE status = 'B';

-- Suppose that we want to find the total amount and total balance of each customer in the 
-- transactions table and store it into a CTE. Then pull more information on those customers by using a join between the CTE and the account table.

-- Let's start computing the total amount and balance for each account_id
-- For each 'account_id' in the 'trans' table, this query calculates the total amount and total balance.

SELECT account_id, 
       ROUND(SUM(amount),2) AS Total_amount, 
       ROUND(SUM(balance),2) AS Total_balance
FROM bank.trans
GROUP BY account_id;


-- Using CTE to aggregate data from 'trans' table and then joining with 'account' table.
WITH cte_transactions AS (
  SELECT account_id, ROUND(SUM(amount),2) AS Total_amount, ROUND(SUM(balance),2) AS Total_balance
  FROM bank.trans
  GROUP BY account_id
)
SELECT 
       ct.account_id, 
       ct.Total_amount, 
       ct.Total_balance, 
       a.district_id, 
       a.frequency,
       a.date
FROM cte_transactions AS ct
JOIN bank.account a
ON ct.account_id = a.account_id;

-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- Find the most active customer for each district in Central Bohemia using at least one CTE.

-- ==================================================


-- ==================================================
-- Views
-- ==================================================

-- Views are like virtual tables in the database that can be used for querying just like a regular table but they do not store any information 
-- permanently in them like a table does; ie. a table occupies actual memory in the database but views don't. 
-- Views can be built with queries on single or multiple tables.

-- Creating a view to identify potential risky customers based on their balances.
-- Here, we're considering loans with status 'C' and comparing their balances with the average balance of the same status.
CREATE VIEW running_contract_ok_balances AS
WITH cte_running_contract_OK_balances AS (
  SELECT *, amount-payments AS Balance
  FROM bank.loan
  WHERE status = 'C'
  ORDER BY Balance
)
SELECT * FROM cte_running_contract_OK_balances
WHERE Balance > (
  SELECT AVG(Balance)
  FROM cte_running_contract_OK_balances
)
ORDER BY Balance DESC
LIMIT 20;




-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- To spot possible fraud, we want to create a view last_week_withdrawals with total withdrawals by a client in the last week.

-- ==================================================






