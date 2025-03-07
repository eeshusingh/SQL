-- Temporary Tables
-- Tables that are only visible to the session they are created in
-- If i make one right now and I exit SQL and come beack in, it won't be there anymore
-- USE CASES:
-- Storing intermediate results for complex queries
-- Using it to manipulate data before inserting it into a more permanent table
-- stored in computer memory 


-- How to create table
-- METHOD 1:
-- create variables
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

-- How to see table
SELECT * FROM temp_table;  -- will display the temp table
-- Can use over and over again

INSERT INTO temp_table
VALUES('Eeshu', 'Singh', 'Shang Chi');

SELECT * FROM temp_table;


-- Make sure to give proper names to temp tables in order to clear any possible confusion

-- METHOD 2:
SELECT * 
FROM parks_and_recreation.employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
-- We are creating a temporary table based off of an already existing table
-- this portion selects data into the temporary table
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;


SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT * 
FROM salary_over_50k;

-- TEMP tables last as long as you are within this current session
-- so if i open another new SQL file and try to select and display from the temp table in this file, it will work