# Session 14: Window Functions - Part 2

## Task 1: Create Orders Table

Created an `Orders` table with these columns:

- `order_id`: Unique order identifier.
- `user_id`: ID of the user who placed the order.
- `order_date`: Date when the order was placed.
- `total_amount`: Total amount of the order.

Inserted eight sample orders belonging to three users on different dates.

## Task 2: LAG()

```sql
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM Orders;
```

`LAG()` returns the total amount of the previous order for the same user. `PARTITION BY user_id` separates users, and `ORDER BY` arranges each user's orders chronologically. The first order for each user has `NULL` as its previous order amount.

## Task 3: LEAD()

```sql
SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    LEAD(total_amount) OVER (
        PARTITION BY user_id
        ORDER BY order_date, order_id
    ) AS next_order_amount
FROM Orders;
```

`LEAD()` returns the total amount of the next order for the same user. The last order for each user has `NULL` because there is no later order.

## Task 4: Running Total

```sql
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
FROM Orders;
```

The running total accumulates each user's order amounts chronologically. It starts with the first order and adds each subsequent order amount to the previous total.

## Task 5: Three-Order Moving Average

```sql
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
FROM Orders;
```

The window frame includes the current order and up to two previous orders from the same user. Dividing the sum by the number of rows in that frame calculates the moving average. For the first and second orders, the average uses only the available orders.
