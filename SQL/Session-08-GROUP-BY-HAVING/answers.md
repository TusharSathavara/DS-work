# Session 8: GROUP BY + HAVING

## Task 1: Create Orders Table

Created an `Orders` table with the following columns:

- `order_id`: Unique identifier for each order.
- `user_id`: Identifies the user who placed the order.
- `payment_method`: Payment method used, such as UPI, Card, Wallet, or COD.
- `amount`: Amount paid for the order.

Inserted eight sample records representing different users and payment methods.

## Task 2: Count Orders by Payment Method

```sql
SELECT payment_method, COUNT(*) AS order_count
FROM Orders
GROUP BY payment_method;
```

`GROUP BY` groups orders by payment method, and `COUNT(*)` counts the orders in each group.

**Expected result:**

| payment_method | order_count |
|---|---:|
| UPI | 3 |
| Card | 3 |
| Wallet | 1 |
| COD | 1 |

## Task 3: Calculate Total Spend by User

```sql
SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;
```

`SUM(amount)` calculates the total amount spent by each user.

**Expected result:**

| user_id | total_spend |
|---:|---:|
| 101 | 900.00 |
| 102 | 1050.00 |
| 103 | 600.00 |
| 104 | 500.00 |

## Task 4: Use HAVING with AVG()

```sql
SELECT payment_method, AVG(amount) AS average_order_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;
```

`HAVING` filters groups after aggregation. This query returns only payment methods whose average order amount is greater than 300.

**Expected result:**

| payment_method | average_order_amount |
|---|---:|
| UPI | 416.67 |
| Card | 416.67 |
| Wallet | 350.00 |

## Task 5: Difference Between WHERE and HAVING

### WHERE

`WHERE` filters individual rows before grouping and aggregation.

```sql
SELECT payment_method, SUM(amount) AS total_amount
FROM Orders
WHERE amount >= 300
GROUP BY payment_method;
```

This query includes only orders whose amount is at least 300 before calculating totals for each payment method.

### HAVING

`HAVING` filters groups after aggregation.

```sql
SELECT payment_method, SUM(amount) AS total_amount
FROM Orders
GROUP BY payment_method
HAVING SUM(amount) >= 700;
```

This query calculates the total for each payment method and displays only groups with a total of at least 700.

**In short:** `WHERE` filters rows, whereas `HAVING` filters grouped results.
