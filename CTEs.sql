-- CTEs -- common table expressions -- just like subqueries but more standerdized
-- the key word is WITH and can only be used after you create it
-- Basically its creating a temporary table and then querying 

WITH CTE_Example AS  -- CTEs are way better.use this insteadof subqueries.
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

SELECT AVG(avg_sal)    -- makes the calculations super fast
FROM CTE_example;



-- this  does the same thing but the syntax is a bit hard to comprehend. CTEs comes easier.
SELECT AVG(avg_sal)
FROM(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

-- creating multiple CTEs
WITH CTE_Example AS  -- CTEs are way better.use this insteadof subqueries.
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS 
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *   
FROM CTE_example
JOIN CTE_example2
	ON CTE_example.employee_id = CTE_example2.employee_id;
    
    
    
    
    
    
    
    
    


  
