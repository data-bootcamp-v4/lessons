-- ==================================================
-- SETTING UP THE DATABASE
-- ==================================================

-- Setting the working database
USE bank;

-- ==================================================
-- WINDOW FUNCTIONS
-- ==================================================

-- A window function is a SQL feature used to perform calculations across a set of table rows that are related to the current row, 
-- providing a way to perform computations across a set of table rows related to the current row.


-- Let's start with a simple aggregation to understand how aggregation functions
-- are different from window functions.
-- Getting the average loan amount for comparison purposes
SELECT AVG(amount) AS 'Avg_amount' FROM bank.loan;

-- As you can see, only one value is returned.

-- Using window functions to compare each loan amount with the overall average loan amount
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER() AS 'Avg_amount' -- This window function computes the average amount over the entire dataset
FROM bank.loan;


-- Now, we may want to compute the average by `status` to compare every loan amount against the average by status.
-- To do this, we can add a `partition by` inside the `over()`

-- Comparing each loan amount with the average loan amount by status
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER(PARTITION BY status) AS 'Avg_amount' -- The window function now partitions the data by status
FROM bank.loan;


-- We can add another sublevel of partition. For example duration.

-- Comparing each loan amount with the average loan amount by both status and duration
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER(PARTITION BY status, duration) AS 'Avg_amount' -- The window function now partitions the data by both status and duration
FROM bank.loan;

-- Same as the previous but ordering the results by status, duration, and amount
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER(PARTITION BY status, duration ORDER BY status, duration, amount DESC) AS 'Avg_amount'
FROM bank.loan;

-- OR
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER(PARTITION BY status, duration) AS 'Avg_amount'
FROM bank.loan
ORDER BY status, duration, amount DESC;

-- Using multiple window functions in a single query
-- In this case, we're using ROW_NUMBER to assign a unique sequential integer to rows within a partition of a result set
SELECT status,
       loan_id, 
       duration, 
       amount,
       AVG(amount) OVER(PARTITION BY status, duration) AS 'Avg_amount',
       ROW_NUMBER() OVER(PARTITION BY status, duration ORDER BY status, duration, amount DESC) AS 'Row_number'
FROM bank.loan
ORDER BY status, duration, amount DESC;


-- Cumulative sum of transaction amounts by account_id
SELECT account_id, 
       CONVERT(trans.date,DATE) AS Date, 
       amount,
       SUM(amount) OVER(PARTITION BY account_id ORDER BY Date) AS Cum_sum -- The window function computes a running total of amount for each account_id
FROM bank.trans;


-- ==================================================
-- MORE ON WINDOW FUNCTIONS - RANK, DENSE_RANK, ROW_NUMBER
-- ==================================================

-- RANK assigns a unique rank within the result set, with the same rank assigned to rows with the same values.
-- In the event of ties, subsequent rank numbers are skipped. For example, if two rows tie for rank 3, the next row will be ranked 5.
-- ROW_NUMBER, on the other hand, assigns a unique sequential integer to rows within a partition of a result set.
-- DENSE_RANK also assigns rank like RANK but does not skip any rank in case of tie.


-- Getting the rank of loans based on the amount
SELECT *, RANK() OVER(ORDER BY amount DESC) AS 'Rank'
FROM bank.loan;

-- Note that we have not used partition by clause here. So we are not working on any windows. We are just trying to rank the data. 

-- Achieving the same result with ROW_NUMBER
SELECT *, ROW_NUMBER() OVER(ORDER BY amount DESC) AS 'Row Number'
FROM bank.loan;

-- In this query, we are trying to rank the customers based on the amount of loan
-- they have borrowed, in each of the "k_symbol" categories

SELECT * , RANK() OVER(PARTITION BY k_symbol ORDER BY amount DESC) AS "Ranks"
FROM bank.order
WHERE k_symbol <> " ";



-- As a next step if we want to create a filter on these ranks, to find out, let's say which are the top 10 customers or which is the
--  nth highest customer, we could use this query as a subquery to find the answer to such questions.

-- ==================================================
-- BONUS: CHECK FOR UNDERSTANDING
-- ==================================================

-- In this activity, we will be using the table `district` from the `bank` database and according to the description for the different columns:

-- - A4: no. of inhabitants
-- - A9: no. of cities
-- - A10: the ratio of urban inhabitants
-- - A11: average salary
-- - A12: the unemployment rate

-- 1. Rank districts by different variables.
-- 2. Do the same but group by `region`.

-- ==================================================

-- ==================================================
-- BONUS: WINDOW FUNCTIONS - LAG FUNCTION
-- ==================================================
-- The LAG function is a window function that provides access to more than one row of a table at the same time.
-- LAG accesses data from a previous row in the same result set without the use of a self-join. 

-- Write a query to find the month on month monthly active users (MAU)
-- Use lag() function to get the active users in the previous month

-- To get this information we will proceed step by step.

-- Step 1: Get the account_id, date, year, month and month_number for every transaction.

-- Constructing a view for user activity that contains account_id, date, year, month, and month_number for each transaction
CREATE OR REPLACE VIEW user_activity AS
SELECT account_id, 
       CONVERT(date, DATE) AS Activity_date,
       DATE_FORMAT(CONVERT(date,DATE), '%M') AS Activity_Month,
       DATE_FORMAT(CONVERT(date,DATE), '%m') AS Activity_Month_number,
       DATE_FORMAT(CONVERT(date,DATE), '%Y') AS Activity_year
FROM bank.trans;


-- Checking the results
SELECT * FROM bank.user_activity;

-- Step 2: Computing the total number of active users by Year and Month with group by and sorting according to year and month NUMBER.

SELECT 
   Activity_year, 
   Activity_Month, 
   Activity_Month_number, 
   COUNT(account_id) AS Active_users 
FROM bank.user_activity
GROUP BY Activity_year, Activity_Month, Activity_Month_number
ORDER BY Activity_year ASC, Activity_Month_number ASC;


-- Step 3: Storing the results on a view for later use
DROP VIEW bank.monthly_active_users;
CREATE VIEW bank.monthly_active_users AS
SELECT 
   Activity_year, 
   Activity_Month, 
   Activity_Month_number, 
   COUNT(account_id) AS Active_users 
FROM bank.user_activity
GROUP BY Activity_year, Activity_Month, Activity_Month_number
ORDER BY Activity_year ASC, Activity_Month_number ASC;

-- Checking results
SELECT * FROM monthly_active_users;

-- Step 4: Compute the difference of active_users between one month and the previous one for each year using the lag function 
-- with lag = 1 (as we want the lag from one previous record)

-- The LAG function is used to access data from a previous row in the same result set.
-- In this query, we're comparing the number of active users for each month with the previous month.

SELECT 
   Activity_year,             -- Year of activity
   Activity_month,            -- Month of activity
   Active_users,              -- Number of active users for the specified year and month
   LAG(Active_users,1) OVER(ORDER BY Activity_year, Activity_Month_number) AS Last_month -- Number of active users from the previous month
FROM monthly_active_users;   -- Using the previously created view that aggregates monthly active users

-- Final step: Refining the query. Getting the difference of monthly active_users month to month.

-- Using the LAG function to compute the difference of active users month-to-month
WITH cte_view AS (
  SELECT 
   Activity_year, 
   Activity_month,
   Active_users, 
   LAG(Active_users,1) OVER(ORDER BY Activity_year, Activity_Month_number) AS Last_month
FROM monthly_active_users)
SELECT 
   Activity_year, 
   Activity_month, 
   Active_users, 
   Last_month, 
   (Active_users - Last_month) AS Difference 
FROM cte_view;



