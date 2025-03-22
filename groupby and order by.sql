-- Group By

SELECT *
FROM employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age), count(age)
FROM employee_demographics
GROUP BY gender;

-- we can select multiple 
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

-- ORDER BY -- sort in either ascending or descending order
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;