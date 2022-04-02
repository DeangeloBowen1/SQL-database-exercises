-- Concat function
	-- SELECT CONCAT('Hello', 'CodeUp','!');

-- Using SUBSTR
	-- SUBSTR(string, start_index, length)

	-- SELECT SUBSTR('abcdefg', 2,4)
-- Other fucntions that are similar to what you m ay see in python are :
	-- Sel. UPPER, LOWER
    -- Replace (subject, search, replacement) -> (abcdefg, abc, 123) = 123defg
    
    -- DateTime functions such as :
		-- SELECT NOW(); (current time) = YYYY-MM-DD
        -- SELECT CURDATE(); (current date)
        -- SELECT CURTIME(); (current time) = HH:MM:SS
        -- UNIX_TIMESTAMP() &(DATE) TO USE TIME AS AN INTEGER FOR TIME IN SECONDS
	-- NUMERICAL FUNCTIONS
		-- AVG : THE MEAN
        -- MIN 
        -- MAX
        
-- *************FUNCTIONS EXERCISES**************
-- ************QUESTION 1*****************
USE employees;
/* 1.) Write a query to to find all employees whose last name starts and ends with 'E'.
 Use concat() to combine their first and last name together as a single column named full_name.
*/

SELECT first_name, last_name, 
(SELECT CONCAT(first_name,last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY full_name;

-- **************Question 2*************
/*Convert the names produced in your last query to all uppercase.*/

SELECT first_name, last_name, 
(SELECT UPPER(CONCAT(first_name,last_name))) AS full_name
	FROM employees
	WHERE last_name LIKE 'E%E'
ORDER BY full_name;

-- *************Question 3*************
/*Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working at the company
 (Hint: You will also need to use NOW() or CURDATE())*/
 
 SELECT *, DATEDIFF(CURDATE(),hire_date) as Days_Working
	from employees
	where hire_date like '199%'
    AND (
    birth_date LIKE '%-12-25'
    ) ORDER BY hire_date;
    
-- ***************Question 4************
/*Find the smallest and largest current salary from the salaries table.*/

SELECT MAX(salary), MIN(salary) 
	FROM salaries
WHERE to_date > CURDATE();
    
-- ****************Question 5**********
/*Use your knowledge of built in SQL functions to generate a username for all of the employees.
 A username should be all lowercase, and consist of the first character of the employees first name,
 the first 4 characters of the employees last name, an underscore, the month the employeewas born,
 and the last two digits of the year that they were born.*/
 
 SELECT first_name, last_name, birth_date,
	LOWER(CONCAT(SUBSTR(first_name,1,1),
    SUBSTR(last_name,1,4), '_',
    SUBSTR(birth_date,6,2),
    SUBSTR(birth_date,3,2))) as username
FROM employees
limit 10;


