use employees;
show tables;
describe employees;
--  find employees with a specific name and count them

SELECT first_name, COUNT(*) AS total
	FROM employees
 WHERE (first_name) IN
 ('Irena' ,'Vidya', 'Maya') GROUP BY first_name;
 
 -- Total Vidya: 232, Irena: 241, Maya: 236
 
 -- find the employee's again but switch "IN" with "OR"

SELECT first_name, COUNT(*) AS total
	FROM employees
 WHERE (first_name) = "Irena" or 	
	(first_name) = "Vidya" or
	(first_name) = "Maya" 
 GROUP BY first_name;
 
 -- is the result the same? Yes the result is the same.
 
 -- Now the same thing with Or but is male
 
 SELECT first_name, COUNT(*) AS total
	FROM employees
 WHERE (first_name) = "Irena" AND gender='M' or 	
	(first_name) = "Vidya" AND gender='M' or
	(first_name) = "Maya"
    AND gender = 'M'
 GROUP BY first_name;
 
 -- males = irena = 144, vidya = 151, and maya = 146
 
 -- ***Question 5***
 -- select all employees whose name starts with "E"
 
select substr(last_name,1,1) as last_name, count(last_name)
FROM employees
WHERE  last_name LIKE "E%"
GROUP BY substr(last_name,1,1);


-- ** Question 6**
Select count(last_name) as Ends_with_E,

(
	select count(last_name)
	from employees where 
	last_name like "E%"
) as starts_with_e

from employees 
where last_name like "%E" and not last_name like "E%";

-- ****Question 7****

Select count(last_name) as start_and_end
from employees 
-- where last_name like "E%E" and last_name like "E%";
Where last_name Like "%E";

-- Find all current or previous employees employees whose last name starts and ends with 'E'.
-- Enter a comment with the number of employees whose last name starts and ends with E. 
	-- 899

-- How many employees' last names end with E, regardless of whether they start with E?
	-- 24,292
    
-- ***Question 8***

-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
	-- 135,214

SELECT count(birth_date)
FROM employees 
WHERE YEAR(hire_date) LIKE '199%';

-- *****Question 9*****
SELECT count(birth_date)
FROM employees
WHERE birth_date like '%-12-25';

-- ****** Question 10*****
SELECT * 
from employees
where hire_date between "1990-01-1" and "1999-12-31"
and birth_date LIKE '%-25-1994';
-- *****Question 11******
select *
from employees 
where last_name like '%q%';
-- *******Question 12*****
select *
from employees 
where last_name like '%q%'
and not last_name like '%qu%';








 
 