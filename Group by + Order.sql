-- Group By

SELECT * FROM parks_and_recreation.employee_demographics;

SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT occupation, salary FROM parks_and_recreation.employee_salary  
GROUP BY occupation, salary;

SELECT gender, AVG(age)   -- aggregate function of average age based on the grouped rows
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


SELECT gender, AVG(age), MAX(age)   -- aggregate function of max age based on the grouped rows, finds the oldest age
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT gender, AVG(age), MIN(age)   -- aggregate function of max age based on the grouped rows, finds the youngest age
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


SELECT gender, AVG(age), MIN(age), COUNT(age)   -- COUNT will count the actual rows within the age column 
FROM parks_and_recreation.employee_demographics
GROUP BY gender;



-- ORDER BY
-- sorts the result set in either ascending or descending order
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY first_name;  -- will sort text columns by A-Z


SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY first_name ASC;  -- ASC will sort text columns by A-Z ascending order

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC; -- DESC will sort the columns by Z-A descending order


SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY age, gender; 


-- order by gender
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age; -- wont really do anything because there are no unique fields
-- order of columns is important



