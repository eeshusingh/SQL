-- This statement is selecting the entire employee_demographics column from the parsk_and_recreation table
SELECT *
FROM parks_and_recreation.employee_demographics;  

-- Can select specific columns from a table to display
SELECT first_name
FROM parks_and_recreation.employee_demographics;

-- Can select multiple specific columns from a table to display
SELECT first_name, last_name, birth_date
FROM parks_and_recreation.employee_demographics;

-- Can also seperate columns in select statement like so
SELECT first_name,
last_name,
birth_date,
age,
age+10,  -- You are able to perform calculations within SELECT statement
(age+10) * 10  -- PEMDAS is followed during this calculation
FROM parks_and_recreation.employee_demographics;

-- SQL follows the rules of PEMDAS for Math operations


SELECT gender
FROM parks_and_recreation.employee_demographics;

-- DISTINCT reduces down to the only two unique values  
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

-- if there are more than two distinct values in another column though, then it will show all of them 
-- because most if not all of the first name values are unique
SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;


