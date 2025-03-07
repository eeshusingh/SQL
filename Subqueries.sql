-- Subqueries
-- a query within another query
SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;



-- Here were are selecting everything where the employee_id in employee_demographics matches or is in the salary table where the
-- department ID is equal to 1
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN (
	SELECT employee_id
		FROM parks_and_recreation.employee_salary
        WHERE dept_id = 1
)
;


-- lets say we want to look at all the salaries but in a column next to it, we wanna compare the average salary next to everyones salary.
SELECT first_name, salary, 
(SELECT AVG(salary)
FROM parks_and_recreation.employee_salary)
FROM parks_and_recreation.employee_salary;



SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


SELECT *
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Aggregated_Table; -- Have to name a table 




SELECT AVG(MAX(age)) -- this is the new name of the aggregated column, need to use the backtick
FROM
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS max_age, 
(age) AS min_age, 
COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS Aggregated_Table -- Have to name a table
;
