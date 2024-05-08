-- https://www.techonthenet.com/oracle/functions/instr.php

-- Implicit data type conversions

SELECT *
FROM employees
WHERE department_id = '20';

SELECT *
FROM employees
WHERE hire_date = '2001-08-17';


-- Explicit data type conversions

-- TO_CHAR(input, format) - Converts time stamp to string according to the given format.

SELECT first_name, hire_date,
TO_CHAR(hire_date, 'DD-MM-YYYY') string_date
FROM employees;

SELECT first_name, hire_date,
TO_CHAR(hire_date, 'YYYY') string_year,
TO_CHAR(hire_date, 'mm') string_mon,
TO_CHAR(hire_date, 'DD') string_day,
TO_CHAR(salary) string_salary, 
TO_CHAR(hire_date, 'MM-YYYY') string_mon_year
FROM employees;

SELECT first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'MM-YYYY') = '03-2000';


-- TO_DATE(text,format) - Converts string to date according to the given format.

SELECT TO_DATE('12-12-2023', 'dd.mm.yyyy') FROM dual;

SELECT * FROM dual;

SELECT first_name, hire_date,
TO_CHAR(hire_date, 'DD-MM-YYYY') string_year,
TO_DATE(TO_CHAR(hire_date, 'DD-MM-YYYY'), 'DD-MM-YYYY')
FROM employees;


-- to_number(string, format) - to convert a string to a number based on a specified format.


SELECT first_name, hire_date,
TO_CHAR(hire_date, 'DD-MM-YYYY') string_year,
TO_DATE(TO_CHAR(hire_date, 'DD-MM-YYYY'), 'DD-MM-YYYY'),
TO_NUMBER(TO_CHAR(SALARY))
FROM employees;


--String Functions

--CONCAT('A', 'AB') - Concatenate two strings into one

SELECT CONCAT('A', 'AB') FROM dual;

SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT CONCAT(CONCAT(first_name, ' '), last_name)
FROM employees;

SELECT CONCAT(first_name, CONCAT(' ', last_name))
FROM employees;

SELECT CONCAT(first_name ||' ', last_name)
FROM employees;

SELECT CONCAT(first_name, ' ' || last_name)
FROM employees;

SELECT first_name || ' ' || last_name
FROM employees;


-- INITCAP(string) - function to convert a string to a proper case.

SELECT INITCAP('bahruz ahmadov') FROM dual;


-- LOWER(text) - function to convert the string to all lowercase.

SELECT LOWER('AZERbayCAN BaKi') FROM dual;


-- UPPER(text) function to convert a string to uppercase.

SELECT UPPER('azerbaycab baki') FROM dual;

SELECT first_name 
FROM employees
WHERE LOWER(first_name) = 'sundar';


-- LENGTH(string) - functions to get the number of characters of a string.

SELECT LENGTH('Azerbaycab Baki') FROM dual;

SELECT *
FROM employees 
WHERE LENGTH(first_name) < 5;

SELECT LENGTH(first_name), emp.*
FROM employees emp
WHERE LENGTH(first_name) < 5;

SELECT LENGTH(first_name), employees.*
FROM employees
WHERE LENGTH(first_name) < 5;

-- TRIM() - to remove specified prefixes or suffixes (or both) from a string.
-- LTRIM(string, character) -to remove specified characters from the beginning of a string.
-- RTRIM(string, character) function to remove specified characters from the end of a string.

SELECT LTRIM('!AZERBAYCAN', '!') FROM dual;

SELECT 'A' || ' B ' || 'C',
'A' || TRIM(' B ') || 'C',
'A' || LTRIM(' B ') || 'C',
'A' || RTRIM(' B ') || 'C'
FROM dual;

SELECT *
FROM employees
WHERE LOWER(TRIM(first_name)) LIKE '%sundar%';


-- REPLACE(source, from_text, to_text)- function replaces all occurrences of a substring
--															with a new one in a string.

SELECT REPLACE('Azerbaycan', 'e', 'ə') FROM dual;

SELECT REPLACE('Azerbaycan Baki', ' ', '') FROM dual;


-- LPAD(string, length, [fill]) - function pad a string on the left to a specified 
--     										length with a sequence of characters.

--RPAD(string, length, fill) function allows you to extend a string to a length 
--   												by appending specified characters.

SELECT RPAD('Baki', 10, '*'), LPAD('Baki', 10, '*') FROM dual;

SELECT RPAD('Baki', 3, '*'), LPAD('Baki', 10, '*') FROM dual;

SELECT first_name, RPAD(first_name, 9, '*')
FROM employees;


-- SUBSTRING(string, start_position, length) - function allows you to extract a 
--									substring from a string and return the substring.

SELECT SUBSTR('Azerbaycan', 8, 3) FROM dual;
SELECT SUBSTR('Azerbaycan Baki', 8) FROM dual;
SELECT SUBSTR('Azerbaycan', -3, 3) FROM dual;


-- INSTR(string, substring [, start_position [, th_appearance ] ]) - 
--					function returns the location of a substring in a string.

SELECT INSTR('Azerbaycan', 'a', 1, 1) FROM dual;
SELECT INSTR('Azerbaycan', 'a', 1, 2) FROM dual;
SELECT INSTR('Azerbaycan', 'a', 7, 2) FROM dual;
SELECT INSTR(LOWER('Azerbaycan'), 'a', 1, 1) FROM dual;

-- B***z Q**v
-- B****z Q*****v

SELECT SUBSTR(first_name, 1, 1) || '***' || SUBSTR(first_name, -1, 1)
FROM employees;

SELECT RPAD(SUBSTR(first_name, 1, 1), LENGTH(first_name)-1, '*') || 
SUBSTR(first_name, -1, 1)
FROM employees;


-- COALESCE( expr1, expr2, ... expr_n ) -returns the first non-null expression in the 
--list. If all expressions evaluate to null, then the COALESCE function will return null.

SELECT commission_pct, manager_id, COALESCE(commission_pct, manager_id)
AS new_cl
FROM employees;


-- DECODE( expression , search , result [, search , result]... [, default] )
-- DECODE function has the functionality of an IF-THEN-ELSE statement.

SELECT DECODE(1, 1, 'One') FROM dual;

SELECT DECODE(1, 2, 'One') FROM dual;

SELECT DECODE(1, 1, 'One', 'Not One') FROM dual;

SELECT first_name,
DECODE(SUBSTR(first_name, 1, 1), 
	   'A', 'Ilk herf A dir',  
	   'B', 'Ilk herf B dir', 
	   'C', 'Ilk herf C dir',
	   'Qeyd olunan herf tapilmadi')
FROM employees;		


-- CASE
/*
CASE statement has the functionality of an IF-THEN-ELSE statement. Starting in 
Oracle 9i, you can use the CASE statement within a SQL statement.

CASE [ expression ]

   WHEN condition_1 THEN result_1
   WHEN condition_2 THEN result_2
   ...
   WHEN condition_n THEN result_n

   ELSE result

END

*/


SELECT first_name,  salary,
	CASE 
		WHEN salary BETWEEN 0 AND 5000 THEN 'pis yasayir'
		WHEN salary BETWEEN 5000 AND 10000 THEN 'orta  yasayir'
		WHEN salary BETWEEN 10000 AND 20000 THEN 'yaxsi yasayir'
		ELSE 'nece yasayir bilmirik'
	END salary
FROM employees;

--iscilerin hansi fesilde qebul olundugunu tapin

SELECT first_name, hire_date,
	CASE 
		WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
		WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
		WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
	ELSE 'winter'
	END 
FROM employees;	

SELECT TO_CHAR(hire_date, 'MM') FROM employees;


SELECT first_name, hire_date,
	CASE 
		WHEN TO_CHAR(hire_date, 'MON') IN ('DEC', 'JAN', 'FEV') THEN 'winter'
		WHEN TO_CHAR(hire_date, 'MON') IN ('JUN', 'JUL', 'AUG') THEN 'summer'
		WHEN TO_CHAR(hire_date, 'MON') IN ('SEP', 'OCT', 'NOV') THEN 'autumn'
	ELSE 'spring'
	END 
FROM employees;


-- NVL( string1, replace_with ) - function lets you substitute a value when a 
--													null value is encountered.

SELECT commission_pct, COALESCE(commission_pct, 1)
FROM employees;

SELECT commission_pct, COALESCE(TO_CHAR(commission_pct), 'a')
FROM employees;

SELECT commission_pct, NVL(commission_pct, 1)
FROM employees;

SELECT commission_pct, NVL(TO_CHAR(commission_pct), 'null dur')
FROM employees;

SELECT sysdate FROM dual;

-- MONTHS_BETWEEN( date1, date2 ) - function returns the number of months between 
--																  date1 and date2.

-- ROUND( number [, decimal_places] ) - returns a number rounded to a certain 
--												      number of decimal places.



SELECT ROUND(MONTHS_BETWEEN(sysdate, hire_date), 2)
FROM employees;

/*
EXTRACT (
{ YEAR | MONTH | DAY | HOUR | MINUTE | SECOND }
| { TIMEZONE_HOUR | TIMEZONE_MINUTE }
| { TIMEZONE_REGION | TIMEZONE_ABBR }
FROM { date_value | interval_value } )

EXTRACT() - function extracts a value from a date or interval value

*/

SELECT 
hire_date,
EXTRACT(YEAR FROM hire_date) il,
EXTRACT(month FROM hire_date) ay,
EXTRACT(DAY FROM hire_date) gun
FROM employees;


-- LAST_DAY(date) - function returns the last day of the month based on a date value.

SELECT first_name,
hire_date, LAST_DAY(hire_date)
FROM employees;

--ROUND( date [, format]) - function returns a date rounded to a specific unit 
--																	of measure.

SELECT first_name,
hire_date, ROUND(hire_date, 'MM')
FROM employees;

SELECT first_name,
hire_date, ROUND(hire_date, 'YYYY')
FROM employees;

--TRUNC(number [, decimal_places]) -  returns a number truncated to a certain number 
--																    of decimal places.

SELECT TRUNC(125.815) FROM dual;


-- TRUNC (date [, format ]) - returns a date truncated to a specific unit of measure.

SELECT hire_date,
TRUNC(hire_date, 'MM')
FROM employees;

SELECT hire_date,
TRUNC(hire_date, 'YEAR')
FROM employees;

--                         AGGREGATE FUNCTIONS


-- MIN(aggregate_expression)  - returns the minimum value of an expression.
-- MAX 						  - returns the maximum value of an expression.
-- SUM 						  - returns the summed value of an expression.
-- COUNT 					  - returns the count of an expression.
-- AVG 						  - returns the average value of an expression.

SELECT MIN(salary), MAX(salary), SUM(salary), COUNT(*), AVG(salary)
FROM employees;

SELECT first_name, manager_id
FROM employees;

SELECT COUNT(first_name), COUNT(manager_id)
FROM employees;

SELECT COUNT(*), COUNT(manager_id)
FROM employees;


-- GROUP BY
-- The Oracle GROUP BY clause is used in a SELECT statement to collect data across 
-- multiple records and group the results by one or more columns.

/*
				SELECT expression1, expression2, ... expression_n, 
					   aggregate_function (aggregate_expression)
				FROM tables
				[WHERE conditions]
				GROUP BY expression1, expression2, ... expression_n;
*/


SELECT department_id,
MIN(salary), MAX(salary), SUM(salary), COUNT(*), AVG(salary)
FROM employees
GROUP BY department_id

SELECT department_id, job_id,
MIN(salary), MAX(salary), SUM(salary), COUNT(*), AVG(salary)
FROM employees
GROUP BY department_id, job_id;

SELECT 
MIN(salary), MAX(salary), SUM(salary), COUNT(*), AVG(salary)
FROM employees
GROUP BY department_id, job_id;


-- HAVING
-- The Oracle HAVING clause is used in combination with the GROUP BY clause to 
-- restrict the groups of returned rows to only those whose the condition is TRUE.

/*
					SELECT expression1, expression2, ... expression_n, 
						   aggregate_function (aggregate_expression)
					FROM tables
					[WHERE conditions]
					GROUP BY expression1, expression2, ... expression_n
					HAVING having_condition;
*/

-- iscilerinin sayi 5 den cox olan departamentlerinin sayini cixart

SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1 

SELECT COUNT(*),
	CASE 
		WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
		WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
		WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
	ELSE 'winter'
	END AS season
FROM employees
GROUP BY season;

SELECT COUNT(*),
	CASE 
		WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
		WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
		WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
	ELSE 'winter'
	END AS season
FROM employees
GROUP BY (CASE 
		WHEN TO_CHAR(hire_date, 'MM') IN ('03', '04', '05') THEN'spring'
		WHEN TO_CHAR(hire_date, 'MM') IN ('06', '07', '08') THEN 'summer'
		WHEN TO_CHAR(hire_date, 'MM') IN ('09', '10', '11') THEN 'autumn'
	ELSE 'winter'
	END);


