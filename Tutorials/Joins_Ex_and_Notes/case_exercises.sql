USE employees;

/*
Write a query that returns all employees, their department number, their start date,
their end date, and a new column 'is_current_employee' that is a 1 if the employee is
still with the company and 0 if not.
*/

SELECT
	DISTINCT(CONCAT(first_name, " ", last_name)) as Full_Name,
    dept_no,
    from_date,
    to_date,
    IF(to_date < NOW(), TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp USING(emp_no)
LIMIT 150;

/*
2. Write a query that returns all employee names (previous and current),
and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
*/

SELECT first_name, last_name,
	   CASE
	   WHEN last_name RLIKE '^[A-H]' THEN 'A-H'
       WHEN last_name RLIKE '^[I-Q]' THEN 'I-Q'
       WHEN last_name RLIKE '^[R-Z]' THEN 'R-Z'
       ELSE NULL
       END AS alpha_group
FROM employees
LIMIT 50;

-- SELECT birth_date
-- FROM employees
-- WHERE birth_date = '197%-01-01';
    
SELECT
	COUNT(CASE WHEN birth_date <= '1940-01-01'AND birth_date <='1950-01-01' THEN birth_date ELSE NULL END) AS '40''s',
    COUNT(CASE WHEN birth_date >= '1951-01-01' AND birth_date <='1960-01-01' THEN birth_date ELSE NULL END) AS '50''s',
    COUNT(CASE WHEN birth_date >= '1961-01-01' AND birth_date <='1970-01-01' THEN birth_date ELSE NULL END) AS '60''s',
    COUNT(CASE WHEN birth_date >= '1971-01-01' AND birth_date <='1980-01-01' THEN birth_date ELSE NULL END) AS '70''s',
    COUNT(CASE WHEN birth_date >= '1981-01-01' AND birth_date <='1990-01-01' THEN birth_date ELSE NULL END) AS '80''s',
    COUNT(CASE WHEN birth_date >= '1991-01-01' AND birth_date <='2000-01-01' THEN birth_date ELSE NULL END) AS '90''s',
    COUNT(CASE WHEN birth_date >= '2001-01-01' AND birth_date <='2010-01-01' THEN birth_date ELSE NULL END) AS '00''s'
FROM employees;

SELECT *
FROM departments;

SELECT
    ROUND(AVG(CASE WHEN dept_name IN ('research', 'development') THEN salaries.salary ELSE NULL END)) AS 'R&D',
	ROUND(AVG(CASE WHEN dept_name IN ('sales', 'marketing') THEN salaries.salary ELSE NULL END)) AS 'Sales & Marketing',
    ROUND(AVG(CASE WHEN dept_name IN ('Production', 'Quality Management') THEN salaries.salary ELSE NULL END)) AS 'PROD & QM',
    ROUND(AVG(CASE WHEN dept_name IN ('Finance', 'Human Resources') THEN salaries.salary ELSE NULL END)) AS 'Finance & HR',
    ROUND(AVG(CASE WHEN dept_name IN ('Customer Service') THEN salaries.salary ELSE NULL END)) AS 'CS'
FROM employees
JOIN salaries USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no);

SELECT 
	dept_name,
	avg(salary)
FROM employees
JOIN salaries USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
GROUP BY dept_name;

    