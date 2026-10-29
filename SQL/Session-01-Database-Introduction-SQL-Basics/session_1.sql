-- Session 1: Database Introduction & SQL Basics

-- Task 1: Create a new database
CREATE DATABASE music_streaming_app;

-- Select the database
USE music_streaming_app;

-- Task 2: Create the playlists table
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100),
    created_by VARCHAR(100)
);

-- Task 3: Insert three sample playlists
INSERT INTO playlists (playlist_id, name, created_by)
VALUES
    (1, 'Bollywood Hits', 'Amit'),
    (2, 'Chill Vibes', 'Priya'),
    (3, 'Workout Mix', 'Rahul');

-- Task 4: Display playlists created by Amit
SELECT *
FROM playlists
WHERE created_by = 'Amit';
