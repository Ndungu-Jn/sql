-- Data cleaning


SELECT *
FROM layoffs;

-- Remove Duplicates
-- starndardize the data alter
-- Null values or Blank values
-- Remove any Columns

-- for redundancy incase the main data is spoilt.

-- we create another table that is similar to the original
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;
