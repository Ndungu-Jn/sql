--  Stored Procedures -- way to store the code so  its can be reusable -- its just like a function in other programming languages.
-- the key word is CREATE PROCEDURE

-- this is not the best way to do it
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;                  

CALL large_salaries();  


-- NOW THIS IS BEST PRACTICE
DELIMITER $$

CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries3()

-- parameters
DELIMITER $$

CREATE PROCEDURE large_salaries5(employee_id_param INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id_param;

	
END $$
DELIMITER ;

CALL large_salaries5(1)








  