-- Data cleaning


SELECT *
FROM layoffs;

-- Remove Duplicates
-- starndardize the data alter
-- Null values or Blank values
-- Remove any Columns

-- for redundancy incase the main data is spoilt.
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;


-- Removing duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
FROM layoffs_staging;

WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, industry, total_laid_off, percentage_laid_off, `date`,stage,
 country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


SELECT *
FROM layoffs_staging
WHERE company = 'Casper';


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, industry, total_laid_off, percentage_laid_off, `date`,stage,
 country, funds_raised_millions) AS row_num
FROM layoffs_staging;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM layoffs_staging2;

-- end of removing duplicates
-- Standardizing data  -- finding issues in the data and fixing it

SELECT company, (TRIM(company))  -- REMOVING THE WHITE SPACES BEFORE THE WORDS IN COMPANY COLUMN AND AFTER.
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2;


UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) -- SPECIFIED THAT WE WANT TO TRIM A SPECIFIC THING AND FOR THIS SCENARIO ITS A "."
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE "United States%";

-- Changing the date column
SELECT `date`
-- STR_TO_DATE(`date`, '%m/%d/%Y')  -- that is the format. converting from string to date, and then putting it into a certian format.
FROM layoffs_staging2;

-- always remember to update.
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2    -- ALSO REMEMBER TO NEVER DO THIS ON THE MAIN TABLE
MODIFY COLUMN `date` DATE;



-- Rmoving the Nulls

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

UPDATE layoffs_staging2
SET  industry = NULL 
WHERE industry = "";


SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';


SELECT * 
FROM  layoffs_staging2
WHERE company LIKE "Ball";

SELECT t1.industry, t2.industry
FROM  layoffs_staging2 t1
JOIN layoffs_staging2  t2
	ON t1.company  = t2.company
    AND t1.location = t2.location
WHERE (t1.industry IS  NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2  t2
	ON t1.company  = t2.company
SET  t1.industry  = t2.industry
WHERE t1.industry IS  NULL 
AND t2.industry IS NOT NULL;

select *
FROM layoffs_staging2;

-- END OF REMOVING NULLS


-- removed the nulls as we cannot trust the data
 SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

select *
FROM layoffs_staging2;

-- removed the row -- row_num
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;






