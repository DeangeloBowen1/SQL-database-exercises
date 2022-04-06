USE sakila;
/*
Sakila database access
*/


/*Selecting all from the actor table*/

SELECT *
FROM actor
LIMIT 10;

/*Selecting the last_name column from actor table*/

SELECT last_name
FROM actor
Limit 10;

/*Select only the film_id, title, and release_year columns from the film table.*/

SELECT
	film_id,
	title,
    release_year
FROM film
LIMIT 10;

/*Select all distinct (different) last names from the actor table.*/

SELECT 
	DISTINCT(last_name)
FROM actor
LIMIT 10;

/*Select all distinct (different) postal codes from the address table.*/

SELECT
	DISTINCT(postal_code)
FROM adress
LIMIT 10;

/*Select all distinct (different) ratings from the film table.*/

SELECT 
	DISTINCT(rating)
FROM film
LIMIT 10;


