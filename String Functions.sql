-- String Functions

-- built in functions that help use use strings and work with strings in different ways

SELECT LENGTH('skyfall'); -- this will give use the length of how long this string is

SELECT *
FROM parks_and_recreation.employee_demographics;

-- We can look at how long each person name is like this
SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

SELECT UPPER('sky');  -- makes all characters in the string upper case
SELECT LOWER('sky'); -- makes all characters in the string lower case


SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics;


-- TRIM function
-- takes the whitespace from the front or the end and get rid of it
SELECT ('                         SKY                    ');
SELECT TRIM('                         SKY                    ');
SELECT LTRIM('                         SKY                    ');  -- gets rid of space on left hand side
SELECT RTRIM('                         SKY                    ');  -- gets rid of space on right hand side



-- SUBSTRING
-- also uses two smaller functions called LEFT and RIGHT
SELECT first_name, 
LEFT(first_name, 4),  -- makes it show only the first 4 characters starting from the left side of the string
RIGHT(first_name, 4), -- makes it show only the first 4 characters starting from the right side of the string
SUBSTRING(first_name, 3, 2), -- 3 means start at the third posotion and go over 2 characters. 
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month  -- can find the month from the birth_date coloumn and have it has its own coulmn if we wanna know all the months
FROM parks_and_recreation.employee_demographics;


-- REPLACE
-- replace specific characters with a different character that you want
SELECT first_name, REPLACE(first_name, 'a', 'z') -- replaces all lowercase a's in a first name with the letter Z in the coloumn selected
FROM parks_and_recreation.employee_demographics;


-- LOCATE
SELECT LOCATE('x', 'Alexander'); 
-- syntax: LOCATE('what we want to find', 'source string')
-- returns position of what we want to find
-- x is the fourth character in 'Alexander' so it returns the number 4

SELECT first_name, LOCATE('An', first_name)   -- finds all the first names with the string 'An' in it
FROM parks_and_recreation.employee_demographics;



-- CONCAT
-- Concatenate
SELECT first_name, last_name,
CONCAT(first_name, last_name) -- brings the strings together and forms a new column with the new strings
FROM parks_and_recreation.employee_demographics;

-- if we wanna add a space between concatenated strings
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name -- brings the strings together and forms a new column with the new strings. 'AS full_name' make a new column for concatenated name
FROM parks_and_recreation.employee_demographics;




