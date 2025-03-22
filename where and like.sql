-- WHERE Clause

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM employee_salary
WHERE salary <= 50000;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';


SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
 OR NOT gender = 'male';
 
 SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;
 
 
 -- LIKE statement
 -- % --anything character
 -- _ --specific  number of characters
 SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

 SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'
