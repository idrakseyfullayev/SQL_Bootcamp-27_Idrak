-- SELECT

/*
To retrieve data from one or more columns of a table, you use the SELECT statement
with the following syntax:
*/

select * from employees;

select employee_id, first_name, last_name, salary, hire_date from employees;

select employee_id, first_name, last_name, salary, hire_date 
from employees;

select employee_id as "id", 
first_name as "işçinin adı", 
last_name "işçinin soyadı", 
salary işçinin_mAAşı, 
hire_date as "işə qəbul tarixi"
from employees;

select employee_id as "id", 
first_name as "işçinin adı", 
last_name "işçinin soyadı", 
salary "işçinin_mAAşı", 
hire_date as "işə qəbul tarixi"
from employees;

select employee_id as "id", 
first_name as "işçinin adı", 
last_name "işçinin soyadı", 
salary işçinin maaşı, 
hire_date as "işə qəbul tarixi"
from employees;

select employee_id as "id", 
first_name || last_name as "işçinin ad_soyadı", 
salary işçinin_maaşı, 
hire_date as "işə qəbul tarixi"
from employees

select employee_id as "id", 
first_name ||' '|| last_name as "işçinin ad_soyadı", 
salary işçinin_maaşı, 
hire_date as "işə qəbul tarixi"
from employees;

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", 
hire_date as "işə qəbul tarixi", salary*1.3 "Mükafat"
from employees;

SELECT *
FROM employees;

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi"
from employees;

-- Mathematical Operators
/*
=    - 	   Equal
<>   - 	   Not equal
>    - 	   Greater than
<    - 	   Less than
>=   - 	   Greater than or equal
<=   - 	   Less than or equal
BETWEEN  - Between an inclusive range

LIKE - 	Search for a pattern

IN  -    If you know the exact value you want to return for at least one of the columns
*/


--WHERE
/*
The WHERE clause specifies a search condition for rows returned by the SELECT
statement. The following illustrates the syntax of the WHERE clause:

The WHERE clause appears after the FROM clause but before the ORDER BY clause. 
Following the WHERE keyword is the search_condition that defines a condition 
which returned rows must satisfy
*/


select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi"
from employees
where salary < 5000;


-- AND
/*
The AND operator is a logical operator that combines Boolean expressions and
returns true if both expression are true. If one of the expressions is false, the AND
operator returns false.
The syntax of the AND operator is as follows:

1 expression_1 AND expression_2

The following table illustrates the result when you combine the true, false, and a
NULL value using the AND operator.
								TRUE   FALSE NUL
							      -  -  -  -  -   -
							TRUE  - TRUE   FALSE NULL
							FALSE - FALSE  FALSE FALSE
							NULL  - NULL   FALSE NULL
*/


-- OR
/*
The OR operator is a logical operator that combines Boolean expressions and
returns true if one of the expressions is true.
The following illustrates the syntax of the OR operator:

expression_1 OR expression_2

The following table shows the results the OR operator between true, false, and a
NULL value.
		
							TRUE   FALSE  NULL
						      -   -   -   -    - 
						TRUE  - TRUE   TRUE   TRUE
						FALSE - TRUE   FALSE  NULL
						NULL  - TRUE   NULL   NULL
*/						


select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi",
job_id
from employees
where salary < 5000 and job_id = 'SH_CLERK';

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi",
job_id
from employees
where salary < 5000 or job_id = 'SH_CLERK';

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi",
job_id
from employees
where salary < 5000 and job_id = 'SH_CLERK' or job_id = 'IT_PROG';

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi",
job_id
from employees
where salary < 5000 and (job_id = 'SH_CLERK' or job_id = 'IT_PROG');

select employee_id as "id", 
first_name ||'-'|| last_name as "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date as "işə qəbul tarixi",
job_id
from employees
where salary < 5000 and (lower(job_id) = 'sh_clerk' or lower(job_id) = 'it_prog');


-- BETWEEN
/*
The BETWEEN operator allows you to specify a range to test. When you use
the BETWEEN operator to form a search condition for rows returned by
a SELECT statement, only rows whose values are in the specified range are returned.
The following illustrates the syntax of the BETWEEN operator:

			expression [ NOT ] BETWEEN low AND high			
*/

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary >= 5000 AND salary <= 10000;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary BETWEEN 5000 AND 10000;


SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000;


-- IN
/*
The Oracle IN operator determines whether a value matches any values in a list or
a subquery.

The syntax of Oracle IN operator that determines whether an expression matches a
list of value is as follows:

				expression [NOT] IN (v1,v2,...)
				
	...and syntax of an expression matches a subquery:
	
				expression [NOT] IN (subquery)


********** NOTE: The IN operator is based on the OR operator **********
*/


SELECT *
FROM employees
WHERE department_id = 20 OR department_id = 30 OR 
department_id = 40 OR department_id = 50;

SELECT *
FROM employees
WHERE department_id IN (20, 30, 40, 50) 

SELECT *
FROM employees
WHERE department_id NOT IN (20, 30, 40, 50)


-- LIKE
/*
	Sometimes, you want to query data based on a specified pattern. For example, you
	may want to find contacts whose last names start with 'St' or first names end with 'er'.
	In this case, you use the Oracle LIKE operator.

	The syntax of the Oracle LIKE operator is as follows:

				expresion [NOT] LIKE pattern [ ESCAPE escape_characters ]

	Expression
	 The expression is a column name or an expression that you want to test against 
	 the pattern.
	Pattern
	 The pattern is a string to search for in the expression. The pattern includes the 
	 following wildcard characters:
		  % (percent) matches any string of zero or more character.
		  _ (underscore) matches any single character.

	Escape_character
	 The escape_character is a character that appears in front of a wildcard 
	 character to specify that the wildcard should not be interpreted as a 
	 wildcard but a regular character.
*/

SELECT *
FROM employees
WHERE first_name LIKE '%nn%'

SELECT salary
FROM hr.employees
WHERE salary LIKE '%3%'


/*
% wildcard character examples
The following example uses the % wildcard to find the phones of contacts whose last
names start with 'St':
*/

SELECT *
FROM employees
WHERE first_name LIKE '%n';

SELECT *
FROM employees
WHERE first_name LIKE 'A%';

SELECT *
FROM employees
WHERE first_name LIKE '%A%';

SELECT *
FROM employees
WHERE first_name LIKE 'A_e%';

/*
_ wildcard character examples
The following example finds the phone numbers and emails of contacts whose first
names have the following pattern 'Je_i':
*/

SELECT *
FROM employees
WHERE LOWER(first_name) LIKE '%b_hruz%';


-- IS NULL
/*
In the database world, NULL is special. It is a marker for missing information or the
information is not applicable.

SELECT * FROM orders
WHERE salesman_id = NULL
ORDER BY order_date DESC;

The following SELECT statement attempts to return all sales orders which do not
have a responsible salesman:

It returns an empty row.

The query uses the comparison operator (=) to compare the values from the
salesman id column with NULL, which is not correct.

The following query returns all sales orders that do not have a responsible
salesman:

SELECT * FROM orders
WHERE salesman_id IS NULL
ORDER BY order_date DESC;
*/

SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT first_name || ' ' || last_name AS emloyee
FROM employees
WHERE manager_id IS NULL;


--IS NOT NULL
/*
To negate the IS NULL operator, you
use the IS NOT NULL operator as
follows:

			expression | column IS NOT NULL

The operator IS NOT NULL returns true
if the expression or value in the column
is not null. Otherwise, it returns false.

For example, the following example
returns all sales orders which have a
responsible salesman:

SELECT * FROM orders
WHERE salesman_id IS NOT NULL
ORDER BY order_date DESC;
*/

SELECT first_name || ' ' || last_name AS emloyee
FROM employees
WHERE manager_id IS NOT NULL;


-- ORDER BY

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary ASC;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary DESC;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary, hire_date;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY salary, hire_date DESC;

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY 3; -- for SELECT index order by

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY department_id; -- although there isn't department_id

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY işçinin_maaşı; -- alias	

SELECT employee_id AS "id", 
first_name ||'-'|| last_name AS "işçinin ad_soyadı", 
salary "işçinin_maaşı", salary*1.3 "Mükafat", 
hire_date AS "işə qəbul tarixi",
job_id
FROM employees
WHERE salary NOT BETWEEN 5000 AND 10000
ORDER BY "Mükafat"; -- alias


--DISTINCT
/*
The DISTINCT clause is used in a SELECT statement to filter duplicate rows in the
result set. It ensures that rows returned are unique for the column or columns
specified in the SELECT clause.
*/

SELECT first_name
FROM employees
ORDER BY first_name

SELECT DISTINCT first_name
FROM employees
ORDER BY first_name

SELECT DISTINCT first_name, last_name
FROM employees
ORDER BY first_name

