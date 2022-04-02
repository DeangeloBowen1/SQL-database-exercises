use employees;
show tables;
describe titles;
/*Question 2: 
In your script, use DISTINCT to find the unique titles in the titles table.
 How many unique titles have there ever been? Answer that in a comment in your SQL file.
 
 ans: 7
*/

SELECT DISTINCT title
	FROM titles;
    
/*Question 3:
Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
*/

SELECT last_name
	FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

/*Question 4:
Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
*/

SELECT first_name, last_name
	FROM employees
WHERE last_name LIKE 'E%E';

/*Question 5:
Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code.

ans Cleq, Lindqvist, Qiwen

**Add count and group by last name**
*/

SELECT DISTINCT count(last_name), last_name
	FROM employees
WHERE last_name LIKE '%q%' AND (
	NOT last_name LIKE '%qu%'
) Group by last_name;

/* Question 7:
Find all all employees with first names 'Irena', 'Vidya', or 'Maya'.
 Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
*/

SELECT gender, COUNT(gender) as amount
	FROM employees
WHERE last_name IN ('Irena','Vidya','Maya')
GROUP BY Gender;

/*Question 8:
Using your query that generates a username for all of the employees, generate a count employees for each unique username.
 Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
*/
 SELECT 
	LOWER(
		CONCAT(
        SUBSTR(first_name,1,1),
        SUBSTR(last_name,1,4),
        '_', 
        SUBSTR(birth_date,6,2), 
        SUBSTR(birth_date,3,2))
        ) 
        AS username, 
    COUNT(*) AS n_username
FROM 
	employees
GROUP BY 
	username
HAVING
	n_username > 1
ORDER BY
	n_username DESC;