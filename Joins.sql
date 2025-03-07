-- Joins 

-- Joins allow you to combine two tables or more together if they have a common column
-- the data within has to be similar that you can use, the column name does not have to be the exact same


-- will work on joins using these two tables 

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

-- We will be woring with the employee_id column because both tables have that same column
-- The data within both columns is similar as well

-- inner join
-- returns rows that are the same in both columns from both tables

SELECT *
FROM parks_and_recreation.employee_demographics
INNER JOIN parks_and_recreation.employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id -- same columns and similar data, need to specify which table in beginning and set equal to eachother
    -- pulls in all the columns from both tables bc they are the same
    -- inner join only brings over the rows that have the same values in both columns that we are tying on.
    -- employee_id 2 is not brought into the new table because it was not on the employee_salary table
;


-- can make the code a little shorte by adding an 'AS' clause
-- gives the same output as the inner join right above
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal -- 'AS sal' ads an alias to shorten the length
	ON dem.employee_id = sal.employee_id -- same columns and similar data, need to specify which table in beginning and set equal to eachother
;

-- the 'AS dem' alias can transfer over to other queries
SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal -- 'AS sal' ads an alias to shorten the length
	ON dem.employee_id = sal.employee_id -- same columns and similar data, need to specify which table in beginning and set equal to eachother
;



-- Outer Joins

-- LEFT OUTER JOIN
-- everything in the right table had a match for the left join
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN parks_and_recreation.employee_salary AS sal  -- can also type LEFT OUTER JOIN
	ON dem.employee_id = sal.employee_id 
;


-- RIGHT OUTER JOIN
-- everything in the right table had a match for the left table or a row will be populated with nulls
-- takes everything from employee_salary 
-- but Ron Swanson is not in the employee_demographics table
-- so it populates the column with all nulls
-- any information that is overlapping will be brought over
-- employee ID,, first name, and last name in table one that matches table 2 will be brought over 
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal  -- can also type RIGHT OUTER JOIN
	ON dem.employee_id = sal.employee_id 
;



-- SELF JOIN
-- a join where you tie the table to itself

-- lets say it is dec 1st and the employee and recs department decided to do a secret santa
-- and they wanted to assign based off of the employee ID the person who they're gonna have as their secret santa
-- this can be orchestrated in mySQL

SELECT * 
FROM parks_and_recreation.employee_salary AS emp1   -- to differentiate which table we are pulling from since both tables are the same
JOIN parks_and_recreation.employee_salary AS emp2
	ON emp1.employee_id + 1 =  emp2.employee_id     -- adding 1 to the left table so that every one is matched with a different person in secret santa
;

-- simplifying the output by specifying which columns we want in the output
SELECT emp1.employee_id AS emp_santa, 
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.first_name AS emp_first_name,
emp2.last_name AS emp_last_name
FROM parks_and_recreation.employee_salary AS emp1 
JOIN parks_and_recreation.employee_salary AS emp2
	ON emp1.employee_id + 1 =  emp2.employee_id
;


-- joining multiple tables together
SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal 
	ON dem.employee_id = sal.employee_id 
;



-- this is how you tie multiple tables together if they have common columns between them 
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_and_recreation.parks_departments pd
	ON sal.dept_id = pd.department_id  -- dont have the same name but they have the same values so its fine
    
;


SELECT * 
FROM parks_and_recreation.parks_departments




