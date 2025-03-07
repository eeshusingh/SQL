-- Window Functions

-- Similar to a group by except they dont roll everything up into one row when grouping
-- They allow us to look at a partition or a group and they each keep their unique row in the output. 


-- Example GROUP BY 
SELECT gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
; 
-- GROUP BY rolls everything up into one row


-- Now lets use a window function

SELECT gender, AVG(salary) OVER() --   <--- this 'OVER()' is how you create a window function, this is saying to compare the average salary over everything
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
; 
-- This is looking at the average salary for the entire column



-- we can use PARTITION BY 
SELECT gender, AVG(salary) OVER(PARTITION BY gender)  -- 'PARITITON BY' wont roll everything up into one or two rolls but it is going to perform the calculation based off of the unique values in the column
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;  -- it isnt just two rows grouped up

-- We can even add additional information and it won't affect the salary partitioned by gender column because we are using a window function
-- EX: 
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) 
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;



SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER(PARTITION BY gender) 
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
; -- here we can see all the men make $402,000 and all the females make $215,000


-- Rolling Total - Starts at a specific value and adds on values from subsequent rows based off of your partition
SELECT dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id)  AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;
-- We can see that in the salary column, all the values are individual
-- Under rolling_total we add the salary below the rolling total to the already existing original rolling total 




SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER() -- we are doing a row nuymber based off of everything. Basically giving evry row its own unique values. Row numbers wont repeat themselves this way
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- row numbers will repeat if you do it this way
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender) -- we are doing a row nuymber based off of everything. Basically giving evry row its own unique values. Row numbers will repeat themselves this way because we are partitioning by gender
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- What if we wanted to order by salary from highest to lowest 
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM parks_and_recreation.employee_demographics AS dem
JOIN parks_and_recreation.employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;
-- Row number just gives a number based off of whatever we are partioning by or ordering by in our window function
-- as we can see they are very similiar
-- Whenever we are ordering by row number, it will never have duplicate numbers
-- Rank is different, it will take it down the same way but if it runs into a duplicate value, it will give it the exact same number as the position of the original.
-- The next number will then be given the value based off of the position it takes on the table
-- Dense rank will give the same numbe rduplicates but will move onto the next number numerically and not positionally 




