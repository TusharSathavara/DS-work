# Session 10: JOINS - Part 2

## Task 1: FULL JOIN

A `FULL OUTER JOIN` returns matching rows and unmatched rows from both tables.

MySQL does not directly support `FULL OUTER JOIN`. It can be simulated using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

The query in `session_10.sql` displays influencers with collaborations and influencers without collaborations. It also includes collaborations that do not match an influencer in the first influencer position.

## Task 2: SELF JOIN

A `SELF JOIN` joins a table with itself. It is useful for displaying each playlist alongside its parent playlist.

```sql
SELECT
    child.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM Playlists AS child
LEFT JOIN Playlists AS parent
    ON child.parent_playlist_id = parent.id;
```

The `LEFT JOIN` ensures that playlists without a parent are also displayed.

## Task 3: Multiple JOINs

```sql
SELECT
    u.username,
    o.order_date,
    p.amount
FROM Users AS u
LEFT JOIN Orders AS o
    ON u.id = o.user_id
LEFT JOIN Payments AS p
    ON o.id = p.order_id;
```

Both joins are `LEFT JOIN`s, so all users appear even if they have no orders or payments. Missing order and payment information is shown as `NULL`.

## Task 4: Remove Duplicate Restaurant Rows

```sql
SELECT DISTINCT
    r.id,
    r.name
FROM Restaurants AS r
INNER JOIN Reviews AS rev
    ON r.id = rev.restaurant_id;
```

**Explanation:** A restaurant may have multiple reviews, so joining restaurants to reviews can return the same restaurant multiple times. `DISTINCT` removes duplicate restaurant results.

## Task 5: Different JOIN Conditions

### Query A: Join using category IDs

```sql
SELECT
    p.product_name,
    c.category_name
FROM Products AS p
INNER JOIN Categories AS c
    ON p.category_id = c.id;
```

### Query B: Join using category names

```sql
SELECT
    p.product_name,
    c.category_name
FROM Products AS p
INNER JOIN Categories AS c
    ON p.category_name = c.category_name;
```

**Explanation:** Joining on category IDs is generally more reliable and efficient because IDs are usually indexed, unique, and stable. Joining on names can be slower and may produce incorrect matches if category names are duplicated or changed.
