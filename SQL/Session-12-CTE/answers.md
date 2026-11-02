# Session 12: CTE (WITH Clause)

## Task 1: Products Rated Above 4.5

```sql
WITH TopRatedProducts AS (
    SELECT *
    FROM Products
    WHERE rating > 4.5
)
SELECT *
FROM TopRatedProducts;
```

A CTE creates a temporary named result set that can be referenced by the main query. Here, `TopRatedProducts` contains products with ratings above 4.5.

## Task 2: Subquery vs CTE

### Using a subquery

```sql
SELECT *
FROM (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
) AS AhmedabadRestaurants
WHERE delivery_charges < 50;
```

### Using a CTE

```sql
WITH AhmedabadRestaurants AS (
    SELECT *
    FROM Restaurants
    WHERE city = 'Ahmedabad'
)
SELECT *
FROM AhmedabadRestaurants
WHERE delivery_charges < 50;
```

Both queries return restaurants located in Ahmedabad with delivery charges below 50. The CTE version gives the intermediate result a meaningful name, which can improve readability.

## Task 3: Top 3 Users and Top 3 Posts

```sql
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
```

Two CTEs independently identify the three users with the most followers and the three posts with the most likes. `UNION ALL` combines both lists into one result set, while `item_type` identifies whether each row represents a user or a post.

## Task 4: Recursive CTE for the Next 7 Days

```sql
WITH RECURSIVE DateList AS (
    SELECT CURRENT_DATE AS booking_date

    UNION ALL

    SELECT DATE_ADD(booking_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE booking_date < DATE_ADD(CURRENT_DATE, INTERVAL 6 DAY)
)
SELECT booking_date
FROM DateList;
```

The base case starts with today's date. The recursive part adds one day repeatedly until the seventh date is generated. The output includes today and the following six days.

## Task 5: Refactor a Query Using a CTE

### Original query

```sql
SELECT *
FROM Users
WHERE followers > 1000;
```

### Refactored query

```sql
WITH PopularUsers AS (
    SELECT *
    FROM Users
    WHERE followers > 1000
)
SELECT *
FROM PopularUsers;
```

The CTE gives the filtered user list a descriptive name, making the query easier to read and maintain. For this simple example, the CTE is mainly a readability improvement; it does not automatically make the query faster.
