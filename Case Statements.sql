-- Case Statements
-- Allows you to add logic in your select statement
-- similar to an if-else in python



SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM parks_and_recreation.employee_demographics;

-- can add multiple when clauses

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN 'On Deaths Door'
END AS Age_bracket
FROM parks_and_recreation.employee_demographics;


-- Pay increase and Bonus
-- < 50000 = 5% raise
-- > 50000 = 7% raise
-- Finance = 10% bonus


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05  -- 5% increase
    WHEN salary > 50000 THEN salary * 1.07  -- 7% increase
END AS New_Salary
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM parks_and_recreation.employee_salary;


SELECT *
FROM parks_and_recreation.parks_departments;

SELECT * 
FROM parks_and_recreation.employee_salary;


