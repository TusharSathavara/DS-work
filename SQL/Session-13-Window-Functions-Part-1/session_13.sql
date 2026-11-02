-- Session 13: Window Functions - Part 1

-- Task 1: Create Playlists table
CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    total_likes INT
);

-- Insert 8 sample playlists
INSERT INTO Playlists (id, user_id, playlist_name, total_likes)
VALUES
    (1, 101, 'Bollywood Hits', 500),
    (2, 101, 'Workout Mix', 800),
    (3, 101, 'Chill Vibes', 800),
    (4, 102, 'Party Anthems', 650),
    (5, 102, 'Romantic Songs', 400),
    (6, 103, 'Focus Music', 900),
    (7, 103, 'Morning Energy', 550),
    (8, 104, 'Travel Tunes', 700);

-- Task 2: Assign a unique row number to every playlist
SELECT
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (ORDER BY total_likes DESC, id ASC) AS row_num
FROM Playlists;

-- Task 3: Rank all playlists by total likes
SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists;

-- Task 4: Rank playlists within each user's account
SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS dense_rank
FROM Playlists;

-- Task 5: Select the top 2 playlists per user
WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC, id ASC
        ) AS row_num
    FROM Playlists
)
SELECT playlist_name, user_id, total_likes, row_num
FROM RankedPlaylists
WHERE row_num <= 2
ORDER BY user_id, row_num;
