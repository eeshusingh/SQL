
SELECT *
FROM parks_and_recreation.employee_demographics;  


SELECT first_name
FROM parks_and_recreation.employee_demographics;


SELECT first_name, last_name, birth_date
FROM parks_and_recreation.employee_demographics;


SELECT first_name,
last_name,
birth_date,
age,
age+10,  
(age+10) * 10 
FROM parks_and_recreation.employee_demographics;

-- SQL follows the rules of PEMDAS for Math operations


SELECT gender
FROM parks_and_recreation.employee_demographics;

-- DISTINCT reduces down to the only two unique values  
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;


SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;


