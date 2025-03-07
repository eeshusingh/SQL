-- Unions
-- allows you to combine rows rogether
-- whereas joins allow you to combine columns together
SELECT age, gender
FROM parks_and_recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

-- as we can see, it take age and gender and makes them two columns
-- but then it attaches first_name and last_name below the age and gender under their columns
-- this table is bad data though. We need to keep the data the same bc we have age and gender mixed with first and last name
-- we cant just combine random data together

-- We need to keep the data the same
-- should take first and last name form employee_demographics
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION DISTINCT 
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;
-- this will show all of the names form all of the tables
-- UNION DISTINCT removes all of the duplicates, first_name and last_name from salary overlaps a lot with the employee_demographics table

-- if we want ot show all of the names from the tables we have to use UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL 
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;
-- this will show all of the results including all the duplicates



-- USE CASE OF UNION --------------------------------------------------------------------------------------------------------------
-- the department is trying to cut their budget a bit so they wanna find older employees they can try to push out
SELECT first_name, last_name, 'Old' AS LABEL
FROM parks_and_recreation.employee_demographics
WHERE age > 50;

-- they also wanna identify high payed employees they can also push out to save money along with older people
SELECT first_name, last_name, 'Old Man' AS LABEL
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS LABEL
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS LABEL
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;
-- here we have three seperate union statements 
-- here we can see that Christ Traeger is an Old Man and Lelsie Knope is an Old Lady and thye are both also a highly paid employees
-- now we can send it to whoever we need to send it to so they can fire the older people and save money
-- USE CASE OF UNION END ------------------------------------------------------------------------------------------------------------
