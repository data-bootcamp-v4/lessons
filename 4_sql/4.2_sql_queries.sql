-- ==================================================
-- SETTING UP THE DATABASE
-- ==================================================

-- Setting the working database
USE bank;

-- ==================================================
-- BASIC QUERIES
-- ==================================================

-- Selecting all the data from table trans
SELECT * FROM trans;

-- It's good practice to use the database name when referencing tables 
-- especially when working with multiple databases on a server.
SELECT * FROM bank.trans;

-- Selecting specific columns
SELECT trans_id, account_id, date, type FROM bank.trans;

-- Fully qualifying columns with database and table names
SELECT bank.trans.trans_id, bank.trans.account_id, bank.trans.date, bank.trans.type 
FROM bank.trans;

-- Limiting the result set
SELECT trans_id, account_id, date, type FROM bank.trans 
LIMIT 10;

-- Counting the number of records in a table
SELECT COUNT(*) FROM bank.trans;

-- Getting unique values of a column
SELECT DISTINCT status FROM bank.loan; 

-- Aliasing columns for better readability
SELECT trans_id AS Transaction_ID, 
       account_id AS Account_ID, 
       date AS Date, 
       type AS Type_of_account
FROM bank.trans;

-- Aliasing columns and tables
-- While aliasing tables isn't necessary here, it's useful in JOIN operations.
SELECT bt.trans_id AS Transaction_ID, 
       bt.account_id AS Account_ID, 
       bt.date AS Date, 
       bt.type AS Type
FROM bank.trans AS bt;

-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- 1. Use an appropriate `SELECT` statement to retrieve a list of unique card types from the `bank` database. (Hint: Use DISTINCT function here.)
-- 2. Get a list of all the district names in the bank database. Suggestion is to use the `files_for_activities/case_study_extended` here to work out which column is required here because we are looking for the names of places, not just the IDs. It would be great to see the results under the heading `district_name`. (Hint: Use an alias.). You should have 77 rows.
-- 3. Bonus: Revise your query to also show the Region, and limit the results to just 30 rows. Sort the results alphabetically by district name A>Z before selecting the 30.
-- 4. Get again the district names and the regions but use aliases to display the corresponding columns as `district_name` and `region_name` respectively. Limit the query to the first 30 rows.
-- 5. Get all the types of the card as `type_of_card` and the issue date as `issue_date` from card and alias the table as `bc`.

-- ==================================================


-- ==================================================
-- ARITHMETIC OPERATORS
-- ==================================================


-- Display the difference between columns
SELECT *, amount-payments AS balance
FROM bank.loan;

-- Displaying specific columns with calculated values
SELECT loan_id, account_id, date, duration, status, 
       (amount-payments)/1000 AS 'balance in Thousands'
FROM bank.loan;

-- Example of modulus operator to get remainder
SELECT duration%2
FROM bank.loan;

-- ==================================================
-- COMPARISON OPERATORS AND FILTERING
-- ==================================================

-- Filtering rows based on a specific condition
SELECT * FROM bank.loan
WHERE status = 'B';

-- The operators <> and != are equivalent
SELECT * FROM bank.loan
WHERE status <> 'B';

-- Using IN clause for multiple possible values
SELECT * FROM bank.loan
WHERE status IN ('B','b');

-- Combining multiple conditions
SELECT * FROM bank.loan
WHERE status IN ('B','b') AND amount > 100000;

-- Sorting and limiting results
SELECT * FROM bank.account
ORDER BY account_id DESC
LIMIT 10;


-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- 1. Select districts and salaries (from the `district` table) where salary is greater than 10000. Return columns as `district_name` and `average_salary`.
-- 2. Select those loans whose contract finished and were not paid. **Hint**: You should be looking at the `loan` column and you will need the extended case study information to tell you which value of status is required.
-- 3. Select cards of type `junior`. Return just first 10 in your query.
-- 4. Select those loans whose contract finished and not paid back. Return the debt value from the status you identified in the last activity, together with loan id and account id.
-- 5. Calculate the urban population for all districts. Hint: You are looking for the number of inhabitants and the % of urban inhabitants in each district. Return columns as district_name and urban_population.
-- 6. On the previous query result - rerun it but filtering out districts where the rural population is greater than 50%.

-- ==================================================

-- ==================================================
-- LOGICAL OPERATORS 
-- ==================================================

-- Two conditions applied on the table
SELECT *
FROM bank.loan
WHERE status = 'B' AND amount > 100000;

-- We can have as many conditions as we need
SELECT *
FROM bank.loan
WHERE status = 'B' AND amount > 100000 AND duration <= 24;

-- Status B and D are the clients that were bad for business for the bank
SELECT *
FROM bank.loan
WHERE status = 'B' OR status = 'D';

SELECT *
FROM bank.loan
WHERE (status = 'B' OR status ='D') AND amount > 200000;

-- Logical NOT operator - it negates the boolean expression that we are evaluating
SELECT *
FROM bank.order
WHERE NOT k_symbol = 'SIPO';

SELECT *
FROM bank.order
WHERE NOT k_symbol = 'SIPO' AND NOT amount < 1000;

-- ==================================================
-- NUMERIC FUNCTIONS
-- ==================================================

SELECT order_id, ROUND(amount/1000,2) FROM bank.order;

-- Checking the number of rows in the table, both methods give the same result
-- given that there are no nulls in the column in the second case:
SELECT COUNT(*) FROM bank.order;

SELECT COUNT(order_id) FROM bank.order;

SELECT MAX(amount) FROM bank.order;
SELECT MIN(amount) FROM bank.order;

-- Rounding numbers to the greatest integer smaller than the value can be done using the function `floor()`
SELECT FLOOR(AVG(amount)) FROM bank.order;

-- Rounding numbers to the smallest integer bigger than the value can be done using the function `ceiling()`
SELECT CEILING(AVG(amount)) FROM bank.order;

-- Rounding digits can be done with `round( , number_of_digits)`
SELECT ROUND(AVG(amount),2) FROM bank.order;

-- ==================================================
-- STRING FUNCTIONS
-- ==================================================

-- To obtain the length of a string we can use the function `length()`
SELECT LENGTH('himanshu');
SELECT *, LENGTH(k_symbol) AS 'Symbol_length' FROM bank.order;

-- We can concatenate two strings using the function `concat()`
SELECT *, CONCAT(order_id, account_id) AS 'concat' FROM bank.order;

-- Functions to lowercase `lower()` and uppercase `upper()` a string
SELECT *, LOWER(A2), UPPER(A3) FROM bank.district;

-- Function to retrieve a given number of characters of a string starting from the left: `left()`
-- There is an equivalent function to retrieve a given number of characters of a string starting from the right
-- `right()`
SELECT A2, LEFT(A2,5) FROM bank.district;

-- Functions to drop white spaces of a string `ltrim()` and `rtrim()`
SELECT LTRIM(' Hello ');
SELECT RTRIM(' Hello ');


-- ==================================================
-- Check for Understanding: More Simple queries
-- ==================================================

-- 1. Get all junior cards issued last year. Hint: Use the numeric value (980000).

-- 2. Get the first 10 transactions for withdrawals that are not in cash. You will need the extended case study information to tell you which values are required here, and you will need to refer to conditions on two columns.

-- 3. Refine your query from last activity on loans whose contract finished and not paid back - filtered to loans where they were left with a debt bigger than 1000.
--   Return the debt value together with loan id and account id. Sort by the highest debt value to the lowest.

-- 4. Get the biggest and the smallest transaction with non-zero values in the database (use the trans table in the bank database).

-- 5. Get account information with an extra column year showing the opening year as 'YY'. Eg., 1995 will show as 95. Hint: Look at the first two characters of the string date in the account table. You would have to use function `substr`. Google is your friend. 
-- ==================================================

-- ==================================================
-- DATE AND TIME FUNCTIONS
-- ==================================================

-- Go through the case study pdf document to understand the format in which dates have been recorded in these tables - account, card, and loan.
-- In the first table, the column date is of type integer. So we will convert the column into date format. For now, this change will only be for display purposes as we not altering the values of the table where the column has been defined.
-- To make data type conversions, we can make use of the function convert() as shown below.

-- Using the function `convert()` to change the displayed type of a column
-- We don't alter the values themselves, we change how they are displayed.

-- ==================================================
-- DATE AND TIME FUNCTIONS
-- ==================================================

-- Date conversion and formatting
SELECT account_id, district_id, frequency, 
       CONVERT(account.date, DATE) 
FROM bank.account;

-- Note: In the previous example, one of the columns has the same name 'date' as the variable type 'date'. 
-- This shouldn't be a problem as long as you differentiate them. 
-- In the CONVERT() function, the first argument is the name of the column and the second is the type to which you want to convert.

-- Applying the same conversion for the 'loan' table
SELECT CONVERT(date, DATE) 
FROM bank.loan;

-- In the next example, we perform a two-step process for date conversion:
-- 1. Extract the date string using SUBSTRING_INDEX
-- 2. Convert the string to a date format

SELECT SUBSTRING_INDEX(issued, ' ', 1) 
FROM bank.card;

SELECT CONVERT(SUBSTRING_INDEX(issued, ' ', 1), DATE) 
FROM bank.card;

-- Converting the original format to a desired date format for displaying purposes
SELECT DATE_FORMAT(CONVERT(date, DATE), '%Y-%M-%D') 
FROM bank.loan;

-- Extracting the year from the date
SELECT DATE_FORMAT(CONVERT(date, DATE), '%Y') 
FROM bank.loan;


-- ==================================================
-- Check For Understanding
-- ==================================================

-- 1. Get `card_id` and `year_issued` for all **gold** cards.
-- 2. When was the first gold card **issued**? (Year)
-- 3. Get issue date as:

--    - date_issued: 'November 7th, 1993'( American format)
--    - fecha_emision: '07 of November of 1993' (Spanish format)

-- ==================================================

-- ==================================================
-- NULL HANDLING
-- ==================================================
-- Null values are highly confusing in SQL.

-- A column with a NULL value is a field with no value. It is very important to understand that a NULL value is different than a zero value or a field that contains spaces.

-- We can check if we have null values in our table using the function `isnull()`
-- which return either 0 or 1, where 0 means not null, 1 means null

-- Identifying NULL values
SELECT ISNULL(card_id) 
FROM bank.card;

-- With this information in hand, we can compute how many nulls there are in one column just adding the output
SELECT sum(isnull(card_id)) FROM bank.card;

-- Filtering out rows with NULL values
SELECT * FROM bank.order
WHERE k_symbol IS NULL;

-- Filtering out rows with non-null and non-empty values
SELECT * FROM bank.order
WHERE k_symbol IS NOT NULL AND k_symbol NOT IN ('', ' ');


-- ==================================================
-- CASE STATEMENTS
-- ==================================================

-- In the 'loan' table, there's a column named 'status' with values A, B, C, and D. 
-- Using the CASE statement, we will try to replace these values with a more descriptive status.

SELECT loan_id, account_id,
CASE 
    WHEN status = 'A' THEN 'Good - Contract Finished'
    WHEN status = 'B' THEN 'Defaulter - Contract Finished'
    WHEN status = 'C' THEN 'Good - Contract Running'
    ELSE 'In Debt - Contract Running'
END AS 'Status_Description'
FROM bank.loan;


-- ==================================================
-- Check For Understanding
-- ==================================================

-- - Null or empty values are usually a problem. Think about why those null values can appear.
-- - Check for transactions with null or empty values for the column `amount`.
-- - Count how many transactions have empty and non-empty `k_symbol` (in one query). Hint: consider using the function sum() with a condition inside.

-- ==================================================

-- ==================================================
-- ORDERING VALUES
-- ==================================================

-- Displaying transactions without sorting.
SELECT * FROM bank.trans;

-- Sorting transactions by amount in ascending order.
SELECT * FROM bank.trans ORDER BY amount;
-- The following query produces the same result.
SELECT * FROM bank.trans ORDER BY amount ASC;

-- Sorting transactions by amount in descending order.
SELECT * FROM bank.trans ORDER BY amount DESC;

-- We can also sort the values according to several columns. To do this, we need to provide the column names separated by comma alongside the sorting modifier. If we provide several columns for sorting, then the sorting is done first by the first column values and then by the second, and so on.


-- Here in this example we are going to see how to sort the transactions by date and amount

-- Sorting transactions by multiple columns - date and amount.
SELECT * FROM bank.trans ORDER BY date, amount;
SELECT * FROM bank.trans ORDER BY amount, date;

-- Specifying a different ordering for each column.
SELECT * FROM bank.trans ORDER BY date DESC, amount DESC;

-- Applying filters and sorting.
SELECT * FROM bank.trans 
WHERE operation <> '' 
ORDER BY date DESC, amount DESC;

-- We can't exchange the last two rows in the previous query because of the `order of processing`in SQL
-- Check out the previous material.



-- ==================================================
-- FILTERING BY RANGE
-- ==================================================

-- Now we could be interested in adding filters based on ranges instead of values. For this purpose, we can use the BETWEEN clause with the following syntax:

-- between min_value and max_value

-- Here in this example we are going to see how to filter the values of the previous queries by date or amount ranges.

-- We need to be very careful when dealing with dates. In our case, the `date` values of table trans
-- are integers! Then we can use a simple condition to refine our query but base on integers.

-- Filtering transactions by date range using integer values.
SELECT * 
FROM bank.trans 
WHERE operation <> '' AND date BETWEEN 971231 AND 981231 
ORDER BY date DESC, amount DESC;

-- Finally, we are going to see how to look for basic and simple pattern matchings (regex is left for Python). To look for patterns in strings we can use the clause like alongside pattern identifiers. Those pattern identifiers are specified using % and/or _.

-- ==================================================
-- PATTERN MATCHING
-- ==================================================

-- Using LIKE for pattern matching
-- Finding district names starting with 'K'
SELECT * FROM bank.district
WHERE A2 LIKE 'K%';

-- Finding district names ending with 'K'
SELECT * FROM bank.district
WHERE A2 LIKE '%K';

-- Finding district names containing a 'K'
SELECT * FROM bank.district
WHERE A2 LIKE '%K%';

-- Using _ for specific character positions
SELECT * FROM bank.district
WHERE A2 LIKE '____';

-- ==================================================
-- Check For Understanding
-- ==================================================

-- 1. Get transactions in the first 15 days of 1993.
-- 2. Find the different values from the field `A2` that start with the letter 'M'.
-- 3. Find the different values from the field `A2` that end with the letter 'M'.

-- ==================================================

-- ==================================================
-- AGGREGATIONS
-- ==================================================

-- Aggregate data from the entire table.
SELECT 
    COUNT(amount) AS 'Total_orders',
    SUM(amount) AS 'Total_amount', 
    MIN(amount) AS 'Minimum_amount',
    MAX(amount) AS 'Maximum_amount',
    AVG(amount) AS 'Average_amount'
FROM bank.order;

-- Aggregate data by destination bank.
SELECT bank_to, ROUND(SUM(amount),2) AS 'Total_amount' 
FROM bank.order
GROUP BY bank_to;

-- As you can see, several values of k_symbol column that are empty and we would like to get rid of these rows. The way to do this will be using a filter with WHERE. However, it's not possible to use WHERE AFTER a GROUP BY. If we want to implement a filter AFTER a GROUP BY we need to use a different clause: HAVING. Thus, remember: if you want to apply a filter:
-- Before GROUP BY use WHERE
-- After GROUP BY use HAVING
-- In other words, WHERE can be seen as a pre-filter (filtering BEFORE the aggregation), and HAVING as a post-filter (filtering AFTER the aggregation). The HAVING clause works on aggregated data. Finally, keep in mind that we can't use aggregation function in a WHERE filter.

-- Aggregate data with filters.
SELECT 
    bank_to, k_symbol,
    COUNT(amount) AS 'Total_orders',
    ROUND(SUM(amount),2) AS 'Total_amount',
    MIN(amount) AS 'Min_amount',
    MAX(amount) AS 'Max_amount',
    ROUND(AVG(amount),2) AS 'Average_amount' 
FROM bank.order
WHERE k_symbol NOT IN ('',' ')
GROUP BY bank_to, k_symbol
ORDER BY bank_to, k_symbol;

-- Aggregate data using HAVING clause for post-filters.
SELECT 
    bank_to, k_symbol,
    COUNT(amount) AS 'Total_orders',
    ROUND(SUM(amount),2) AS 'Total_amount',
    MIN(amount) AS 'Min_amount',
    MAX(amount) AS 'Max_amount',
    ROUND(AVG(amount),2) AS 'Average_amount' 
FROM bank.order
GROUP BY bank_to, k_symbol
HAVING k_symbol NOT IN ('',' ')
ORDER BY bank_to, k_symbol;

-- ==================================================
-- CHECK FOR UNDERSTANDING
-- ==================================================

-- 1. Get the total rental revenue using the column `amount` from table `payment`. Display it as `Total_revenue`. 
-- 2. Get the total rental revenue by customer_id sorted by total benefit in descending order.

-- ==================================================
-- AGGREGATING BY MULTIPLE COLUMNS
-- ==================================================

-- Aggregate data by destination bank and k_symbol.
SELECT 
    bank_to, k_symbol,
    COUNT(amount) AS 'Total_orders',
    ROUND(SUM(amount),2) AS 'Total_amount',
    MIN(amount) AS 'Min_amount',
    MAX(amount) AS 'Max_amount',
    ROUND(AVG(amount),2) AS 'Average_amount' 
FROM bank.order
GROUP BY bank_to, k_symbol
ORDER BY bank_to, k_symbol;

-- Exchanging the aggregation order.
SELECT 
    bank_to, k_symbol,
    COUNT(amount) AS 'Total_orders',
    ROUND(SUM(amount),2) AS 'Total_amount',
    MIN(amount) AS 'Min_amount',
    MAX(amount) AS 'Max_amount',
    ROUND(AVG(amount),2) AS 'Average_amount' 
FROM bank.order
GROUP BY k_symbol, bank_to
ORDER BY k_symbol, bank_to;