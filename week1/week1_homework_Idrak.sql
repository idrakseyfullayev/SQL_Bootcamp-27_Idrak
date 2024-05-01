/*
1. Display first name and last name as full name, salary, commission pct, and hire date
for employees with salary less than 10000.
*/

SELECT first_name || ' ' || last_name as "full name ", salary, commission_pct, hire_date
FROM employees
WHERE salary < 10000


/*
2. Display city names (without repeated names) in ascending order from locations table.
*/

SELECT DISTINCT city 
FROM locations
ORDER BY city


/*
3. Display the first name, hire date and job ID of the employees who is either IT 
Programmer or Sales Manager, and hired between 2002 and 2005.
*/

SELECT first_name, hire_date, job_id
FROM employees
WHERE (job_id = 'IT_PROG' OR job_id = 'SA_MAN') AND
hire_date BETWEEN '01-01-2002' AND '2005-12-31'


/*
4. Display details from jobs table in the descending order of the job title.
*/

SELECT *
FROM jobs
ORDER BY job_title DESC


/*
5. Display details of the employees where commission percentage is null and salary in 
the range 5000 to 10000 and department id is 30.
*/

SELECT *
FROM employees
WHERE commission_pct IS NULL AND salary BETWEEN 5000 AND 10000 AND department_id = 30


/*
6. Display employees who joined after 1st January 2008.
*/

SELECT *
FROM employees
WHERE hire_date > '01-Jan-2008'


/*
7. Display details of employees with ID 150, 160 or 170.
*/

SELECT *
FROM employees
WHERE employee_id in (150, 160, 170)


/*
8. Display employees where the first name or last name starts with S.
*/

SELECT *
FROM employees
WHERE first_name LIKE 'S%' OR last_name LIKE 'S%'

/*
9. Display the length of first name for employees where last name contain character ‘b’
after 3rd position.
*/

SELECT LENGTH(first_name)
FROM employees
WHERE last_name LIKE '___%b%';

