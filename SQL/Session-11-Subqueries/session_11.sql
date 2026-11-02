-- Session 11: Subqueries

-- Task 1: Find restaurants whose rating is above the average
-- rating of all restaurants in the same city.
SELECT *
FROM Restaurants AS r
WHERE r.rating > (
    SELECT AVG(r2.rating)
    FROM Restaurants AS r2
    WHERE r2.city = r.city
);

-- Task 2: Display each user's name and their total order count
SELECT
    u.name,
    (
        SELECT COUNT(*)
        FROM Orders AS o
        WHERE o.user_id = u.id
    ) AS total_orders
FROM Users AS u;

-- Task 3: Find movies with at least one 5-star review
SELECT *
FROM Movies
WHERE id IN (
    SELECT movie_id
    FROM Reviews
    WHERE rating = 5
);

-- Task 4: Find sellers who have sold products in every category
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
