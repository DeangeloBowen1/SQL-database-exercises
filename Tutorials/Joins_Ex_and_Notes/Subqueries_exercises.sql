USE employees;

/* 1.) Find all the current employees with the same hire date
 as employee 101010 using a sub-query.
*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = (
	SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );
  
  
/*2. Find all the titles ever held by all current employees with the first name Aamod.*/
SELECT DISTINCT 
	first_name, 
	t.title
FROM employees as e
JOIN titles as t ON t.emp_no = e.emp_no
WHERE first_name = 'Aamod';

/*3. How many people in the employees table are no 
longer working for the company? Give the answer in a comment in your code

ANS: 91479
*/
SELECT
	COUNT(first_name) as past_emp
FROM(
	SELECT *
    FROM dept_emp
    ) as g
JOIN employees as e ON g.emp_no = e.emp_no
WHERE g.to_date < CURDATE();

/*Find all the current department managers that are female.
 List their names in a comment in your code.*/
 
 SELECT 
	last_name, 
    first_name,
    e.gender
 FROM(
	SELECT * 
    FROM dept_manager
    ) as dm
JOIN employees as e ON dm.emp_no = e.emp_no
WHERE e.gender = 'F';


/* 5. Find all the employees who currently have a higher 
salary than the companies overall, historical average salary
*/
SELECT  
    e.first_name, 
    e.last_name,
	s.salary, 
(SELECT 
	AVG(salary)
FROM salaries) as av_sal
FROM salaries as s
JOIN employees as e ON e.emp_no = s.emp_no
    WHERE s.to_date > CURDATE();
    
/*	first_name,
    last_name,
    salary
FROM employees as e
JOIN salaries as s ON s.emp_no = e.emp_no
WHERE salary > (
		SELECT AVG(salary) 
        FROM salaries
        WHERE to_date > CURDATE()
        ) AND s.to_date > CURDATE()*/
        


        


