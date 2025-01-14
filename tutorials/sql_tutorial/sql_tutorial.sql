# Show all databases
SHOW Databases;

# Create new database
CREATE DATABASE test_database;
SHOW databases;

# Removing database
DROP DATABASE test_database;
SHOW databases;

# Create database
CREATE DATABASE test;

# Select Database (on the lft panel you can see it is now bolded on refresh)
USE test;

# Creating tables within the selected database
CREATE TABLE test_table(
test_column INT
);

# Altering table
ALTER TABLE test_table
ADD another_column VARCHAR(25);

# Deleting table
DROP TABLE test_table;

# Creating dummy tables
CREATE TABLE kh_games(
id INT NOT NULL AUTO_INCREMENT,
game_name VARCHAR(255) NOT NULL, 
PRIMARY KEY (id)
);

ALTER TABLE kh_games
ADD release_year INT;

CREATE TABLE kh_Characters(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
game_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (game_id) REFERENCES kh_games(id) 
);

# Adding data
INSERT INTO kh_games (game_name)
VALUES ('Kingdom Hearts 1');
SELECT * FROM kh_games;

INSERT INTO kh_games (game_name, release_year)
VALUES ('Kingdom Hearts 2', 2005),
('Kingdom Hearts - 358/2', 2009),
('Kingdom Hearts 3', 2019),
('Kingdom Hearts 4', 0000),
('Kingdom Hearts - Chain of Memories', 2004),
('Kingdom Hearts - Birth By Sleep', 2010),
('Kingdom Hearts - Coded',2008),
('Kingdom Hearts - Dream Drop Distance', 2012),
('Kingdom Hearts - Melody of Memory', 2020),
('Kingdom Hearts - Union x Dark Road', 2020),
('Kingdom Hearts - Missing Link', 0000),
('Kingdom Hearts - Union x Unchained', 2015),
('Kingdom Hearts - 2.8 Final Chapter', 2017);

# Query data with a limit of two (top 2)
SELECT * FROM kh_games
LIMIT 2;

# Query for one column
SELECT game_name FROM kh_games;

# Query with column names
SELECT id AS 'Game Id', game_name AS 'Title' FROM kh_games;

# Ordering output
SELECT * FROM kh_games ORDER BY game_name;

#... Or DESC instead of default ASC
SELECT * FROM kh_games ORDER BY game_name DESC;

# Add Characters
SELECT * FROM kh_games;
INSERT INTO kh_characters (name, game_id)
VALUES ('Sora' , 1), 
('Sora' , 2),
('Kairi', 1),
('Riku', 1),
('Roxas', 2),
('Namine', 2),
('Xehanort', 7),
('Ansem', 1),
('Xemnas', 2),
('Terra', 7),
('Aqua', 7),
('Ventus', 7),
('test character', 1);
  
# Return unique values
SELECT DISTINCT * FROM kh_characters;

# Update values
SELECT * FROM kh_games;
UPDATE kh_games
SET release_year = 2025
WHERE id = 5;
SELECT * FROM kh_games;

UPDATE kh_games
SET release_year = 2002
WHERE id = 1;
SELECT * FROM kh_games;

# Find games prior to 2018
SELECT game_name as "Title" FROM kh_games
WHERE release_year <2018;


# Find games from 2018 or after
SELECT game_name as "Title" FROM kh_games
WHERE release_year >= 2018;

# Filter on string with wildcards
SELECT * FROM kh_games
WHERE game_name LIKE '%3%';

# Filter with OR
SELECT * FROM kh_games
WHERE game_name LIKE '%3%' OR id = 1;

# Filter with AND
SELECT * FROM kh_games
WHERE game_name LIKE '%3%' AND id = 3;

# Filter between values
SELECT * FROM kh_games
WHERE release_year BETWEEN 2010 AND 2020;

# Filter for Null
SELECT * FROM kh_characters
WHERE game_id IS NULL;

# Remove row
Select * From kh_characters WHERE id = 12; 
DELETE FROM kh_characters WHERE id = 12;
Select * From kh_characters WHERE id = 12; 

# Join Tables (inner)
SELECT * FROM kh_games
JOIN kh_characters ON kh_games.id = kh_characters.game_id;

# Join Tables Left append values from right
SELECT * FROM kh_games
LEFT JOIN kh_characters ON kh_games.id = kh_characters.game_id;

# Join Tables Right append values from left
SELECT * FROM kh_games
RIGHT JOIN kh_characters ON kh_games.id = kh_characters.game_id;

# Aggregation
SELECT AVG(release_year) FROM kh_games;
SELECT SUM(release_year) FROM kh_games;
SELECT COUNT(release_year) FROM kh_games;

# Group by
SELECT game_id, COUNT(game_id) FROM kh_characters
GROUP BY game_id;

# More meaningful group by output using aliases
SELECT b.game_name AS title, COUNT(c.game_id) as characters_from_table FROM kh_games AS b
LEFT JOIN kh_characters as c ON b.id = c.game_id
GROUP BY b.id;

# Fitering by aggregated data using having (is the same as where but happens after)
SELECT b.game_name AS title, COUNT(c.game_id) as characters_from_table FROM kh_games AS b
LEFT JOIN kh_characters as c ON b.id = c.game_id
GROUP BY b.id
HAVING id =1;

# WHERE before, HAVING after
SELECT b.game_name AS title, COUNT(c.game_id) as characters_from_table FROM kh_games AS b
LEFT JOIN kh_characters as c ON b.id = c.game_id
WHERE b.id = 1
GROUP BY b.id;