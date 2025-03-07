-- WHERE Clause


SELECT * FROM parks_and_recreation.employee_salary;


SELECT * FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';   -- first name has to be equal to this value 

SELECT * FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

SELECT * FROM parks_and_recreation.employee_salary
WHERE salary < 50000;

SELECT * FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT * FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;



SELECT * FROM parks_and_recreation.employee_demographics;


SELECT * FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female';

SELECT * FROM parks_and_recreation.employee_demographics
WHERE gender != 'Male';

SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';  -- standard default date format  yyyy-mm--dd

-- Logical Operators 
-- AND, OR, NOT
SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' OR gender = 'male';

SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' AND gender = 'male';

SELECT * FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;


-- LIKE Statement
-- %   (the percent sign means anything)
SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'JER%';  -- this is saying that the first name is like Jer but then has anything after it, as long as it has 'Jer' at the beginning.

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%ER%';  -- having a percent both before and after means anything can come before and anything can come after as long as 'er' is in the middle.

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a%';  -- looks for anyone who has an "A" at the beginning of their name 

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__';  -- the two underscores mean that it starts with an 'a' and two characters after it.

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___';  -- the two underscores mean that it starts with an 'a' and two characters after it.

SELECT * FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%';  -- starts with an 'a' and has to have three characters after it but those three chars can but whatever. Will return 'April' and 'Andy'


-- wanna look at everyone born at 1980
SELECT * FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%';  -- the two underscores mean that it starts with an 'a' and two characters after it.
-- percent sign for 1989 means any month and date can come after as long as that year is the same



