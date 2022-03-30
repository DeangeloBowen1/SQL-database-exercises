use employees;
show tables;

-- describe departments;
-- describe employees;
-- describe dept_manager;
-- describe dept_emp;
-- describe salaries;
-- describe titles;


-- To select all for quick view : 
-- SELECT * FROM information_schema.columns WHERE table_schema = 'employees';

-- Which table(s) do you think contain a numeric type column?
-- ans: salaries, dept_manager, dept_emp, employees, title

-- Which table(s) do you think contain a date type column? 
-- ans: all except departments

-- What is the relationship between the employees and the departments tables?
-- (Write this question and your answer in a comment):
-- ans: they dont allow nulls

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
-- ans: Show create table dept_manager;
