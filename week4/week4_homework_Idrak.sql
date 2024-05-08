-- 1. According to the given diagram create STUDENTS , ACTIVITIES and SCHEDULE tables. 
-- (PK – PRIMARY KEY,FK – FOREIGN KEY, * - NOT NULL )

CREATE TABLE students(
	s_id number PRIMARY KEY NOT NULL,
	first_name varchar2(100),
	last_name varchar2(100),
	phone_number varchar2(100),
	emial varchar2(100)
)

CREATE TABLE activities(
	a_id number PRIMARY KEY NOT NULL,
	a_name varchar2(100) NOT NULL,
	cost number NOT NULL
)

CREATE TABLE schedule(
	s_date date,
    s_id number,
    a_id number,
	CONSTRAINT s_id FOREIGN KEY (s_id) REFERENCES students(s_id),
	CONSTRAINT a_id FOREIGN KEY (a_id) REFERENCES activities(a_id)
)


-- 2. Insert data into students table from employees table.

SELECT * FROM students
SELECT * FROM schedule
SELECT * FROM activities

INSERT INTO students (select employee_id, first_name, last_name, phone_number,
					 email FROM employees)


-- 3. Change phone number to ‘***’ for students with s_id > 200.

UPDATE students
SET phone_number = '***'
WHERE s_id > 200


-- 4. Update first name and last names of students in Upper cases.

UPDATE students
SET first_name = UPPER(first_name), LAST_name = UPPER(last_name)


-- 5. Based on the students table populated with the following data, update the email to 
-- 'DSA' for all records whose s_id is greater than 150.

UPDATE students
SET email = 'DSA'
WHERE s_id > 150


-- 6. Create PROGRAMMERS table using records from EMPLOYEES where job_id contains ‘PROG’ 
-- substring.

CREATE TABLE programmers AS (
							 SELECT *
							 FROM employees
							 WHERE job_id LIKE '%PROG%'
)


-- 7. Delete records from students table where s_id is between 150 and 160.

DELETE FROM students
WHERE s_id BETWEEN 150 AND 160


-- 8. a) Insert some date into SCHEDULE, then truncate and see results.
-- b) Drop schedule table

INSERT INTO activities(a_id, a_name, cost)
VALUES(1, 'Idrak', 12345)

INSERT INTO schedule(s_date, s_id, a_id)
VALUES ('12-JUN-2024', 100, 1)
INSERT INTO schedule(s_date, s_id, a_id)
VALUES ('01-JUN-2024', 100, 1)


SELECT * FROM schedule

TRUNCATE TABLE schedule

DROP TABLE schedule


-- 9. For any date given, write a script to find:
-- a) The first and the last days of the next year;
SELECT
    round(add_months(sysdate, 12), 'year')  AS nextyearfirstday,
    trunc(add_months(sysdate, 24), 'year') - 1  AS nextyearlastday
FROM
    dual;

-- b) The first and the last days of the next month;
SELECT
    round(add_months(sysdate, 1), 'month') AS nextmontsfisrtday,
    round(add_months(sysdate, 2), 'month') - 1 AS nextmontslastday
FROM
    dual;
	
-- c) The first and the last days of the previous month.
SELECT
    round(add_months(sysdate, - 1), 'month') AS previeosmontslastday,
    round(sysdate, 'month') -1  AS prepieosmontsfirstday
FROM
    dual;


-- 10. Create a table named “Participants” which consists of first_name, last_name and 
-- salary (have to more than 10000).

CREATE TABLE participants(
	first_name varchar2(100),
	last_name varchar2(100),
	salary int CHECK(salary> 10000)
)


	
	
