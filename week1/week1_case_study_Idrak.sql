/* 1) Write a query in SQL to display job Title, the difference between minimum and 
maximum salaries for those jobs which max salary within the range 12000 to 18000.
*/

SELECT job_title , max_salary - min_salary AS "salary_dif"
FROM jobs
WHERE max_salary BETWEEN 12000 and 18000;


/*
2) Display the details of the employees who have no commission percentage and whose 
salary is within the range 7000 to 12000 for those employees who are not working 
in the departments 50,30 and 80.
*/

SELECT *
FROM employees
WHERE commission_pct IS NULL AND salary BETWEEN 7000 AND 12000 AND 
department_id NOT IN (50, 30, 80);


/*
3) Write a query in SQL to display the full name (first name and last name), hire date,
commission percentage, email and telephone separated by '-', and salary for those
employees whose salary is above 11000 and make the result set in a descending order
by the full name.
*/

SELECT first_name || ' ' || last_name AS full_name, hire_date, commission_pct,
email || '-' || phone_number AS address, salary
FROM employees
WHERE salary > 11000
ORDER BY full_name DESC;

SELECT first_name || ' ' || last_name AS full_name, hire_date, commission_pct,
email || '-' || phone_number AS address, salary
FROM employees
WHERE salary > 11000
ORDER BY 1 DESC;


/*
4) Write a query in SQL to display the first and last name, and salary for 
those employees whose first name is ending with the letter “m” and they have 
been hired before June 5th, 2010.
*/

SELECT first_name, last_name, salary, hire_date
FROM employees
WHERE first_name LIKE '%m' AND hire_date < '2010-june-05'


/*
5) Display the full name (first and last), the phone number and email separated 
by hyphen, and salary, for those employees whose salary is not within the
range of 9000 and 17000 and commission is not null. The column headings assign
with Full_Name, Contact _Details and Remuneration respectively.
*/

SELECT first_name || ' ' || last_name AS full_name,
phone_number || '-' || email AS "contcat_details", salary
FROM employees
WHERE salary NOT BETWEEN 9000 AND 17000 AND commission_pct IS NOT NULL;

/*
6) Write a query in SQL to display all the information about the department Marketing.
*/

SELECT *
FROM departments
WHERE department_id = 20


/*
7) Write a query to display data from job_history and make the result set in
descending order by the epmloyee_id and ascending order by start date.
*/

SELECT *
FROM job_history
ORDER BY employee_id DESC, start_date


/*
8) Write a query to display job_id and salary of employees whose phone number 
starts with 515 or 590 and was hired after 2003 by sorting hire_date and salary
in ascending way.
*/

SELECT job_id, salary
FROM employees
WHERE (phone_number LIKE '515%' OR phone_number LIKE '590%') 
AND hire_date > '2003-12-31'
ORDER BY hire_date, salary ASC


/*
9) Write a query to display employees who were hired in 2001.
*/

SELECT *
FROM employees
WHERE hire_date between '2001-01-01' AND '2001-12-31'

SELECT *
FROM employees
WHERE hire_date LIKE '2001%'


/*
10) Write a query to display employees’ first and last name who were not 
hired in 2006 and 2007.
*/

SELECT first_name, last_name
FROM employees
WHERE hire_date NOT BETWEEN '2006-01-01' AND '2007-12-31'

SELECT *
FROM employees
WHERE hire_date NOT LIKE '2006%' AND hire_date NOT LIKE '2007%'
/

/*11) Write a query to display email, job_id and first name of employees whose 
hired year was 2007 or hired month was 1.
*/

SELECT email, job_id, first_name
FROM employees
WHERE hire_date LIKE '2007%' OR hire_date LIKE '%-01-'

SELECT email, job_id, first_name
FROM employees
WHERE hire_date BETWEEN '01-01-2007' AND '31-12-2007' OR hire_date LIKE '%-01-'

SELECT email, job_id, first_name, hire_date
FROM employees
WHERE CAST(hire_date AS varchar) LIKE '2007%' OR CAST(hire_date AS varchar)LIKE '%-01-%'

*
/*
12) Write a query to display details of employees who was hired after 2007 or salary 
is less than 10000.
*/

SELECT * 
FROM employees
WHERE hire_date > '2007-12-31' OR salary < 10000

