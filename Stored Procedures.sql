-- Stored Procedures
-- A way to save your SQL code to reuse over and over again
-- Simplifies repetitive code

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- Want to save code above ^ within a stored procedure
-- how to create stored procedure:
-- Make sure you click on parks_recreation before running qeury so that it stores under correct database in schemas on left side
CREATE PROCEDURE large_salaries()
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- How to call stored procedure
-- Similar to calling a functio in python or C++
CALL large_salaries(); -- shows the output from the creeate procedure code. 


-- Will usually put multiple qeuries in a stored procedure
CREATE PROCEDURE large_salaries2()
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000; -- this semi-colon seperate our qeuries from one another so the qeury below wont apply to the large_salaries2 procedure
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary >= 10000;

CALL large_salaries2();


-- can fix the semicolon stoppng 2nd qeury with a delimiter
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 50000;
	SELECT * 
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ; -- need the space between semi-colon and 'DELIMITER'

CALL large_salaries3(); -- shows two outputs because we have two qeury's within 


-- Parameter
-- parameters are variabels that are passed as an input into a stored procedure. (Meaning when it is called)
-- they allow the stored procedure to accept an input value and place it into your code
-- basically it is the same as functions 
DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id_param INT) -- here we are gonna add a parameter. need to name the parameter and give a data type. giving it employee_ID
BEGIN
	SELECT salary
	FROM parks_and_recreation.employee_salary
	WHERE employee_id = employee_id_param;
END $$
DELIMITER ;

CALL large_salaries4(1);