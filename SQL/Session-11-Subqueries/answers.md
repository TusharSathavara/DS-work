# Session 11: Subqueries

## Task 1: Restaurants Above Their City's Average Rating

```sql
SELECT *
FROM Restaurants AS r
WHERE r.rating > (
    SELECT AVG(r2.rating)
    FROM Restaurants AS r2
    WHERE r2.city = r.city
);
```

The subquery calculates the average rating for each restaurant's city. The outer query returns restaurants whose rating is higher than that city-specific average.

## Task 2: Count Orders for Each User

```sql
SELECT
    u.name,
    (
        SELECT COUNT(*)
        FROM Orders AS o
        WHERE o.user_id = u.id
    ) AS total_orders
FROM Users AS u;
```

The subquery counts the orders belonging to each user. Every user is displayed, including users who have placed zero orders.

## Task 3: Movies with at Least One Five-Star Review

```sql
SELECT *
FROM Movies
WHERE id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);
```

The subquery returns the IDs of movies with five-star reviews. The outer query retrieves those movies. A movie with multiple five-star reviews still appears only once.

## Task 4: Sellers Who Have Sold Products in Every Category

```sql
SELECT s.name
FROM Sellers AS s
WHERE NOT EXISTS (
    SELECT c.id
    FROM Categories AS c
    WHERE NOT EXISTS (
        SELECT 1
        FROM Products AS p
        WHERE p.seller_id = s.id
          AND p.category_id = c.id
    )
);
```

The nested subqueries find sellers for whom no category is missing from their product sales. Therefore, the result contains sellers who have sold at least one product in every listed category.

**Assumed columns:** `Sellers(id, name)`, `Categories(id)`, and `Products(seller_id, category_id)`.
