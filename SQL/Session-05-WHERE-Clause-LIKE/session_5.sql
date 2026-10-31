-- Session 5: WHERE Clause + LIKE

-- Task 1: Create Restaurants table
CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1),
    city VARCHAR(50)
);

-- Insert five sample restaurants
INSERT INTO Restaurants (id, name, cuisine, rating, city)
VALUES
    (1, 'Swagat', 'South Indian', 4.5, 'Ahmedabad'),
    (2, 'Swadisht', 'Gujarati', 4.2, 'Surat'),
    (3, 'Dragon House', 'Chinese', 4.3, 'Ahmedabad'),
    (4, 'Pizza Corner', 'Italian', 3.8, 'Surat'),
    (5, 'Madras Cafe', 'South Indian', 4.6, 'Vadodara');

-- Task 2: Find restaurants rated above 4.0 in Ahmedabad or Surat
SELECT *
FROM Restaurants
WHERE rating > 4.0
  AND city IN ('Ahmedabad', 'Surat');

-- Task 3: Find restaurant names starting with 'Swa'
SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';

-- Task 4: Find restaurants rated between 3.5 and 4.5 inclusive
SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;

-- Task 5: Find restaurants serving specified cuisines
SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
