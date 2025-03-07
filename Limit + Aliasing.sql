-- Limit & Aliasing


-- LIMIT

SELECT * 
FROM parks_and_recreation.employee_demographics;

-- this block of code below will only take the top 3 within the table
SELECT * 
FROM parks_and_recreation.employee_demographics
LIMIT 3;

-- What if we wanted to take the top three oldest 
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC  -- sorts age in descending order
LIMIT 3; 

-- There is an additional parameter in LIMIT
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC  -- sorts age in descending order
LIMIT 2, 1;  -- what this extra 1 does is it says that we will start at position 1 and go one row after it, OUTPUT = 'Leslie Knope'


-- ALIASING
-- a way to change the name of a column
SELECT gender, AVG(age) AS avg_age   -- this line here make it so that avg age is stored in a variable called avg_age, the "AS" does not have to be their 
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40; -- here is a comparison that we are doing with the var we created ffrom the first line in this query