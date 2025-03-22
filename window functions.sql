-- windows Functions

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender; 

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender )  -- window function.
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
    
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id )  AS Rolling_Total-- window function.
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id; 
    
    
-- Rolling Total --    starts at a specific value and add all values from  subsequent rows based on your partition.
-- keeps on addding on top of the other.

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER  BY salary DESC) AS row_num,   -- gives the row a number -- no duplicates
RANK() OVER(PARTITION BY gender ORDER  BY salary DESC) AS rank_num,       -- gives the rank  --allows duplicates if there is any based of of the duplicates. -- next number is usually the next number positionally
DENSE_RANK() OVER(PARTITION BY gender ORDER  BY salary DESC) AS dense_rank_num   -- difference form rank is that its next number is going to be numerically
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id     -- partitions and gets from highest to lowest.
    
    
    

   
    