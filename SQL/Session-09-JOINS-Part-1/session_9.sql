-- Session 9: JOINS - Part 1

-- Task 1: Create restaurants table
CREATE TABLE restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

-- Create dishes table
-- restaurant_id intentionally has no foreign key constraint
-- so Task 4 can demonstrate an unmatched restaurant_id.
CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Insert three restaurants
INSERT INTO restaurants (id, name, city)
VALUES
    (1, 'Pizza Palace', 'Ahmedabad'),
    (2, 'Spice Garden', 'Surat'),
    (3, 'Green Bowl', 'Vadodara');

-- Insert dishes for the restaurants
INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
    (1, 1, 'Margherita Pizza', 250.00),
    (2, 1, 'Garlic Bread', 120.00),
    (3, 2, 'Paneer Tikka', 220.00),
    (4, 2, 'Veg Biryani', 180.00),
    (5, 3, 'Green Salad', 150.00),
    (6, 99, 'Mystery Dish', 100.00);

-- Task 2: INNER JOIN - show dishes with restaurant name and city
SELECT
    d.dish_name,
    r.name AS restaurant_name,
    r.city,
    d.price
FROM dishes AS d
INNER JOIN restaurants AS r
    ON d.restaurant_id = r.id;

-- Task 3: LEFT JOIN - show all restaurants, even without dishes
SELECT
    r.name AS restaurant_name,
    r.city,
    d.dish_name,
    d.price
FROM restaurants AS r
LEFT JOIN dishes AS d
    ON r.id = d.restaurant_id;

-- Task 4: RIGHT JOIN - show all dishes, including unmatched dishes
SELECT
    d.dish_name,
    d.restaurant_id,
    r.name AS restaurant_name,
    r.city
FROM restaurants AS r
RIGHT JOIN dishes AS d
    ON r.id = d.restaurant_id;

-- Task 5: Show all playlists, even if they contain no songs
-- Assumed tables: playlists(playlist_id, name)
-- and playlist_songs(playlist_id, song_id).
SELECT
    p.playlist_id,
    p.name AS playlist_name,
    ps.song_id
FROM playlists AS p
LEFT JOIN playlist_songs AS ps
    ON p.playlist_id = ps.playlist_id;
