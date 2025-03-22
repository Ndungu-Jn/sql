-- Triggers  and events -- trigger is a block of code that excecutes automatically when an event takes place

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE  TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics( employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Mark', 'Kamau', 'Agentic CTO', '1000000', NULL);


-- EVENTS -- TAKES PLACE WHEN IT SCHEDULED.
--  for example, if someone is above 60 years, the time  for retirement has reached.

SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retired_people
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
    WHERE AGE >= 60;
END $$
DELIMITER ;














