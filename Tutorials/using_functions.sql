-- How to use functions in SQL

-- Select:

-- use fruits_db;
-- SELECT * FROM fruits;
-- SELECT name, quantity FROM fruits;
-- Select Distinct * (dropping duplicates)

use albums_db;
show tables;
describe albums;
-- how many rows are in albums
-- ans: 6

select * from albums;
select distinct artist from albums;
-- how many unique artist names are in albums?
-- ans 23

-- what is the primary key for the albums table?
-- ans id

-- What is the oldest release date for any album in the albums table? 
--  ans 1967

-- What is the most recent release date?
-- ans 2011	

-- all the albums of pink floyd:
-- ans dark side of the moon and the wall

-- sgt. peppers lonely hearts club band release date:
-- ans 1967

-- genre for album nevermind
-- ans grunge, alternative rock

-- albums released in the 1990s

select name, release_date between 1990 and 1999 from albums;

-- ans:  the bodyguard, jagged little pill, come on over, falling into you, lets talk about love
-- dangerous, the immaculate collection, titanic, metallica, nevermind, supernatural

-- albums with less than 20m in sales

select name, sales < 20.0 from albums;

-- ans: grease, bad, sgt peppers, dirty dancing, lets talk about love, dangerous, immaculate collection
-- ...abby road, born in the usa, brothers in arms, titanic, nevermind, the wall

-- All the albums with a genre of "Rock". 
-- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

select name, genre = "Rock", genre, release_date, artist from albums;

-- ans: perhaps because the beatles, santana and bruce springsteen didnt make hard rock.
