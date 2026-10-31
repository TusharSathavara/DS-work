-- Session 7: Aggregate Functions

-- Task 1: Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATE
);

-- Insert five sample orders, including one NULL amount
INSERT INTO Orders (order_id, user_name, total_amount, order_date)
VALUES
    (1, 'Amit', 1500.00, '2026-10-01'),
    (2, 'Priya', 2200.00, '2026-10-02'),
    (3, 'Amit', NULL, '2026-10-03'),
    (4, 'Rahul', 800.00, '2026-10-04'),
    (5, 'Priya', 1200.00, '2026-10-05');

-- Task 2: Count orders placed by each user
SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;

-- Task 3: Calculate average order amount (NULL values are ignored)
SELECT AVG(total_amount) AS average_order_amount
FROM Orders;

-- Task 4: Find the highest and lowest order amounts
SELECT
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount
FROM Orders;

-- Task 5: Calculate total sales, excluding NULL amounts
SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;
