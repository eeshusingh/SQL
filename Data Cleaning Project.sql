-- Data Cleaning

-- Data cleaning is where you fix issues in raw data so you can actually start using it in visuals and it becomes more useful and easier to manage

-- will be cleaning all of this data 
-- next project we will dive into it and find trends and patterns and such

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data (if there are issues with spelling and such, want to make sure everything is as it should be)
-- 3. Look for null values or blank values 
-- 4. Remove any columns or rows that are not necessary


-- this line will basically make a copy of the layoffs table
-- makes all the columns
CREATE TABLE layoffs_staging
LIKE layoffs;  

SELECT * 
FROM layoffs_staging;

-- now we need to insert the data from OG table into layoffs_staging table
-- we make a copy table and manipulate the copy because if we make some mistake we will have the original to go back to. 
-- shouldn't work on the raw data. It isn't best practice
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- REMOVING DUPLICATES
-- make sure we are removing duplicates
-- try to do something like a row number and match it againsts all of the columns to see if there are any duplicates since there is no specific ID column
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num -- we will be partitioning by all of these things
FROM layoffs_staging;

-- will filter if the row number is greater that 2
-- if it has 2 or above that means it has duplicates

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num -- we will be partitioning by all of these things
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;
-- after running this CTE it will show all the companies that have duplicates

SELECT *
FROM layoffs_staging 
WHERE company = 'Casper';  -- here we can see that this company has a duplicate 

-- we cannot update a CTE

-- we can create another table that has that extra row and then deleting 
-- this is a create table statement
-- but we wanna add another column
-- will create an empty table
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT -- here we are adding another column
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM layoffs_staging2;

-- copying all the data into the empty table but it will now have the row_num column
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num -- we will be partitioning by all of these things
FROM layoffs_staging;

-- this is searching the duplicate rows
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- now we will delete those duplicates
DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

-- here we can see the duplicates are removed after running query below
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;


-- Standardizing Data
-- Finding issues in your data and the fixing it

-- STEP 1. REMOVE DUPICATES
SELECT company, (TRIM(company))
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- wanna look at the actual industry next
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;  -- 1 means first column

-- we can see that there is crypto AND crytpocurrency

SELECT * 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

-- wanna update all of them to be crypto

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- now there are no duplicates


-- STEP 2. STANDARDIZATION
-- ensure data quality and consistency making it suitable for analysis, reporting, and decision-making


-- we can see that in country there is two united states and one of them has a period at the end
SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%'
ORDER BY 1;  

-- how to fix
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- we can see that the date column is a text column
-- we want to turn it into the standard date format for MySQL
SELECT `date`
FROM layoffs_staging2;

-- lets update it now to the new format we want
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- now we can change the entire date column from a text to a date data type

ALTER TABLE layoffs_staging2 
MODIFY COLUMN `date` DATE; -- this has changed the date column data type from text to date

SELECT *
FROM layoffs_staging2;


-- STEP 3 
-- Working with null and blank values
-- sometimes nulls and blank values happen within tables
-- need to decide what we want to do with them
-- make them all nulls, blanks, or populate all of them

-- looking at rows where two of their columns are null
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- seeing areas where industry is null or blank

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = ''; 


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';


SELECT *
FROM layoffs_staging2
WHERE company LIKE 'Bally%';


-- we can see that one of the airbnb industry columns is blank when it should have 'Travel' in it

SELECT t1.industry, t2.industry
FROM layoffs_staging2 AS t1
JOIN layoffs_staging2 AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

-- if its on one of the sides while the other isn't, then we need to write an update statement to populate it so that it matches



UPDATE layoffs_staging2 AS t1 -- updating t1 table
JOIN layoffs_staging2 AS t2 -- joining on t2 where the company is the same
	ON t1.company = t2.company 
SET t1.industry = t2.industry -- setting t1 (which is blank) to the t2 industry
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL; -- only setting if t1 is null and t2 is not null

-- if its not working then the blanks may not be NULL but blanks ('')


SELECT *
FROM layoffs_staging2;



SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
 -- the data that is all null can possibly be deleted
 
 -- null data has been deleted
DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT *
FROM layoffs_staging2;


-- Now we want to drop a column from this table
-- we don't need the rown_num column
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;


-- now the data is as clean as we can make it
SELECT *
FROM layoffs_staging2