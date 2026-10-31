-- Session 8: GROUP BY + HAVING

-- Task 1: Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2)
);

-- Insert eight sample orders
INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
    (1, 101, 'UPI', 250.00),
    (2, 102, 'Card', 450.00),
    (3, 101, 'Wallet', 350.00),
    (4, 103, 'COD', 200.00),
    (5, 102, 'UPI', 600.00),
    (6, 104, 'Card', 500.00),
    (7, 103, 'UPI', 400.00),
    (8, 101, 'Card', 300.00);

-- Task 2: Count orders by payment method
SELECT payment_method, COUNT(*) AS order_count
FROM Orders
GROUP BY payment_method;

-- Task 3: Calculate total amount spent by each user
SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;

-- Task 4: Show payment methods with average order amount greater than 300
SELECT payment_method, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- Task 5A: WHERE filters individual rows before grouping
SELECT payment_method, SUM(amount) AS total_amount
FROM Orders
WHERE amount >= 300
GROUP BY payment_method;

-- Task 5B: HAVING filters groups after aggregation
SELECT payment_method, SUM(amount) AS total_amount
FROM Orders
GROUP BY payment_method
HAVING SUM(amount) >= 700;
