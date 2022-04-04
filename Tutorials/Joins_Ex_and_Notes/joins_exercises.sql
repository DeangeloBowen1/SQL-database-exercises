/*use join_example_db;
SHOW TABLES;

RIGHT JOIN


SELECT users.*, roles.*
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

LEFT JOIN


SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;*/

/*2. Using the example in the Associative Table Joins section as a guide, write a query that shows 
each department along with the name of the current manager for that department.*/

use employees;
SHOW TABLES;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
ORDER BY last_name DESC;

/*3. Find the name of all departments currently managed by women. */

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND gender = "F"
ORDER BY last_name DESC;

/*4. Find the current titles of employees currently working in the Customer Service department.*/

SELECT COUNT(*), title
FROM titles AS t
JOIN dept_emp AS de
	ON de.emp_no = t.emp_no
JOIN departments AS d
	ON d.dept_no = de.dept_no
WHERE dept_name = "Customer Service" 
	AND de.to_date = '9999-01-01'
GROUP BY title;

/*5. Find the current salary of all current managers.
*/

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name, salary
FROM employees AS e
JOIN salaries as s 
	ON s.emp_no = e.emp_no
    AND s.to_date > NOW()
JOIN dept_manager AS de
  ON de.emp_no = s.emp_no AND
  de.to_date > CURDATE() 
JOIN departments AS d
  ON d.dept_no = de.dept_no
ORDER BY last_name DESC;

/*6. Find the number of current employees in each department.
*/

SELECT
	de.dept_no,
	d.dept_name,
	COUNT(*) as num_employees
FROM employees as e
JOIN dept_emp as de
	ON de.emp_no = e.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY dept_no, dept_name;

/*7. Which department has the highest average salary? Hint: Use current not historic information.*/

SELECT 
	d.dept_name,
	ROUND(AVG(salary)) as average_salary
FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no
    AND s.to_date > CURDATE()
    AND de.to_date > CURDATE()
JOIN dept_emp AS de
	ON de.emp_no = s.emp_no
JOIN departments as d ON d.dept_no = de.dept_no
GROUP BY dept_name
ORDER BY average_salary DESC
limit 1;

/*8. Who is the highest paid employee in marketing?*/

SELECT employees.first_name, employees.last_name
FROM employees
JOIN salaries
  ON employees.emp_no = salaries.emp_no
JOIN dept_emp
  ON employees.emp_no = dept_emp.emp_no
JOIN departments
  ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Marketing'
  AND dept_emp.to_date > NOW()
ORDER BY salaries.salary DESC
LIMIT 1;

/*9. Which current department manager has the highest salary?
*/

SELECT 
	first_name,
	last_name,
	salary,
	dept_name
FROM employees as e
JOIN salaries as s
	ON e.emp_no = s.emp_no
JOIN dept_manager as dm
	ON dm.emp_no = e.emp_no
JOIN departments as d
	ON d.dept_no = dm.dept_no
WHERE dm.to_date > NOW()
ORDER BY s.salary 
DESC limit 1;



/*10. Determine the average salary for each department.
 Use all salary information and round your results.*/
 
SELECT d.dept_name, ROUND(AVG(salary))
FROM employees AS e
JOIN salaries AS s ON s.emp_no = e.emp_no
JOIN dept_emp AS de ON de.emp_no = s.emp_no
JOIN departments as d ON d.dept_no = de.dept_no
GROUP BY dept_name;

/*Bonus 11*/

SELECT
	dm.dept_no,
	CONCAT(e.first_name, ' ', e.last_name) AS Managers
FROM employees AS e
JOIN dept_manager AS dm ON e/emp_no = dm.emp_no
	AND to_date > CURDATE();
    
    SELECT 
		CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
        d.dept_name AS 'DEPT NAME',
        m.managers AS 'manager name'
	FROM employees AS e
	JOIN dept_emp AS de ON d.emp_no = e.emp_no
		AND de.to_date > curdate()
	JOIN departments AS d ON de.dept_no = d.dept_no
	JOIN (SELECT
			dm.dept_no,
			CONCAT(e.first_name, ' ', e.last_name) AS Managers
		FROM employees AS e
		JOIN dept_manager AS dm ON e/emp_no = dm.emp_no
			AND to_date > CURDATE()) AS M ON m.dept_no = d.dept_no
	ORDER BY d.dept_name;
        



