-- Session 3: INSERT, UPDATE & DELETE

-- Task 1: Create the Playlist table
CREATE TABLE Playlist (
    id INT PRIMARY KEY,
    song_name VARCHAR(150),
    artist VARCHAR(100),
    duration INT
);

-- Insert one row for a favorite song
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES (1, 'Tum Hi Ho', 'Arijit Singh', 262);

-- Task 2: Insert three more songs
INSERT INTO Playlist (id, song_name, artist, duration)
VALUES
    (2, 'Kesariya', 'Arijit Singh', 268),
    (3, 'Heeriye', 'Jasleen Royal', 194),
    (4, 'Apna Bana Le', 'Arijit Singh', 261);

-- Task 3: Correct an artist name using UPDATE
UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE id = 1;

-- Task 4: Delete songs shorter than 120 seconds
DELETE FROM Playlist
WHERE duration < 120;

-- Task 5: Add (Remix) to AP Dhillon song names longer than 180 seconds
UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
  AND duration > 180;
