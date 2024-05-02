-- You have been given structure of the tables in Human Resource Schema (HR).
-- Answer the following questions by writing queries

-- 1. Display employees who joined in the month of May.

SELECT *
FROM employees
WHERE TO_CHAR(hire_date, 'MM') = '05';

SELECT *
FROM employees
WHERE TO_CHAR(hire_date, 'MON') = 'MAY';


-- 2. Display employees who joined in the current year.

SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) =  EXTRACT(YEAR FROM sysdate);


-- 3. Display the number of days between system date and 1st January 2011.

SELECT ROUND(sysdate - TO_DATE('01-01-2011', 'DD-MM-YYYY')) FROM  dual;


-- 4. Display maximum salary of employees.

SELECT MAX(salary)
FROM employees;


-- 5. Display number of employees in each department.

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;


-- 6. Display number of employees who joined after 15th of month.

SELECT COUNT(*)
FROM employees
WHERE EXTRACT(DAY FROM hire_date) > 15;


-- 7. Display average salary of employees in each department who have commission 
-- 																	  percentage.

SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id


-- 8. Display job ID for jobs with average salary more than 10000.

SELECT job_id, ROUND(AVG(salary))
FROm employees
GROUP BY job_id
HAVING AVG(salary) > 10000;

/*
9. Display job ID, number of employees, sum of salary, and difference between the 
highest salary and the lowest salary of the employees for all jobs.
*/

SELECT job_id, COUNT(*), SUM(salary),
MAX(salary) - MIN(salary) AS "difference"
FROM employees
GROUP BY job_id;


-- 10.Display manager ID and number of employees managed by the manager.

SELECT manager_id, COUNT(*)
FROM employees
GROUP BY manager_id;


-- 11.Search for the key differences between CHAR and VARCHAR data types.
-- CHAR - Fixed-length strings
-- VARCHAR -  Variable-length string.



