-- Session 17: SQL Project - Restaurant Analysis


-- Task 1: Create Restaurant table and insert sample records

CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    location VARCHAR(100),
    average_rating DECIMAL(3,2)
);

INSERT INTO Restaurant (id, name, cuisine, location, average_rating)
VALUES
(1, 'Honest', 'Fast Food', 'Ahmedabad', 4.2),
(2, 'La Pinoz Pizza', 'Italian', 'Surat', 4.5),
(3, 'Udupi', 'South Indian', 'Ahmedabad', 4.1),
(4, 'Dominos', 'Italian', 'Vadodara', 4.3),
(5, 'Punjabi Tadka', 'North Indian', 'Surat', 4.4);


-- Task 2: Count restaurants for each cuisine

SELECT
    cuisine,
    COUNT(*) AS restaurant_count
FROM Restaurant
GROUP BY cuisine
ORDER BY restaurant_count DESC;


-- Task 3: Create Review table and insert 10 sample reviews

CREATE TABLE Review (
    id INT PRIMARY KEY,
    restaurant_id INT,
    user_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_date DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(id)
);

INSERT INTO Review (id, restaurant_id, user_name, rating, review_date)
VALUES
(1, 1, 'Amit', 4.5, '2026-10-01'),
(2, 1, 'Rahul', 4.0, '2026-10-02'),
(3, 2, 'Priya', 5.0, '2026-10-03'),
(4, 2, 'Neha', 4.5, '2026-10-04'),
(5, 3, 'Karan', 4.0, '2026-10-05'),
(6, 3, 'Riya', 4.5, '2026-10-06'),
(7, 4, 'Amit', 4.0, '2026-10-07'),
(8, 4, 'Neha', 4.5, '2026-10-08'),
(9, 5, 'Rahul', 5.0, '2026-10-09'),
(10, 5, 'Priya', 4.0, '2026-10-10');


-- Task 4: Display restaurant names, cuisine and average review rating

SELECT
    r.name AS restaurant_name,
    r.cuisine,
    ROUND(AVG(rv.rating), 2) AS average_review_rating
FROM Restaurant r
INNER JOIN Review rv
    ON r.id = rv.restaurant_id
GROUP BY r.id, r.name, r.cuisine
ORDER BY average_review_rating DESC;


-- Task 5: Rank restaurants by average review rating
-- within each cuisine type

WITH RestaurantRatings AS (
    SELECT
        r.id,
        r.name AS restaurant_name,
        r.cuisine,
        AVG(rv.rating) AS average_review_rating
    FROM Restaurant r
    INNER JOIN Review rv
        ON r.id = rv.restaurant_id
    GROUP BY r.id, r.name, r.cuisine
),
RankedRestaurants AS (
    SELECT
        restaurant_name,
        cuisine,
        ROUND(average_review_rating, 2) AS average_rating,
        DENSE_RANK() OVER (
            PARTITION BY cuisine
            ORDER BY average_review_rating DESC
        ) AS restaurant_rank
    FROM RestaurantRatings
)
SELECT
    restaurant_name,
    cuisine,
    average_rating,
    restaurant_rank
FROM RankedRestaurants
ORDER BY cuisine, restaurant_rank;
