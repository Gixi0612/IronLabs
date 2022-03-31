use employees_mod;

DROP PROCEDURE IF EXISTS filter_salary;

DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$
DELIMITER ;
CALL filter_salary(50000, 90000);

#breakdown between the male and female employees working in the company each year, starting from 1990.

SELECT calendar_year, sum(active)
FROM(SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
		JOIN 
	t_employees ee ON dm.emp_no = ee.emp_no
having calendar_year>=1990
ORDER BY dm.emp_no, calendar_year) as N
group by calendar_year;



#the number of male managers to the number of female managers from different departments for each year, starting from 1990.

SELECT calendar_year, dept_name, gender, count(active)
FROM 
(SELECT B.*, C.position FROM (SELECT *,
CASE 
WHEN  emp_no is not NULL then "Manager"
END as position
from t_dept_manager) C
JOIN (SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
		JOIN 
	t_employees ee ON dm.emp_no = ee.emp_no
having calendar_year>=1990
ORDER BY dm.emp_no, calendar_year) B
on C.emp_no = B.emp_no
WHERE C.position = "Manager") as M 
group by calendar_year, dept_name, gender
order by calendar_year asc;

#the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.
SELECT
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender;
