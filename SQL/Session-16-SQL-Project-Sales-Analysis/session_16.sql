-- Session 16: SQL Project - Sales Analysis

-- Task 1: Create FoodOrders table and import CSV data

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    customer_name VARCHAR(100),
    order_amount DECIMAL(10,2),
    order_date DATE
);

-- Import data from food_orders.csv
-- Make sure the file path is correct for your system.

LOAD DATA LOCAL INFILE 'food_orders.csv'
INTO TABLE FoodOrders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, restaurant_name, customer_name, order_amount, order_date);


-- Task 2: Create TopSongs table and insert 5 sample records

CREATE TABLE TopSongs (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(150),
    artist VARCHAR(100),
    streams BIGINT,
    release_date DATE
);

INSERT INTO TopSongs (song_id, song_title, artist, streams, release_date)
VALUES
(1, 'Kesariya', 'Arijit Singh', 500000000, '2022-07-17'),
(2, 'Heeriye', 'Jasleen Royal', 300000000, '2023-07-25'),
(3, 'Apna Bana Le', 'Arijit Singh', 450000000, '2022-11-05'),
(4, 'Chaleya', 'Arijit Singh', 400000000, '2023-08-10'),
(5, 'Tum Hi Ho', 'Arijit Singh', 600000000, '2013-04-16');


-- Task 3: Find the top 3 customers by total spending

SELECT
    customer_name,
    SUM(order_amount) AS total_spent
FROM FoodOrders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;


-- Task 4: Restaurant-wise performance report

SELECT
    restaurant_name,
    COUNT(*) AS total_orders,
    SUM(order_amount) AS total_sales
FROM FoodOrders
GROUP BY restaurant_name
ORDER BY total_sales DESC;


-- Task 5: Calculate dashboard KPIs

SELECT
    'Average Order Amount' AS kpi_name,
    ROUND(AVG(order_amount), 2) AS kpi_value
FROM FoodOrders

UNION ALL

SELECT
    'Unique Customers' AS kpi_name,
    COUNT(DISTINCT customer_name) AS kpi_value
FROM FoodOrders;
