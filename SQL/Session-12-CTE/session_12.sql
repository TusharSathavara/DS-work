-- Session 12: CTE (WITH Clause)

-- Task 1: Find products with a rating above 4.5
WITH TopRatedProducts AS (
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;

-- Task 2A: Using a subquery
SELECT *
FROM Restaurants
WHERE city = 'Ahmedabad'
  AND delivery_charges < 50;

-- Task 2B: Using a CTE
WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
)
SELECT *
FROM AhmedabadRestaurants
WHERE delivery_charges < 50;

-- Task 3: Get the top 3 most-followed users
-- and top 3 most-liked posts in one result set
WITH TopUsers AS (
    SELECT
        username AS item_name,
        followers AS count_value,
        'User' AS item_type
    FROM Users
    ORDER BY followers DESC
    LIMIT 3
),
TopPosts AS (
    SELECT
        title AS item_name,
        likes AS count_value,
        'Post' AS item_type
    FROM Posts
    ORDER BY likes DESC
    LIMIT 3
)
SELECT item_name, count_value, item_type
FROM TopUsers

UNION ALL

SELECT item_name, count_value, item_type
FROM TopPosts;

-- Task 4: Generate dates for the next 7 days, including today
WITH RECURSIVE DateList AS (
    SELECT CURRENT_DATE AS booking_date

    UNION ALL

    SELECT DATE_ADD(booking_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE booking_date < DATE_ADD(CURRENT_DATE, INTERVAL 6 DAY)
)
SELECT booking_date
FROM DateList;

-- Task 5A: Original query to find users with more than 1000 followers
SELECT *
FROM Users
WHERE followers > 1000;

-- Task 5B: Refactored using a CTE
WITH PopularUsers AS (
    SELECT *
    FROM Users
    WHERE followers > 1000
)
SELECT *
FROM PopularUsers;
