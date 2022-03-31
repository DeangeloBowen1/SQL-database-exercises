-- SELECT first_name, last_name
-- FROM employees
-- ORDER BY last_name DESC;

-- SELECT first_name, last_name
-- FROM employees
-- ORDER BY last_name ASC;


-- **************Question 2***********
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name.
-- In your comments, answer:
-- What was the first and last name in the first row of the results?
	-- Acton
-- What was the first and last name of the last person in the table?
	-- Zyda
use employees;
show tables;
describe employees;

Select first_name, last_name
from employees
where first_name="Irena"
OR first_name= "Vidya"
OR first_name= "Maya"
ORDER BY first_name ASC;

-- ***********Question 3************

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer:
-- What was the first and last name in the first row of the results?
	-- acton
-- What was the first and last name of the last person in the table?
	-- Zweizig

Select first_name, last_name
from employees
where first_name="Irena"
OR first_name= "Vidya"
OR first_name= "Maya"
ORDER BY first_name, last_name ASC;

-- ********Question 4*********

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.
--  In your comments, answer: 
-- What was the first and last name in the first row of the results?

--  What was the first and last name of the last person in the table?

Select last_name, first_name
from employees
where first_name="Irena"
OR first_name= "Vidya"
OR first_name= "Maya"
ORDER BY last_name, first_name ASC;

Select * #count(emp_no)	
from employees
where last_name like "E%E"
ORDER BY emp_no DESC;

-- Last names start with E%E -- 899

-- Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first.
-- Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

-- 899 employees returned Oldest: Sergi, Erde. Newest: Teiji Eldridge

Select *#count(emp_no)	
from employees
where last_name like "E%E"
ORDER BY hire_date DESC;

-- 	Find all employees hired in the 90s and born on Christmas.
--  Sort the results so that the oldest employee who was hired last is the first result.
--  Enter a comment with the number of employees returned
--  the name of the oldest employee who was hired last
	-- 
--  and the name of the youngest employee who was hired first.

SELECT * 
from employees
where hire_date LIKE "199%"
and (
birth_date LIKE '%-12-25'
)
ORDER BY birth_date, hire_date;



