-- how to use tables

-- ****ALWAYS REMEBER TO RUN WITH COMMAND + ENTER

-- use employees;
-- show tables; -- show tables command
-- use superstore_db;
-- show tables;
-- select * from customers limit 10; -- select from a table the first 10 or given number

-- use command forward slash / to comment something out

-- CREATING TABLES

-- How to create simple table:
-- CREATE TABLE table_name (
--     column1_name data_type,
--     column2_name data_type,
--     ...
-- );

-- How to create a table **specific**
-- CREATE TABLE quotes (
--     author_first_name VARCHAR(50),
--     author_last_name  VARCHAR(100) NOT NULL,
--     content TEXT NOT NULL
-- );

-- PRIMARY KEYS ON TABLES (CANNOT EQUAL "NULL")

-- CREATE TABLE quotes (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     author_first_name VARCHAR(50),
--     author_last_name  VARCHAR(100) NOT NULL,
--     content TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );

-- HOW TO GRAB INFORMATION FROM A TABLE

-- use employees; -- run this command + enter
-- -- tell me about this table with:
-- describe employees;
-- null yes/no tells you if it allows nulls


-- use quotes;
-- SHOW CREATE TABLE quotes;
-- which will show:
-- *************************** 1. row ***************************
--         Table: quotes
-- Create Table: CREATE TABLE `quotes` (
--     'id' int(10) unsigned NOT NULL AUTO_INCREMENT,
--     'author_first_name' varchar(50) DEFAULT NULL,
--     'author_last_name' varchar(100) NOT NULL,
--     'content' text NOT NULL,
--     PRIMARY KEY ('id')
-- )
-- 1 row in set (0.00 sec)


