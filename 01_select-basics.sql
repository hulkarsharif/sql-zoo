-- https://sqlzoo.net/wiki/SELECT_names
1.
-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".

-- The % is a wild-card it can match any characters
-- Find the country that start with Y

SELECT
    name 
 FROM 
    world
  WHERE
    name LIKE 'Y%'

--     2.
-- Find the countries that end with y

SELECT
 name 
 FROM 
 world
  WHERE 
  name LIKE '%y'

--   3.
-- Luxembourg has an x - so does one other country. List them both.

-- Find the countries that contain the letter x

SELECT
 name FROM world
  WHERE name LIKE '%x%'
