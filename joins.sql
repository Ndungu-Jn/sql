-- Joins -- Allow one to combine two tables or more together if  they have a common column

-- inner join --

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT demographics.employee_id, age, occupation
FROM employee_demographics AS demographics 				 -- used aliasing to make the name shorter
INNER JOIN employee_salary AS salary 					 -- returns rows that are the same in lboth columns from both tables.
	ON demographics.employee_id = salary.employee_id;    -- the key  word ON is used to specify to which table to combine. 
    

-- OUTER JOIN    
SELECT *
FROM employee_demographics AS demographics 				
RIGHT JOIN employee_salary AS salary 					
	ON demographics.employee_id = salary.employee_id;    
    
    
-- self join -- its a join that you tie the table to itself.

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;
    

-- Joining multiple tables together --   

SELECT *
FROM employee_demographics AS demographics 				 
INNER JOIN employee_salary AS salary 					 
	ON demographics.employee_id = salary.employee_id  
INNER JOIN parks_departments AS pd
	ON salary.dept_id = pd.department_id;
    
SELECT *
FROM parks_departments;    
    