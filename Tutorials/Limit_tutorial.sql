use employees;
select databse();
show tables;

describe titles;

select *
from titles
limit 10;

-- list the first 10 unique names
select distinct last_name
from employees
order by last_names desc
limit 10;

select first_name,
	last_name
	hire_date
from employees where hire_date like '199%'
and birth_date like '%-12-25'
order by hire_date asc
limit 5;

/*
page 1 -> limi = 5, offset 0, records 1-5
page 2 -> limi = 5, offset 5, records 6-10
page 3 -> limi = 5, offset 1, records 11-15
...
equation : page 
Page 9 * 5 = 45 so page 10 is offset 45 or 9 pages with limits of 5 each
*/

select *
from employees
where hire_date like '199%'
and birth_date like '%-12-25'
order by hire_date
limit 5 offset 45;