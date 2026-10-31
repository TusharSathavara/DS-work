-- Session 6: ORDER BY + Sorting

-- Task 1: Display all products sorted by price, lowest to highest
SELECT *
FROM products
ORDER BY price ASC;

-- Task 2: Display the five most expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- Task 3: Sort movies by latest release year first,
-- then by highest rating
SELECT *
FROM movies
ORDER BY release_year DESC, rating DESC;

-- Task 4: Display the first ten restaurants alphabetically
SELECT *
FROM restaurants
ORDER BY name ASC
LIMIT 10;

-- Task 5: Display the top three trending songs.
-- If play_count is tied, show the recently added song first.
SELECT *
FROM songs
ORDER BY play_count DESC, added_at DESC
LIMIT 3;
