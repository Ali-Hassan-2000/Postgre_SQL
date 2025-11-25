-- enter sql (psql) and exit (\q)
---------------------------------------------------create database
CREATE DATABASE music;
---------------------------------------------------create tables
-- see all list (\l)
-- (\c DATABASE_name) connect to the database

CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  genre VARCHAR
);
---------------------------------------------------add data to table
-- Insert a single row
INSERT INTO bands (name, genre) 
VALUES 
('The Beatles', 'Rock');

-- Insert multiple rows
INSERT INTO bands (name, genre) 
VALUES 
('The Beatles', 'Rock'),
('The Rolling Stones', 'Rock'), 
('The Who', 'Rock');
---------------------------------------------------search querues
-- search in table
SELECT * FROM bands;

-- Count the number of bands
SELECT COUNT(*) FROM bands;

-- Query the first two bands
SELECT * FROM bands LIMIT 2;

-- Query bands where the genre is 'Rock'
SELECT * FROM bands WHERE genre = 'Rock';

-- Query bands where the genre is 'Rock'
SELECT name FROM bands WHERE genre = 'Rock';

-- Query bands sorted by name in ascending order
SELECT genre FROM bands ORDER BY name ASC;

---------------------------------------------------

CREATE TABLE musicians (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  name VARCHAR NOT NULL,
  age INTEGER NOT NULL,
  sings BOOLEAN,
  dances BOOLEAN
);

---------------------------------------------------

-- Insert musicians for The Beatles
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(1, 'John Lennon', 40, null, FALSE),
(1, 'Paul McCartney', 39, TRUE, FALSE),
(1, 'George Harrison', 38, TRUE, null),
(1, 'Ringo Starr', 41, FALSE, TRUE);

-- search to check
SELECT * FROM musicians WHERE band_id = 1;

-- Insert musicians for The Rolling Stones
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(2, 'Mick Jagger', 38, TRUE, null),
(2, 'Keith Richards', 39, TRUE, FALSE),
(2, 'Charlie Watts', 40, null, FALSE),
(2, 'Ronnie Wood', 41, TRUE, TRUE);

-- Insert musicians for The Who
INSERT INTO musicians (band_id, name, age, sings, dances) 
VALUES 
(3, 'Roger Daltrey', 38, TRUE, TRUE),
(3, 'Pete Townshend', 39, null, FALSE),
(3, 'John Entwistle', 40, TRUE, FALSE),
(3, 'Keith Moon', 41, null, TRUE);

---------------------------------------------------------------search q with  conditions

SELECT name FROM musicians WHERE sings = TRUE;

-- =: Equal to
-- <> or !=: Not equal to
-- >: Greater than
-- <: Less than
-- >=: Greater than or equal to
-- <=: Less than or equal to
-- BETWEEN: Between an inclusive range
-- LIKE: Search for a pattern
-- IN: Matches any of a list of values
-- IS NULL: Checks for NULL values
-- AND: Combines multiple conditions
-- OR: Returns rows that meet either condition
-- NOT: Negates a condition

-- Query musicians who are older than 40
SELECT name FROM musicians WHERE age > 40;

-- Query musicians that are younger than or equal to 40
SELECT name FROM musicians WHERE age <= 40;

-- Query musicians that are between the ages of 38 and 40
SELECT name FROM musicians WHERE age BETWEEN 38 AND 40;

-- Query musicians that have a name that starts with 'J'
SELECT name FROM musicians WHERE name LIKE 'J%';

-- Query musicians that are in The Beatles or The Rolling Stones
SELECT name FROM musicians WHERE band_id IN (1, 2);

-- Query musicians that do not sing
SELECT name FROM musicians WHERE sings = FALSE;

-- Query musicians whose singing ability is undefined
SELECT name FROM musicians WHERE sings IS NULL;

-- Query musicians who are older than 40 and do dance
SELECT name FROM musicians WHERE age > 40 AND dances = TRUE;

-- Query musicians that are younger than or equal to 40 or sing
SELECT name FROM musicians WHERE age <= 40 OR sings = TRUE;

-- Query musicians that are not older than 40
SELECT name FROM musicians WHERE NOT age > 40;

-------------------------------------------------------JOIN q

SELECT bands.name AS band, musicians.name AS musician
FROM bands
JOIN musicians ON bands.id = musicians.band_id;

-------------------------------------------------------UPDATE q

UPDATE bands SET genre = 'Rock and Roll' WHERE name = 'The Beatles';

-------------------------------------------------------DELETE q

DELETE FROM musicians WHERE name = 'Roger Daltrey';

-- Example
DELETE FROM musicians WHERE dances IS NULL;