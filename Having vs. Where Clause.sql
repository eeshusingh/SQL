-- Having vs Where

SELECT gender, AVG(age)  
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40 -- this code filters the columns wso that it shows the gender that has an average age greater than 40
;


-- AVG(age) only occurs after the "GROUP BY gender" has actually grouped the rows together


SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation
;

-- now lets looks for the employees that are managers within that occupation table
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'  -- filters out the row level in the where clause
GROUP BY occupation
HAVING AVG(salary) > 75000; -- HAVING only works for aggregated functions only after the GROUP BY actually runs

-- IF you wanna filter on the aggregated function columns, you have to use the HAVING clause