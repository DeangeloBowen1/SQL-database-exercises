USE employees;
SET SQL_SAFE_UPDATES = 0;

/*
Using the example from the lesson, create a temporary table called employees_with_departments that contains:
 first_name, last_name, and dept_name for employees currently with that department.
 Be absolutely sure to create this table on your own database.
 If you see "Access denied for user ...", it means that the query was attempting to write a new table 
 to a database that you can only read.
*/

CREATE TEMPORARY TABLE jemison_1760.tables_exercise AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
JOIN salaries USING(emp_no)
LIMIT 100;

SELECT *
FROM jemison_1760.tables_exercise;

/* 1.a 1. Add a column named full_name to this table.
*/

ALTER TABLE jemison_1760.tables_exercise ADD full_name VARCHAR(100);

/*1.b UPDATE the table so that the full name contain the correct data*/
UPDATE jemison_1760.tables_exercise
SET full_name = CONCAT(first_name, " ", last_name);

SELECT *
FROM jemison_1760.tables_exercise;

/*1.C Remove the first_name and last_name columns from the table.*/

ALTER TABLE jemison_1760.tables_exercise DROP COLUMN first_name;
ALTER TABLE jemison_1760.tables_exercise DROP COLUMN last_name;

SELECT *
FROM jemison_1760.tables_exercise;

/*1.D What is another way you could have ended up with this same table? */

/*Create a temporary table based on the payment table from the sakila database.
Write the SQL necessary to transform the amount column such that it is stored as an integer 
representing the number of cents of the payment. For example, 1.99 should become 199.*/

/* #3 Find out how the current average pay in each department compares to the overall
,historical average pay. */
CREATE TEMPORARY TABLE jemison_1760.join_ex
SELECT d.dept_name, AVG(s.salary) as HIST
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
JOIN salaries AS s USING (emp_no)
JOIN departments AS d USING (dept_no)
WHERE s.to_date < CURDATE()
GROUP BY d.dept_name;

SELECT * 
FROM jemison_1760.join_ex;



CREATE TEMPORARY TABLE jemison_1760.DeptSal
SELECT d.dept_name, AVG(s.salary) as CurAvgSal
FROM employees as e
JOIN dept_emp AS de USING(emp_no)
JOIN salaries AS s USING (emp_no)
JOIN departments AS d USING (dept_no)
WHERE s.to_date > CURDATE()
GROUP BY d.dept_name;

USE jemison_1760;
SELECT * FROM DeptSal;

SELECT 	(SELECT AVG(salary) FROM employees.salaries WHERE salaries.to_date < NOW()) as historic_data,
		(CurAvgSal - (SELECT AVG(salary) FROM employees.salaries))
		/
        (SELECT stddev(salary) FROM employees.salaries) AS zscore,
        CurAvgSal,
        DeptSal.dept_name
FROM DeptSal
GROUP BY CurAvgSal, DeptSal.dept_name
ORDER BY zscore DESC;

CREATE TEMPORARY TABLE jemison_1760.united AS
SELECT HIST, CurAvgSal, dept_name
FROM jemison_1760.DeptSal as jd
JOIN jemison_1760.join_ex AS je USING(dept_name);

SELECT *
FROM jemison_1760.united;




-- SELECT AVG(salary)
-- FROM dept_emp as de
-- JOIN salaries as s ON de.emp_no = s.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no
-- GROUP BY dept_name;

-- ALTER TABLE jemison_1760.cur_avg_sal ADD historic_data INT(15);

-- UPDATE jemison_1760.cur_avg_sal
-- SET historic_data = 
-- (SELECT AVG(salary)
-- 	FROM dept_emp as de
-- JOIN salaries as s ON de.emp_no = s.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no);

-- SELECT *
-- FROM jemison_1760.cur_avg_sal;







/*
In order to make the comparison easier,
you should use the Z-score for salaries. In terms of salary, w
hat is the best department right now to work for? The worst?*/









USE sakila;

CREATE TEMPORARY TABLE jemison_1760.sakila_amount AS
SELECT payment_id, customer_id, staff_id, amount, payment_date
FROM sakila.payment
limit 50;

SELECT *
FROM jemison_1760.sakila_amount;

ALTER TABLE jemison_1760.sakila_amount 
ADD updated_payment INT(4);

-- Updating amount to itself *100
UPDATE jemison_1760.sakila_amount
SET updated_payment = amount*100;

ALTER TABLE jemison_1760.sakila_amount DROP COLUMN amount;
 
SELECT *
FROM jemison_1760.sakila_amount;



