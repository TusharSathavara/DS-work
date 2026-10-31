-- Session 10: JOINS - Part 2

-- Task 1: Create Influencers table
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create Collaborations table
CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

-- Insert sample influencers
INSERT INTO Influencers (id, name)
VALUES
    (1, 'Aarav'),
    (2, 'Diya'),
    (3, 'Kabir'),
    (4, 'Meera');

-- Insert sample collaborations
INSERT INTO Collaborations (id, influencer1_id, influencer2_id, collab_date)
VALUES
    (1, 1, 2, '2026-10-01'),
    (2, 2, 3, '2026-10-05');

-- Task 1: FULL JOIN equivalent in MySQL
-- MySQL does not directly support FULL OUTER JOIN.
SELECT
    i.id AS influencer_id,
    i.name AS influencer_name,
    c.id AS collaboration_id,
    c.influencer1_id,
    c.influencer2_id,
    c.collab_date
FROM Influencers AS i
LEFT JOIN Collaborations AS c
    ON i.id = c.influencer1_id

UNION

SELECT
    i.id AS influencer_id,
    i.name AS influencer_name,
    c.id AS collaboration_id,
    c.influencer1_id,
    c.influencer2_id,
    c.collab_date
FROM Influencers AS i
RIGHT JOIN Collaborations AS c
    ON i.id = c.influencer1_id;

-- Task 2: Create Playlists table
CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO Playlists (id, user_id, playlist_name, parent_playlist_id)
VALUES
    (1, 101, 'My Music', NULL),
    (2, 101, 'Workout', 1),
    (3, 102, 'Relaxing', 1),
    (4, 103, 'Travel', NULL);

-- SELF JOIN: Show each playlist and its parent playlist
SELECT
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists AS child
LEFT JOIN Playlists AS parent
    ON child.parent_playlist_id = parent.id;

-- Task 3: Create Users table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Users (id, username)
VALUES
    (1, 'Amit'),
    (2, 'Priya'),
    (3, 'Rahul');

INSERT INTO Orders (id, user_id, order_date)
VALUES
    (101, 1, '2026-10-10'),
    (102, 2, '2026-10-11');

INSERT INTO Payments (id, order_id, amount)
VALUES
    (1, 101, 500.00),
    (2, 102, 750.00);

-- Display all users, including those without orders or payments
SELECT
    u.username,
    o.order_date,
    p.amount
FROM Users AS u
LEFT JOIN Orders AS o
    ON u.id = o.user_id
LEFT JOIN Payments AS p
    ON o.id = p.order_id;

-- Task 4: Remove duplicate restaurant rows using DISTINCT
-- Assumed tables: Restaurants(id, name), Reviews(id, restaurant_id, rating)
SELECT DISTINCT
    r.id,
    r.name
FROM Restaurants AS r
INNER JOIN Reviews AS rev
    ON r.id = rev.restaurant_id;

-- Task 5A: JOIN using matching category IDs
SELECT
    p.product_name,
    c.category_name
FROM Products AS p
INNER JOIN Categories AS c
    ON p.category_id = c.id;

-- Task 5B: JOIN using matching category names
SELECT
    p.product_name,
    c.category_name
FROM Products AS p
INNER JOIN Categories AS c
    ON p.category_name = c.category_name;
