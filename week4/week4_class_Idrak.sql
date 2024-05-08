-- 							CREATE TABLE
/*
The Oracle CREATE TABLE statement allows you to create and define a table.

						CREATE TABLE schema_name.table_name (
						column_1 data_type column_constraint,
						column_2 data_type column_constraint,
						...
						table_constraint
						);
*/

CREATE TABLE hr.site_users(
	id number NOT NULL,
	username varchar2(100),
	userpass varchar2(100),
	first_name varchar2(100),
	last_name varchar2(100),
	birth_day date,
	user_status number default 1 
);


-- 								CREATE TABLE AS

/*
You can also use the Oracle CREATE TABLE AS statement to create a table from an 
existing table by copying the existing table's columns.

It is important to note that when creating a table in this way, the new table will
be populated with the records from the existing table (based on the SELECT Statement).

							CREATE TABLE new_table
  								AS (SELECT * FROM old_table);
*/

SELECT * FROM (
	SELECT employee_id, first_name, last_name, salary, department_name, dep.department_id
	FROM 
	employees emp
	LEFT JOIN departments dep ON emp.department_id = dep.department_id)

CREATE TABLE emp_dep_data AS(
	SELECT employee_id, first_name, last_name, salary, department_name, dep.department_id
	FROM 
	employees emp
	LEFT JOIN departments dep ON emp.department_id = dep.department_id
)

						
-- 							DROP TABLE
/*
The Oracle DROP TABLE statement allows you to remove or delete a table from the 
Oracle database.

							DROP TABLE [schema_name].table_name
							[ CASCADE CONSTRAINTS ]
							[ PURGE ];
*/

DROP TABLE site_users
					
					
-- 							TRUNCATE TABLE 
/*
The TRUNCATE TABLE statement is used to remove all records from a table in Oracle. 
It performs the same function as a DELETE statement without a WHERE clause.

					TRUNCATE TABLE [schema_name.]table_name
						 [ PRESERVE MATERIALIZED VIEW LOG | PURGE MATERIALIZED VIEW LOG ]
						 [ DROP STORAGE | REUSE STORAGE ] ;
*/			
			
TRUNCATE TABLE site_users			
			
			
-- 							ALTER TABLE
/*	
The Oracle ALTER TABLE statement is used to add, modify, or drop/delete columns in a 
table. The Oracle ALTER TABLE statement is also used to rename a table.

							Rename table
							
						ALTER TABLE table_name
 						 RENAME TO new_table_name;	
*/

ALTER TABLE site_users1 RENAME TO site_users


-- 						Add column in table
/*
					ALTER TABLE table_name
  					   ADD column_name column_definition;
*/
								
ALTER TABLE site_users ADD city varchar2(45)							
							
							
-- 						Add multiple columns in table					
/*
					ALTER TABLE table_name
					  ADD (column_1 column_definition,
						   column_2 column_definition,
						   ...
						   column_n column_definition);					   		
*/								

ALTER TABLE site_users ADD (region varchar2(45),
							country varchar2(50))

							
-- 							Modify column in table
/*						
						ALTER TABLE table_name
  							MODIFY column_name column_type;
*/						
						
ALTER TABLE site_users
MODIFY first_name varchar(64);
							

-- 							Modify Multiple columns in table
/*
						ALTER TABLE table_name
						  MODIFY (column_1 column_type,
								  column_2 column_type,
								  ...
								  column_n column_type);	
*/

ALTER TABLE site_users
MODIFY (first_name varchar2(45),
    	last_name varchar2(45));


-- 								Drop column in table
/*							
							ALTER TABLE table_name
							  DROP COLUMN column_name;
*/

ALTER TABLE site_users
	DROP COLUMN region

							
-- 								Rename column in table
/*
							ALTER TABLE table_name
							  RENAME COLUMN old_name TO new_name;
*/

ALTER TABLE site_users
	RENAME COLUMN country TO region

							
-- 							INSERT
/*
The Oracle INSERT statement is used to insert a single record or multiple records 
into a table in Oracle.

					INSERT INTO table
						(column1, column2, ... column_n )
						VALUES
						(expression1, expression2, ... expression_n );

*/

INSERT INTO site_users (id, username, first_name, last_name, birth_day, user_status)
					VALUES (1, 'test', 'Eli', 'Eliyev', TRUNC(sysdate)-1, 1)



-- 							COMMIT
/*
In Oracle, the COMMIT statement commits all changes for the current transaction. 
Once a commit is issued, other users will be able to see your changes.
*/

SELECT *
FROM site_users
COMMIT;

INSERT INTO site_users (id, username, first_name, last_name, birth_day, user_status)
					VALUES (2, 'test', 'Eli', 'Eliyev', TRUNC(sysdate)-1, 1)

-- 								ROLLBACK
/*
In Oracle, the ROLLBACK statement is used to undo the work performed by the current 
transaction or a transaction that is in doubt.
*/


SELECT *
FROM site_users

ROLLBACK


-- cedvelde 2 setir var
-- sonra 1 setir elave edildi
--  1 cedvel CREATE olundu
-- 2 setir elave olundu
-- rollback olundu

-- nece setir oldu?
-- cavab 3

INSERT INTO site_users (SELECT employee_id, SUBSTR(first_name, 1, 2) || 
						SUBSTR(last_name,1, 2), '12345', first_name, last_name, 
						hire_date, 1
						FROM employees)

SELECT * FROM site_users

							
-- 							DELETE 
/*
The Oracle DELETE statement is used to delete a single record or multiple records 
from a table in Oracle.
						
						DELETE FROM table
						[WHERE conditions];				
*/

SELECT *
FROM site_users

DELETE FROM site_users
WHERE city IS NULL

DELETE FROM site_users

						
-- 								UPDATE

/*
The Oracle UPDATE statement is used to update existing records in a table in an Oracle 
database. There are 2 syntaxes for an update query in Oracle depending on whether you 
are performing a traditional update or updating one table with data from another table.

							UPDATE table
							SET column1 = expression1,
								column2 = expression2,
								...
								column_n = expression_n
							[WHERE conditions];
							
							
							UPDATE customers
							SET state = 'California',
								customer_rep = 32
							WHERE customer_id > 100;
							
							UPDATE customers
							 SET c_details = (SELECT contract_date
							 FROM suppliers
							 WHERE suppliers.supplier_name = customers.customer_name)
WHERE customer_id < 1000;
*/


CREATE TABLE employees_copy AS (
								SELECT * FROM employees
)

UPDATE employees_copy
SET salary = salary*1.3
WHERE salary BETWEEN 1000 AND 5000

UPDATE employees_copy
SET first_name = UPPER(first_name),
last_name = UPPER(last_name)

SELECT *
FROM employees_copy


-- her iscinin maasini onun departamentindeki maksimum maasinin yarisini qeder artirin

UPDATE employees_copy ec
SET salary = salary + (SELECT MAX(salary)
			 FROM employees_copy emp
			 WHERE emp.department_id = ec.department_id) / 2

						
-- 						Check Constraints
/*
A check constraint allows you to specify a condition on each row in a table.

A check constraint can NOT be defined on a SQL View.
The check constraint defined on a table must refer to only columns in that table. 
It can not refer to columns in other tables.
A check constraint can NOT include a SQL Subquery.
A check constraint can be defined in either a SQL CREATE TABLE statement or a SQL 
ALTER TABLE statement.

					CREATE TABLE table_name
						(
						  column1 datatype null/not null,
						  column2 datatype null/not null,

						  ...

					  CONSTRAINT constraint_name CHECK (column_name condition) [DISABLE]
				  );
  
					  CREATE TABLE Personaa (
						ID int NOT NULL,
						LastName varchar(255) NOT NULL,
						FirstName varchar(255),
						Age int CHECK (Age>=18)
						);
	
						CREATE TABLE suppliers
						(
						  supplier_id numeric(4),
						  supplier_name varchar2(50),
						  CONSTRAINT check_supplier_id
						  CHECK (supplier_id BETWEEN 100 and 9999)
						);
	
ALTER TABLE table_name
ADD CONSTRAINT constraint_name CHECK (column_name condition) [DISABLE];

ALTER TABLE suppliers
ADD CONSTRAINT check_supplier_name
CHECK (supplier_name IN ('IBM', 'Microsoft', 'NVIDIA'));
*/


SELECT * FROM employees_copy

ALTER TABLE employees_copy
ADD CONSTRAINT check_salary
CHECK  (salary > 100)
		
		
-- 							Primary
/*
In Oracle, a primary key is a single field or combination of fields that uniquely
defines a record. None of the fields that are part of the primary key can contain a 
null value. A table can have only one primary key.
NOTE:
In Oracle, a primary key can not contain more than 32 columns.
A primary key can be defined in either a CREATE TABLE statement or an ALTER TABLE 
statement.
CREATE TABLE table_name
	(
	  column1 datatype null/not null,
	  column2 datatype null/not null,
	  ...

	  CONSTRAINT constraint_name PRIMARY KEY (column1, column2, ... column_n)
	);

CREATE TABLE supplier
	(
	  supplier_id numeric(10) not null,
	  supplier_name varchar2(50) not null,
	  contact_name varchar2(50),
	  CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
	);

CREATE TABLE supplier
(
  supplier_id numeric(10) not null,
  supplier_name varchar2(50) not null,
  contact_name varchar2(50),
  CONSTRAINT supplier_pk PRIMARY KEY (supplier_id, supplier_name)
);

ALTER TABLE table_name
ADD CONSTRAINT constraint_name PRIMARY KEY (column1, column2, ... column_n);

ALTER TABLE supplier
ADD CONSTRAINT supplier_pk PRIMARY KEY (supplier_id);

*/

-- 									Foreign Keys
/*
A foreign key is a way to enforce referential integrity within your Oracle database. 
A foreign key means that values in one table must also appear in another table.

The referenced table is called the parent table while the table with the foreign 
key is called the child table. The foreign key in the child table will generally 
reference a primary key in the parent table.

A foreign key can be defined in either a CREATE TABLE statement or an ALTER TABLE
statement.


CREATE TABLE table_name
(
  column1 datatype null/not null,
  column2 datatype null/not null,
  ...

  CONSTRAINT fk_column
    FOREIGN KEY (column1, column2, ... column_n)
    REFERENCES parent_table (column1, column2, ... column_n)
);

CREATE TABLE supplier
( supplier_id numeric(10) not null,
  supplier_name varchar2(50) not null,
  contact_name varchar2(50),
  CONSTRAINT supplier_pk PRIMARY KEY (supplier_id)
);

CREATE TABLE products
( product_id numeric(10) not null,
  supplier_id numeric(10) not null,
  CONSTRAINT fk_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES supplier(supplier_id)
);

ALTER TABLE table_name
ADD CONSTRAINT constraint_name
   FOREIGN KEY (column1, column2, ... column_n)
   REFERENCES parent_table (column1, column2, ... column_n);

ALTER TABLE products
ADD CONSTRAINT fk_supplier
  FOREIGN KEY (supplier_id)
  REFERENCES supplier(supplier_id);

*/


CREATE TABLE locations_copy AS (
								SELECT * FROM locations)

ALTER TABLE employees_copy
ADD CONSTRAINT location_id FOREIGN KEY(location_id)
REFERENCES locations_copy(location_id)

SELECT * FROM employees_copy
SELECT * FROM locations_copy


-- 									RANK Function
/*
The Oracle/PLSQL RANK function returns the rank of a value in a group of values.
It is very similar to the DENSE_RANK function. However, the rank function can cause 
non-consecutive rankings if the tested values are the same. Whereas, the DENSE_RANK 
function will always result in consecutive rankings.

The RANK function can be used two ways - as an Aggregate function or as an Analytic
function.

RANK( expr1 [, expr2, ... expr_n ] ) WITHIN GROUP 
										( ORDER BY expr1 [, expr_2, ... expr_n ] )

*/

-- 						DENSE_RANK Function
/*
The Oracle/PLSQL DENSE_RANK function returns the rank of a row in a group of rows. 
It is very similar to the RANK function. However, the RANK function can cause 
non-consecutive rankings if the tested values are the same. Whereas, the DENSE_RANK 
function will always result in consecutive rankings.

The DENSE_RANK function can be used two ways - as an Aggregate function or as an
Analytic function.

DENSE_RANK( expression1, ... expression_n ) WITHIN GROUP 
											( ORDER BY expression1, ... expression_n )

*/

		RANK   DENSE_RANK
A		 1			1
A        1			1
B        3			2
B        3			2
C        5			3	
C		 5			3	
D        7			4


SELECT department_id, last_name, salary,
DENSE_RANK() OVER(ORDER BY salary)
FROM employees

SELECT department_id, last_name, salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary) D_RNK 
FROM employees
-- WHERE department_id = 60
-- ORDER BY DENSE_RANK, last_name;

SELECT department_id, last_name, salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary) D_RNK,
RANK() OVER (PARTITION BY department_id ORDER BY salary) RNK
FROM employees
-- WHERE department_id = 60
-- ORDER BY DENSE_RANK, last_name;

SELECT * FROM (SELECT department_id, last_name, salary,
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary) D_RNK,
RANK() OVER (PARTITION BY department_id ORDER BY salary) RNK
FROM employees) 
WHERE RNK=1

SELECT
DENSE_RANK (15500, 0.05)
WITHIN GROUP
(ORDER BY salary DESC, commission_pct) "Dense Rank"
FROM employees;


-- 								LAG Function
/*
The Oracle/PLSQL LAG function is an analytic function that lets you query more than 
one row in a table at a time without having to join the table to itself. It returns 
values from a previous row in the table. To return a value from the next row, try 
using the LEAD function.

					LAG ( expression [, offset [, default] ] )
						OVER ( [ query_partition_clause ] order_by_clause )
*/

SELECT last_name, hire_date, salary,
LAG(salary, 1, 0) OVER (ORDER BY hire_date)
FROM employees
WHERE job_id = 'PU_CLERK';

SELECT last_name, hire_date, salary,
LAG(salary, 2, 0) OVER (ORDER BY hire_date)
FROM hr.employees
WHERE job_id = 'PU_CLERK';

SELECT last_name, hire_date, salary,
LAG(salary, 2, 1) OVER (ORDER BY hire_date)
FROM hr.employees
WHERE job_id = 'PU_CLERK';

SELECT last_name, hire_date, salary,
LAG(salary, 1) OVER (ORDER BY hire_date)
FROM hr.employees
WHERE job_id = 'PU_CLERK';

SELECT last_name, hire_date, salary,
LAG(TO_CHAR(salary), 1, 'yoxdur') OVER (ORDER BY hire_date)
FROM hr.employees
WHERE job_id = 'PU_CLERK';


-- 								LEAD Function
/*
The Oracle/PLSQL LEAD function is an analytic function that lets you query more 
than one row in a table at a time without having to join the table to itself. 
It returns values from the next row in the table. To return a value from a previous 
row, try using the LAG function.

						LEAD ( expression [, offset [, default] ] )
							OVER ( [ query_partition_clause ] order_by_clause )
*/
								
SELECT hire_date, last_name,
LEAD(hire_date, 1) OVER (ORDER BY hire_date) AS "NextHired"
FROM employees
WHERE department_id = 30;

SELECT salary, last_name,
LEAD(salary, 1, 0) OVER (ORDER BY hire_date) AS "NextHired"
FROM employees
WHERE department_id = 30;	
						
SELECT salary, last_name,
LEAD(salary, 1) OVER (ORDER BY hire_date) AS "NextHired"
FROM employees
WHERE department_id = 30;	
												
								
-- 								LAST_VALUE Function
/*
The Oracle/PLSQL LAST_VALUE function returns the last value in an ordered set of
values from an analytic window. It is similar to the FIRST_VALUE and NTH_VALUE 
functions.

			LAST_VALUE (expression)
			 	 [RESPECT NULLS | IGNORE NULLS]
			 	 OVER ([query_partition_clause] [order_by_clause [windowing_clause]])
			 
			 LAST_VALUE (expression
				 [RESPECT NULLS | IGNORE NULLS])
				 OVER ([query_partition_clause] [order_by_clause [windowing_clause]])
*/

SELECT last_name, salary, hire_date,
LAST_VALUE(hire_date) OVER (ORDER BY salary)
FROM employees

						
-- 						FIRST_VALUE Function
/*
The Oracle/PLSQL FIRST_VALUE function returns the first value in an ordered set 
of values from an analytic window. It is similar to the LAST_VALUE and NTH_VALUE 
functions.

				IRST_VALUE (expression)
				 [RESPECT NULLS | IGNORE NULLS]
				 OVER ([query_partition_clause] [order_by_clause [windowing_clause]])

				FIRST_VALUE (expression
				 [RESPECT NULLS | IGNORE NULLS])
				 OVER ([query_partition_clause] [order_by_clause [windowing_clause]])
*/

SELECT last_name, hire_date, salary,
FIRST_VALUE (hire_date) OVER (ORDER BY salary) AS lowest_sal
FROM employees

SELECT last_name, salary, hire_date,
FIRST_VALUE (hire_date) OVER (ORDER BY salary)
FROM employees

