-- Case statements -- adds logic. Just like the if satatements in othe rprogramming language

SELECT first_name,
last_name,
age,
CASE 
	WHEN age <= 30 THEN 'Young' -- thee whole  logic
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN "going is going"
END AS Age_Bracket    
FROM employee_demographics;


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS Salary_Increase,
CASE 
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus    
FROM employee_salary;

-- Finance department gets a bonus.
SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments









