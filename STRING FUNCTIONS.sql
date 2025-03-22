-- String Functions
SELECT LENGTH('skyfall');

SELECT first_name, length(first_name)  -- this gets the length of the names of the employees.
FROM employee_demographics
ORDER BY 2;

SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)  -- this gets the  names of the employees TO UPPER CASE.
FROM employee_demographics;

-- TRIM -- takes the white space at the end or at the front and gets rid of it
-- There is rtrim and ltrim
SELECT trim('           SKY          ');

SELECT first_name, 
LEFT(first_name, 4),  --  How many characters from the left hand side do we want to select
RIGHT(first_name, 4),  -- characters from the right side
SUBSTRING(first_name, 3,2), -- takes the  characters at the specific position. i.e we wantt to get the month everyone was born in.
birth_date,
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a','z')  -- specifies what we want to replace and replaces.
FROM employee_demographics;

SELECT LOCATE('x', 'alexander');

SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name," ",last_name) AS full_name
FROM employee_demographics;



  
 






