-- Session 18: Interview Questions + Final Revision


-- Task 1: Count songs uploaded by each artist
-- Show only artists who uploaded more than 3 songs.

SELECT
    artist_name,
    COUNT(song_id) AS total_songs
FROM songs
GROUP BY artist_name
HAVING COUNT(song_id) > 3;


-- Task 2: Display each username with their total order amount.

SELECT
    u.username,
    COALESCE(SUM(o.amount), 0) AS total_order_amount
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.username;


-- Task 3: Find restaurants whose rating is
-- higher than the average rating of all restaurants.

SELECT
    name,
    rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);


-- Task 4: Display each user's transaction amount
-- and running total ordered by transaction date.

SELECT
    id,
    user_id,
    amount,
    transaction_date,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY transaction_date, id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
ORDER BY user_id, transaction_date, id;


-- Task 5: Two SQL query optimizations

-- Optimization 1: Create a composite index on category and price.
-- This helps the database find products using category and price
-- conditions more efficiently.

CREATE INDEX idx_category_price
ON products(category, price);


-- Optimization 2: Avoid SELECT * and retrieve only required columns.
-- This reduces unnecessary data retrieval and can improve query performance.

SELECT
    product_name,
    category,
    price
FROM products
WHERE category = 'Electronics'
AND price BETWEEN 1000 AND 50000;
