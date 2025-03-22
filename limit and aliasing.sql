-- limit & Aliasing

SELECT *
FROM employee_demographics 
ORDER BY age DESC
LIMIT 2, 1;


 -- Aliasing --its just a way of changing the column name.alter
 
 SELECT gender, AVG(age) AS avg_age  -- aliasaing uses AS to change the naming. 
 FROM employee_demographics
 GROUP BY gender
 HAVING avg_age > 40;
 
 