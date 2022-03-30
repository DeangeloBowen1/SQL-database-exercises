# SQL Database Notes

## different types of characters
- Char(length) = character length of a character (used for abbreviations)
- varchar (length) for strings where length could var up to 
65,000 lines of text (used for more than 255 characters)
- TEXT = a large block of characters

## date types
- DATE = YYYY - MM - DD
- TIME = A time down to the seconds sql uses 24 hour times
- DATETIME= a combined date and tome value YYYY-MM-DD HH:MM:SS

## Null values 
- Null is the absense of a variable, not including 0 and 0 is still an amount of something. 

## Boolean 

- MySQL has no native support for boolean values. Instead, it uses a TINYINT data type that goes from -128 to 127 and treats 0 as false and 1 as true. Other database management systems will vary in how they handle boolean values.

## PRIMARY KEYS

- Each value must be unique.
- They cannot be NULL.
- There can only be one primary key in a table.

- naming conventions will be lower cased like "quote_id"

## Showing Tables in a Database

- use SHOW TABLES;
 and to describe the structure of that table is:
 - DESCRIBE quotes; (database;)
 - MySQL uses EXPLAIN and DESCRIBE interchangeably 

