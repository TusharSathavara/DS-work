# Session 7: Aggregate Functions

## Task 1: Create Orders Table

Created an `Orders` table with the following columns:

- `order_id`: Unique identifier for each order.
- `user_name`: Name of the user who placed the order.
- `total_amount`: Total order amount. It can contain `NULL`.
- `order_date`: Date when the order was placed.

Inserted five sample orders for Amit, Priya, and Rahul, including one order with a `NULL` amount.

## Task 2: Count Orders by Each User

```sql
SELECT user_name, COUNT(*) AS order_count
FROM Orders
GROUP BY user_name;
```

`COUNT(*)` counts all rows, including rows where `total_amount` is `NULL`. `GROUP BY` groups the orders by user.

**Expected result:**

| user_name | order_count |
|---|---:|
| Amit | 2 |
| Priya | 2 |
| Rahul | 1 |

## Task 3: Calculate Average Order Amount

```sql
SELECT AVG(total_amount) AS average_order_amount
FROM Orders;
```

`AVG()` calculates the average of non-NULL values. It ignores the order whose `total_amount` is `NULL`.

**Expected result:** 1425.00

## Task 4: Find Maximum and Minimum Order Amounts

```sql
SELECT
    MAX(total_amount) AS highest_order_amount,
    MIN(total_amount) AS lowest_order_amount
FROM Orders;
```

- `MAX()` returns the highest non-NULL order amount.
- `MIN()` returns the lowest non-NULL order amount.

**Expected result:** Highest = 2200.00; Lowest = 800.00.

## Task 5: Calculate Total Sales

```sql
SELECT SUM(total_amount) AS total_sales
FROM Orders
WHERE total_amount IS NOT NULL;
```

`WHERE total_amount IS NOT NULL` filters out rows with NULL amounts. `SUM()` then calculates the total of the remaining order amounts.

**Expected result:** 5700.00
