--								Joins 1
						
-- 						INNER JOIN (or sometimes called simple join)

/*
It is the most common type of join. Oracle INNER JOINS return all rows from multiple 
tables where the join condition is met.

						SELECT table1.column, table2.column
						FROM table1
						INNER JOIN table2
						ON table1.column_name = table2.column_name;
*/


SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
INNER JOIN departments dep ON emp.department_id = dep.department_id;

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
JOIN departments dep ON emp.department_id = dep.department_id;

-- 1345679
-- 125678

-- 1567
-- 1567


-- 					LEFT OUTER JOIN (or sometimes called LEFT JOIN)
/*
Another type of join is called an Oracle LEFT OUTER JOIN. This type of join returns 
all rows from the LEFT-hand table specified in the ON condition and only those rows 
from the other table where the joined fields are equal (join condition is met).

						SELECT d.department_name, e.first_name
						FROM hr.departments d
						LEFT OUTER JOIN hr.employees e
						ON d.department_id = e.department_id
						WHERE d.department_id >= 30
						ORDER BY d.department_name, e.first_name;
*/

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
LEFT JOIN departments dep ON emp.department_id = dep.department_id;

-- 1345679
-- 125678

-- 1345679
-- 1NN567N


-- 							RIGHT OUTER JOIN
/*
Another type of join is called an Oracle RIGHT OUTER JOIN. This type of join returns 
all rows from the RIGHT-hand table specified in the ON condition and only those rows 
from the other table where the joined fields are equal (join condition is met).

					SELECT d.department_name, e.first_name
					FROM hr.employees e
					RIGHT OUTER JOIN hr.departments d
					ON e.department_id = d.department_id
					WHERE d.department_id >= 30
					ORDER BY d.department_name, e.first_name;
*/	

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
RIGHT JOIN departments dep ON emp.department_id = dep.department_id;

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM departments dep
RIGHT JOIN employees emp  ON emp.department_id = dep.department_id;

-- 1345679
-- 125678

-- 1N567N
-- 125678


-- 									JOINS 2

--								FULL OUTER JOIN
/*
Another type of join is called an Oracle FULL OUTER JOIN. This type of join returns
all rows from the LEFT-hand table and RIGHT-hand table with nulls in place where 
the join condition is not met.

					SELECT d.department_name, e.first_name
					FROM hr.employees e
					FULL OUTER JOIN hr.departments d
					ON e.department_id = d.department_id
					ORDER BY d.department_name, e.first_name;
*/

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
FULL JOIN departments dep ON emp.department_id = dep.department_id;

-- 1345679
-- 125678

--1345679nn
--1nn567n28


-- 								CROSS JOIN
/*
A CROSS JOIN is a JOIN operation that produces the Cartesian product of two tables. 
Unlike other JOIN operators, it does not let you specify a join clause. You may, 
however, specify a WHERE clause in the SELECT statement.

						SELECT e.first_name, d.department_name
						FROM hr.employees e
						CROSS JOIN hr.departments d
						ORDER BY e.first_name, d.department_name;

*/

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id
FROM employees emp
CROSS JOIN departments dep;

-- 1345679
-- 125678

-- 111111333333
-- 125678125678


-- 									advanced

SELECT emp.first_name, emp.last_name, emp.salary, dep.department_name, dep.department_id
FROM employees emp
JOIN departments dep 
ON emp.department_id = dep.department_id AND emp.salary>5000; --first filtered employees
															 --table then joined

SELECT emp.first_name, emp.last_name, emp.salary, dep.department_name, dep.department_id
FROM employees emp
JOIN departments dep ON emp.department_id = dep.department_id
WHERE emp.salary > 5000; -- joined then filtered


SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id, loc.city
FROM employees emp
JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON loc.location_id = dep.location_id
		
		
-- 							[self] JOIN	
/*
A self join is a join in which a table is joined with itself.
*/

-- 							Task for [self] JOIN
-- Her iscinin qarsisinda onun menecerinin adinin ve soyadini gosterin

SELECT emp.first_name ||' ' || emp.last_name employee, 
meneger.first_name || ' ' || meneger.last_name meneger
FROM employees emp
LEFT JOIN employees meneger ON emp.manager_id = meneger.employee_id
ORDER BY meneger.first_name

/*
employee_id  employee_name  meneger_id
    1          Bahruz          2
	2		   Orxan           3
	3          Sanan
*/



-- 								 JOIN....  USING
/*
						SELECT e.first_name, d.department_name
						FROM hr.employees e
						JOIN hr.departments d
						USING(department_id)
						ORDER BY e.first_name;
*/

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id, loc.city
FROM employees emp
JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc USING(location_id)


--  							SET OPERATORS

-- 								  UNION ALL
/*
The Oracle UNION ALL operator is used to combine the result sets of 2 or more 
SELECT statements. It returns all rows from the query and it does not remove duplicate 
rows between the various SELECT statements.

Each SELECT statement within the Oracle UNION ALL operator must have the same number 
of fields in the result sets with similar data types.

						SELECT expression1, expression2, ... expression_n
						FROM tables
						[WHERE conditions]
						UNION ALL
						SELECT expression1, expression2, ... expression_n
						FROM tables
						[WHERE conditions];
*/

/*
					employee_id  employee_name  meneger_id
						1          Bahruz          2
						2		   Orxan           3
						3          Sanan
			         --------------------------------------
						1          dqwqwd           1
						2		   wddqddq          2
						3          wdwqdq	        3
						
*/

SELECT country_name
FROM countries
WHERE region_id = 1
UNION ALL
SELECT country_name
FROM countries
WHERE region_id = 1 OR region_id = 2
ORDER BY country_name

SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
UNION ALL
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50)

SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
UNION ALL
SELECT first_name, last_name, salary, hire_date, NULL
FROM employees
WHERE department_id in (30, 40, 50);



-- 								    UNION
/*
The Oracle UNION operator is used to combine the result sets of 2 or more Oracle 
SELECT statements. It removes duplicate rows between the various SELECT statements.

Each SELECT statement within the UNION operator must have the same number of fields 
in the result sets with similar data types.

						SELECT expression1, expression2, ... expression_n
						FROM tables
						[WHERE conditions]
						UNION
						SELECT expression1, expression2, ... expression_n
						FROM tables
						[WHERE conditions];							
*/

SELECT country_name
FROM countries
WHERE region_id = 1
UNION
SELECT country_name
FROM countries
WHERE region_id = 1 OR region_id = 2
ORDER BY country_name

SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
UNION
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50)
						

--             					INTERSECT
/*
The Oracle INTERSECT operator is used to return the results of 2 or more SELECT 
statements. However, it only returns the rows selected by all queries or data sets. 
If a record exists in one query and not in the other, it will be omitted from the 
INTERSECT results.
*/

SELECT country_name
FROM countries
WHERE region_id = 1
INTERSECT
SELECT country_name
FROM countries
WHERE region_id = 1 OR region_id = 2
ORDER BY country_name

SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
INTERSECT
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50);


-- 		 						MINUS
/*
The Oracle MINUS operator is used to return all rows in the first SELECT statement 
that are not returned by the second SELECT statement. Each SELECT statement will 
define a dataset. The MINUS operator will retrieve all records from the first dataset 
and then remove from the results all records from the second dataset.
*/

SELECT country_name
FROM hr.countries
WHERE region_id = 1 OR region_id = 3
MINUS
SELECT country_name
FROM hr.countries
WHERE region_id = 1 OR region_id = 2
ORDER BY country_name

SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
MINUS
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50);


-- 						    	SUBQUERIES
/*
In Oracle, a subquery is a query within a query. You can create subqueries within your 
SQL statements. These subqueries can reside in the WHERE clause, the FROM clause, or 
the SELECT clause.
*/

SELECT * FROM (

SELECT emp.first_name, emp.last_name, dep.department_name, dep.department_id, loc.city
FROM employees emp
JOIN departments dep ON emp.department_id = dep.department_id
LEFT JOIN locations loc ON loc.location_id = dep.location_id ) emp_dep
WHERE department_id = 30

SELECT * FROM (
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (20, 30 ,40)
MINUS
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50));

-- 						Correlated subquery
-- Her iscinin qarsisinda onun departamentindeki maksimum maasi gosterin
				
SELECT emp.first_name, ms.max_salary
FROM employees emp
LEFT JOIN 
(SELECT department_id, MAX(salary) max_salary
FROM employees
GROUP BY department_id) ms ON emp.department_id = ms.department_id
						
-- 						Inline Subqueries
-- step 1
SELECT MAX(salary) FROM employees WHERE department_id=50
-- step 2
SELECT emp.first_name, 0 max_salary
FROM employees emp
-- step 3
SELECT emp.first_name, emp.department_id,
(SELECT MAX(salary) FROM employees WHERE department_id=50) max_salary
FROM employees emp
-- step 4
SELECT emp.first_name, emp.department_id,
(SELECT MAX(salary) FROM employees WHERE department_id=emp.department_id) max_salary
FROM employees emp

SELECT emp.first_name, emp.department_id,
(SELECT salary FROM employees WHERE department_id=emp.department_id) max_salary
FROM employees emp -- ORA-01427: single-row subquery returns more than one row

SELECT emp.first_name, emp.department_id,
(SELECT salary, 
 hire_date FROM employees WHERE department_id=emp.department_id) max_salary
FROM employees emp -- ORA-00913: too many values


-- step 1
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (30, 40, 50);
-- step 2	
SELECT department_id FROM departments WHERE manager_id IS NOT null
-- step3
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
WHERE department_id in (
	SELECT department_id FROM departments WHERE manager_id IS NOT null
);

-- analog code with join
SELECT first_name, last_name, salary, hire_date, department_id
FROM employees
JOIN departments dep USING(department_id)
WHERE dep.manager_id IS NOT null;


