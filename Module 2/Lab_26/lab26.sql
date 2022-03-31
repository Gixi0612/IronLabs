Use employees_mod;
DELIMITER $$

CREATE PROCEDURE emp1()
BEGIN
SELECT * FROM t_employees
LIMIT 1000;
END$$
DELIMITER ;

CALL emp1();
# Create a procedure that will provide the average salary of all employees.
DELIMITER $$
CREATE PROCEDURE avg_salary1()
BEGIN
            	SELECT
                            	AVG(salary)
            	FROM
                            	t_salaries;
END$$
DELIMITER ;

CALL avg_salary1();
#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.
DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name CHAR(255), in p_last_name CHAR(255))
BEGIN
SELECT
	e.emp_no
FROM
	t_employees e
WHERE 
	e.first_name = p_first_name
			AND e.last_name = p_last_name;
   END$$
   DELIMITER ;
   
CALL emp_info('Mayuko','Warwick');

#Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.
#Hint: In the BEGIN-END block of this program, you need to declare and use two variables – v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type

drop function if exists emp_info;
DELIMITER $$
CREATE FUNCTION emp_info(first_name varchar(100), last_name varchar(100)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary decimal(10,2);
SELECT max(from_date) into v_max_from_date
from t_employees e
join t_salaries s
on s.emp_no=e.emp_no
where e.first_name=first_name and e.last_name=last_name;
SELECT s.salary into v_salary
from t_employees e
join t_salaries s
on s.emp_no=e.emp_no
where e.first_name=first_name and e.last_name=last_name and s.from_date = v_max_from_date;
RETURN v_salary;
END$$
DELIMITER ;
SELECT EMP_INFO('Saniya', 'Kalloufi');
  
    
Select * from t_employees a
join t_salaries b
on a.emp_no = b.emp_no;

#Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

DELIMITER $$
CREATE TRIGGER trig_hire_date 
BEFORE INSERT ON t_employees
FOR EACH ROW
BEGIN 
	IF NEW.hire_date < DATE_FORMAT(SYSDATE(), '%Y-%M-%D') THEN 
		SET NEW.hire_date = DATE_FORMAT(SYSDATE(), '%Y-%M-%D'); 
	END IF; 
END $$
DELIMITER ;

#Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index
CREATE INDEX i_hire_date 
ON t_employees (hire_date);

DROP INDEX i_hire_date ON t_employees;


#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum. 
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

SELECT * from t_salaries
where salary > 89000;
CREATE INDEX i_salary ON t_salaries (salary);

#Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee.


Select *, 
CASE 
WHEN  emp_no is not NULL then "Regular Employee"
END as position
from t_dept_emp
where emp_no > 109990
UNION 
SELECT *,
CASE 
WHEN  emp_no is not NULL then "Manager"
END as position
from t_dept_manager
where emp_no > 109990;

#Extract a dataset containing the following information about the managers: employee number, first name, and last name.
#Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.

SELECT *,
CASE WHEN salary_raise > 30000 THEN "Higher than 30000"
ELSE "Less than 30000"
END as "Higher or Less than 30000"
FROM
(SELECT A.emp_no, A.first_name, A.last_name, (MAX(salary) - MIN(salary)) as salary_raise
FROM (SELECT t_dept_manager.emp_no, first_name, last_name
FROM t_dept_manager
LEFT JOIN t_employees
on t_dept_manager.emp_no = t_employees.emp_no) as A
LEFT JOIN t_salaries
on A.emp_no = t_salaries.emp_no
group by emp_no) as B;


#Extract the employee number, first name, and last name of the first 100 employees,
#add a fourth column, called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 
#Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT B.emp_no, B.first_name, B.last_name,
CASE WHEN to_date < DATE_FORMAT(SYSDATE(), '%Y-%M-%D') THEN "No"
ELSE "Yes"
END AS "Is still employed?" 
FROM
(SELECT t_employees.emp_no,t_employees.first_name,last_name,to_date
FROM t_employees
LEFT JOIN t_dept_emp
ON t_dept_emp.emp_no = t_employees.emp_no
ORDER BY emp_no asc
LIMIT 100) as B;
