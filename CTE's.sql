-- CTE's 
-- Common Table Expression
-- Allow you to define a subqeury block that you can then reference within the main qeury

/* FORMAT OF CTE:

 WITH cte_name AS (
    SELECT query
 )
 SELECT *
 FROM cte_name;
*/




WITH CTE_Example AS
(
SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal, MIN(salary) AS min_sal, COUNT(salary) AS count_sal
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal) -- this is the average salary between both the males and females
FROM CTE_Example
;

SELECT AVG(avg_sal)  -- this wont work. this kind of query will only work if you write it immedietly after the CTE block
FROM CTE_Example
;





-- CTEs allow you to perform more advanced calculations
-- Something that you cant easily do or can't do at all in an average qeury


-- this will give the exact same output as the CTE above
SELECT AVG(avg_sal)
FROM 
(SELECT gender, AVG(salary) AS avg_sal, MAX(salary) AS max_sal, MIN(salary) AS min_sal, COUNT(salary) AS count_sal
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subqeury
;

-- CTE's can be quicker to read through

-- when you build a CTE you can only use it immedietly after
-- you cannot build right below it


WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS
(
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_EXAMPLE
JOIN CTE_Example2
	ON CTE_EXAMPLE.employee_id = CTE_Example2.employee_id
;

