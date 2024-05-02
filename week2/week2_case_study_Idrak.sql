--You have been given structure of the tables in Human Resource Schema (HR).
--Answer the following questions by writing queries.

-- 1. Show minimum, average and maximum salary in last 15 years according to job id.

SELECT job_id,
MIN(salary), ROUND(AVG(salary), 2), MAX(salary)
FROM employees
WHERE (EXTRACT(YEAR FROM sysdate) - EXTRACT(YEAR FROM hire_date)) > 15
GROUP BY job_id;


--2. How many employees hired after 2005 for each department?

SELECT department_id, COUNT(*) say
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) > 2005
GROUP BY department_id;

--3. Write a query to show departments in which the difference between maximum and 
--               							   minimum salary is greater than 5000.


SELECT department_id, MAX(salary)-MIN(salary) difference
FROM employees
GROUP BY department_id
HAVING MAX(salary) - MIN(salary) > 5000;

--4. Display salaries of employees who has not commission pact according to departments
--																(without using where).

SELECT sum(
	CASE
		WHEN commission_pct IS NULL THEN salary
		ELSE 0
	END
)
FROM employees;

SELECT sum(
	DECODE(commission_pct, NULL, salary)
)
FROM hr.employees;  

SELECT sum(
	CASE
		WHEN commission_pct IS NULL THEN 1
		ELSE 0
	END
)
FROM employees;


SELECT sum(
	DECODE(commission_pct, NULL, 1)
)
FROM employees; 


--5. How many people has job id with average salary between 3000 and 7000?

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING AVG(salary) BETWEEN 3000 AND 7000;

--6. Find number of employees with same name.

SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1

SELECT first_name, COUNT(first_name)
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 1


--7. How many people with the same phone code work in departments 50 and 90?

SELECT COUNT(*), SUBSTR(phone_number, 1, 3)
FROM employees
WHERE department_id IN (50, 90)
GROUP BY SUBSTR(phone_number, 1, 3)
HAVING COUNT(*) > 1


--8. Display departments with count of employees more than 5 in 
--														spring and autumn.

SELECT department_id, COUNT(*)
FROM employees
WHERE EXTRACT(MONTH FROM hire_date) IN (3, 4, 5, 9, 10, 11)
GROUP BY department_id
HAVING COUNT(*) > 5;


--9. How many employees work in departments which has maximum salary more than 5000?

SELECT department_id, COUNT(*), MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 5000


--10.Change second letter of employees’ names with the last letter and display.
-- S t eve n
-- Snevet

SELECT first_name,
SUBSTR(first_name, 1, 1) ||
SUBSTR(first_name, -1, 1) ||
SUBSTR(first_name, 3, LENGTH(first_name)-3) ||
SUBSTR(first_name, 2, 1) res
FROM hr.employees

