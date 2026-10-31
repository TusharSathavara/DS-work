-- Session 4: SELECT Statement Basics

-- Task 1: Create MusicPlaylist table
CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(150),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

-- Insert five sample songs
INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
    (1, 'Tum Hi Ho', 'Arijit Singh', 'Romantic', 262),
    (2, 'Kesariya', 'Arijit Singh', 'Bollywood', 268),
    (3, 'Heeriye', 'Jasleen Royal', 'Pop', 194),
    (4, 'Apna Bana Le', 'Arijit Singh', 'Romantic', 261),
    (5, 'Excuses', 'AP Dhillon', 'Punjabi', 176);

-- Display all columns for all songs
SELECT *
FROM MusicPlaylist;

-- Task 2: Display song_name and artist for the first three records
SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;

-- Task 3: Display unique restaurant names from FoodOrders
SELECT DISTINCT restaurant
FROM FoodOrders;

-- Task 4: Display food items and order dates using aliases
SELECT
    food_item AS Dish,
    order_date AS `Date Ordered`
FROM FoodOrders;

-- Task 5: Corrected query: LIMIT comes at the end
SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;
