-- Triggers and Events

-- A trigger is a block of code that executes automatically when an Event takes place on a specific table

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

-- when a new employee is hired they are put into the employee_salary table
-- but sometimes people forget or don't add their information and are not put into the employee_demographics table

-- we will write a trigger for when data is updated in the salary table, it will also update the demographics for us


-- after we insert into the employee salary table, something will happen
-- 'FOR EACH ROW' is a trigger that will get activated for each row that is inserted
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON parks_and_recreation.employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO parks_and_recreation.employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);   -- 'NEW' will say that we are only taking the new rows that are inserted. 'OLD' takes the rows that were deleted.
END $$employee_insert
DELIMITER ;

INSERT INTO parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)  -- need to run this line only first, dont try to run entire script
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Exntertainment 720 CEO', 1000000, NULL);



-- EVENTS
-- Events take place when they are scheduled
-- Lets try to create an event that checks the table every month or day, and then once they are over a specific age, delete them from the table

SELECT * FROM parks_and_recreation.employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	SELECT * FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

-- after running the above qeury we can see that Jerry Gergich is gone


-- Lets say we couldn't get the event to trigger at all

SHOW VARIABLES LIKE 'event%';
    