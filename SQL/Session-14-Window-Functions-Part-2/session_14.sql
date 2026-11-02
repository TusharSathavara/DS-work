-- Session 14: Window Functions - Part 2

-- Task 1: Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Insert 8 sample orders
INSERT INTO Orders (order_id, user_id, order_date, total_amount)
VALUES
    (1, 101, '2026-10-01', 250.00),
    (2, 101, '2026-10-03', 400.00),
    (3, 102, '2026-10-02', 300.00),
    (4, 101, '2026-10-05', 150.00),
    (5, 102, '2026-10-06', 500.00),
    (6, 103, '2026-10-04', 200.00),
    (7, 102, '2026-10-08', 350.00),
    (8, 103, '2026-10-09', 450.00);

-- Task 2: LAG() - Get the previous order amount for each user
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM Orders
ORDER BY user_id, order_date, order_id;

-- Task 3: LEAD() - Get the next order amount for each user
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
    ) AS next_order_amount
FROM Orders
ORDER BY user_id, order_date, order_id;

-- Task 4: Running total for each user
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM Orders
ORDER BY user_id, order_date, order_id;

-- Task 5: Three-order moving average for each user
-- Uses SUM() as required, divided by the number of rows in the frame.
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) /
    COUNT(*) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM Orders
ORDER BY user_id, order_date, order_id;
