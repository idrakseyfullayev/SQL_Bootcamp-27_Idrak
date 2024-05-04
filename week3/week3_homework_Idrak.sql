-- 1. Display last name, job title of employees who have commission percentage and 
-- belongs to department 30.

SELECT first_name, job_title
FROM employees emp
left JOIN jobs job ON emp.job_id = job.job_id
WHERE commission_pct IS NOT NULL and department_id = 30


-- 2. Display department name, manager name, and salary of the manager for all managers 
-- whose experience is more than 5 years.

SELECT d.department_name, e1.first_name || ' ' || e1.last_name AS manager_name, e1.salary
FROM hr.departments d
JOIN hr.employees e1 ON d.manager_id = e1.employee_id
JOIN hr.employees e2 ON e2.employee_id = e1.manager_id
WHERE EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM e1.hire_date) > 5;


-- 3. Display employee name if the employee joined before his manager.

SELECT emp.first_name, emp.last_name, meneg.first_name
FROM employees emp
LEFT JOIN employees meneg ON emp.manager_id = meneg.employee_id
WHERE emp.hire_date < meneg.hire_date


--4. Display employee name, job title for the jobs, employee did in the past where 
-- the job was done less than six months.

SELECT emp.first_name, jb.job_title
FROM hr.employees emp
LEFT JOIN hr.jobs jb ON emp.job_id = jb.job_id
LEFT JOIN hr.job_history jh USING(employee_id)
WHERE MONTHS_BETWEEN(sysdate, jh.start_date) < 6


-- 5. Display department name, average salary and number of employees with commission 
-- within the department.

SELECT dep.department_name, AVG(salary), COUNT(*)
FROM departments dep
JOIN employees emp ON dep.department_id = emp.department_id
WHERE commission_pct IS NOT NULL
GROUP BY dep.department_name


-- 6. Display employee name and country in which he is working.

SELECT emp.first_name || ' ' || emp.last_name, coun.country_name
FROM employees emp
LEFT JOIN departments dep USING(department_id)
LEFT JOIN locations loc USING(location_id)
LEFT JOIN countries coun USING(country_id)

