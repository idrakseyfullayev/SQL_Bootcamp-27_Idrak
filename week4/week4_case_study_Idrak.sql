-- 1. Return the name of the employee with the lowest salary in department 90.

SELECT *
FROM employees emp
WHERE salary = (SELECT MIN(salary)
				FROM employees
				WHERE department_id = 90) AND emp.department_id = 90
	
	
-- 2. Select the department name, employee name, and salary of all employees who work in 
-- the human resources or purchasing departments. Compute a rank for each unique salary 
-- in both departments.

SELECT dep.department_name, emp.first_name, salary,
DENSE_RANK() OVER (PARTITION BY dep.department_id ORDER BY salary)
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id
WHERE dep.department_id IN (30, 40)


-- 3. Select the 3 employees with minimum salary for department id 50.

SELECT first_name, d_rnk FROM
    	(SELECT first_name,
		 DENSE_RANK() OVER (ORDER BY salary) d_rnk
		 FROM hr.employees
		 WHERE department_id = 50 )
WHERE d_rnk IN (1, 2, 3)					


-- 4. Show first name, last name, salary and previously listed employee’s salary who 
-- works in “IT_PROG” over hire date.

SELECT first_name, last_name, hire_date, salary,
LAG(salary, 1, 0) OVER (ORDER BY hire_date)
FROM hr.employees
WHERE job_id = 'IT_PROG'


-- 5. Display details of current job for employees who worked as IT Programmers in 
-- the past.

SELECT first_name, j.* 
FROM employees emp
INNER JOIN jobs j ON emp.job_id = j.job_id
WHERE employee_id IN (
					  SELECT employee_id
					  FROM job_history
					  WHERE job_id = 'IT_PROG')

SELECT first_name, j.* 
FROM employees emp
INNER JOIN jobs j ON emp.job_id = j.job_id
INNER JOIN job_history j_h ON emp.employee_id = j_h.employee_id
WHERE j_h.job_id = 'IT_PROG'


-- 6. Make a copy of the employees table and update the salaries of the employees in 
-- the new table with the maximum salary in their departments.

CREATE TABLE employees_copy AS(
								SELECT * FROM employees
)

UPDATE employees_copy ec
SET salary = (SELECT MAX(salary)
			 FROM employees_copy emp
			 WHERE emp.department_id = ec.department_id)

SELECT * 
FROM employees_copy


-- 7. Make a copy of the employees table and update the salaries of the employees in the
-- new table with a 30 percent increase.

UPDATE employees_copy ec
SET ec.salary = ec.salary * 1.3

