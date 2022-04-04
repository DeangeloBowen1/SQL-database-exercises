## Join syntax : 

SELECT columns
FROM table_a as A
JOIN table_b as B ON A.id = B.fk_id;

- Table_a is known as the left table
- table_b here will be the right table

# Full join example DB
- Let us assume that the following tables and associated data are put into a database named join_test_db.

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

# Joining the two tables above : 

- Here is an example of a BASIC join query on the above data set:

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

- Which will look like this: 
+-----------+-----------+
| user_name | role_name |
+-----------+-----------+
| bob       | admin     |
| joe       | author    |
| sally     | reviewer  |
| adam      | reviewer  |
+-----------+-----------+
4 rows in set (0.00 sec)

- as it only combines where both the left and right have values. 
- Since the role_name only has 4 values and user_name has 6, it will only max out at the lowest value. 

# Left Join: 

- A left join is used when you want to retrieve all the records from the left table, regardless of whether or not they have a corresponding record in the right table.

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

+-----------+-----------+
| user_name | role_name |
+-----------+-----------+
| bob       | admin     |
| joe       | author    |
| sally     | reviewer  |
| jane      | NULL      |
| mike      | NULL      |
| adam      | reviewer  |
+-----------+-----------+
6 rows in set (0.00 sec)

# Right Join

-  A right join is used when you want to retrieve all the records from the right table, regardless of whether or not they have a corresponding record in the left table. 

+-----------+-----------+
| user_name | role_name |
+-----------+-----------+
| bob       | admin     |
| joe       | author    |
| sally     | reviewer  |
| adam      | reviewer  |
| NULL      | commenter |
+-----------+-----------+
5 rows in set (0.00 sec)

- code

SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

## Associative Tables and Joins

-  In the employees database we have been using, multiple joins would be required to get an employee name along with the name of the department they work for.

- This type of relationships is referred to as a many-to-many association. 

- Contains from_date, to_date, employee_name, and department

- EX : find the full name and department for the employee with an employee id of 10001: 

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;
