-- 1. Display the first promotion year for each employee.

SELECT first_name, mhd.min_pro_date
FROM employees emp
LEFT JOIN (
	SELECT employee_id, MIN(end_date) min_pro_date
	FROM job_history
	GROUP BY employee_id
) mhd ON emp.employee_id = mhd.employee_id


-- 2. Display location, city and department name of employees who have been promoted 
-- more than once.

SELECT emp.first_name, dep.department_name, loc.city, loc.location_id
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON dep.location_id = loc.location_id
WHERE emp.employee_id in (
							SELECT employee_id
							FROM job_history
							GROUP BY employee_id
							HAVING COUNT(end_date) > 1
)

SELECT emp.first_name, dep.department_name, loc.city, loc.location_id
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON dep.location_id = loc.location_id
INNER JOIN (
			SELECT employee_id
			FROM job_history
			GROUP BY employee_id
			HAVING COUNT(end_date) > 1
) empc ON emp.employee_id = empc.employee_id

SELECT emp.first_name, dep.department_name, loc.city, loc.location_id
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON dep.location_id = loc.location_id
RIGHT JOIN (
			SELECT employee_id
			FROM job_history
			GROUP BY employee_id
			HAVING COUNT(end_date) > 1
) empc ON emp.employee_id = empc.employee_id

SELECT emp.first_name, dep.department_name, loc.city, loc.location_id
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON dep.location_id = loc.location_id
WHERE emp.employee_id = ANY(
							SELECT employee_id
							FROM job_history
							GROUP BY employee_id
							HAVING COUNT(end_date) > 1
)


-- 3.Display minimum and maximum “hire_date” of employees work in IT and HR departments.

SELECT job_id, max(hire_date), min(hire_date)
FROM employees
WHERE job_id  = 'IT_PROG' OR job_id = 'HR_REP'
GROUP BY job_id;

SELECT dep.department_name, max(hire_date), min(hire_date)
FROM departments dep
LEFT JOIN employees emp	ON dep.department_id = emp.department_id
WHERE dep.department_id IN (40, 60)
GROUP BY dep.department_name;


-- 4. Find difference between current date and hire dates of employees after sorting 
-- them by hiredate, then show difference in days, months and years.

SELECT emp.first_name, 
ROUND(sysdate - hire_date, 2) day_diff, 
ROUND(MONTHS_BETWEEN(sysdate, hire_date), 2) month_dif,
ROUND(EXTRACT(MONTH FROM sysdate) - EXTRACT(MONTH FROM hire_date), 2) year_dif
FROM hr.employees emp
ORDER BY hire_date;


-- 5. Find which departments used to hire earliest/latest.

SELECT dep.department_name, hire_date
FROM employees emp
LEFT JOIN departments dep USING(department_id)
WHERE hire_date=(SELECT MAX(hire_date)FROM employees)
UNION
SELECT dep.department_name, hire_date
FROM employees emp
LEFT JOIN departments dep USING(department_id)
WHERE hire_date=(SELECT MIN(hire_date)FROM employees)


-- 6. Find the number of departments with no employee for each city.

SELECT loc.city, COUNT(*)
FROM departments dep
LEFT JOIN employees emp ON dep.department_id = emp.department_id
LEFT JOIN locations loc ON loc.location_id = dep.location_id 
WHERE employee_id IS NULL
GROUP BY loc.city;


-- 7. Create a category called “seasons” and find in which season most employees 
-- 																	  were hired.
																	
SELECT * FROM (SELECT ss.hire_season, count(*) say
FROM 
	(SELECT first_name, hire_date,
		CASE 
			WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
			WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
			WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
		ELSE 'winter'
		END  hire_season
	FROM hr.employees) ss
GROUP BY ss.hire_season)
WHERE say = 
(SELECT MAX(say) FROM (SELECT ss.hire_season, count(*) say
FROM 
	(SELECT first_name, hire_date,
		CASE 
			WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
			WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
			WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
		ELSE 'winter'
		END  hire_season
	FROM hr.employees) ss
GROUP BY ss.hire_season))

	
-- 8. Find the cities of employees with average salary more than 5000.

SELECT loc.city, AVG(salary)
FROM employees emp
LEFT JOIN departments dep USING(department_id)
LEFT JOIN locations loc USING(location_id)
GROUP BY loc.city
HAVING AVG(salary) > 5000


SELECT loc.city, COUNT(*)
FROM employees emp
LEFT JOIN departments dep USING(department_id)
LEFT JOIN locations loc USING(location_id)
GROUP BY loc.city
HAVING AVG(salary) > 5000

			
			

