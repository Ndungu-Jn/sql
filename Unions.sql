-- Unions  -- Allows one to combine rows together. Takes one select statement and combines it with another select statement.alter
-- when using unions, one has to make sure that data integrity is maintained. what do I mean. that them data has to match.


 SELECT first_name, last_name
 FROM employee_demographics
 -- UNION DISTINCT               -- REMOVES ALL THE DUPLICATES
 UNION ALL                       --  combines all the rows, even the duplicates.
 SELECT first_name, last_name
 FROM employee_salary;
 
 -- case scenario  is if a company wants to layoff older people and as well as some of the people that are paid handsomely
 SELECT first_name, last_name, "Old Man" AS label
 FROM employee_demographics
 WHERE age > 40 AND gender = 'Male'
 UNION
 SELECT first_name, last_name, "Old Lady" AS label
 FROM employee_demographics
 WHERE age > 40 AND gender = 'Female'
 UNION
 SELECT first_name, last_name, "highly paid employees" AS label
 FROM employee_salary
 WHERE salary > 70000
 ORDER BY first_name, last_name;
 
 
 
 
 
 
 
 
 