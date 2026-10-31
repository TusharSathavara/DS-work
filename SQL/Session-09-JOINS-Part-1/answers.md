# Session 9: JOINS - Part 1

## Task 1: Create Restaurants and Dishes Tables

Created two tables:

- `restaurants`: Stores restaurant ID, name, and city.
- `dishes`: Stores dish ID, restaurant ID, dish name, and price.

Inserted three restaurants and multiple dishes. One dish uses `restaurant_id = 99`, which does not match any restaurant, to demonstrate an unmatched record in Task 4.

## Task 2: INNER JOIN

```sql
SELECT
    d.dish_name,
    r.name AS restaurant_name,
    r.city,
    d.price
FROM dishes AS d
INNER JOIN restaurants AS r
    ON d.restaurant_id = r.id;
```

`INNER JOIN` returns only records with matching restaurant IDs in both tables. The unmatched `Mystery Dish` is not included.

## Task 3: LEFT JOIN

```sql
SELECT
    r.name AS restaurant_name,
    r.city,
    d.dish_name,
    d.price
FROM restaurants AS r
LEFT JOIN dishes AS d
    ON r.id = d.restaurant_id;
```

`LEFT JOIN` returns every restaurant from the left table. If a restaurant has no matching dish, the dish columns contain `NULL`.

## Task 4: RIGHT JOIN

```sql
SELECT
    d.dish_name,
    d.restaurant_id,
    r.name AS restaurant_name,
    r.city
FROM restaurants AS r
RIGHT JOIN dishes AS d
    ON r.id = d.restaurant_id;
```

`RIGHT JOIN` returns every dish from the right table, including dishes without a matching restaurant. For `Mystery Dish`, the restaurant name and city are `NULL`.

## Task 5: Display All Playlists, Even Empty Ones

A `LEFT JOIN` is appropriate because it returns every playlist, even if no songs are associated with it.

```sql
SELECT
    p.playlist_id,
    p.name AS playlist_name,
    ps.song_id
FROM playlists AS p
LEFT JOIN playlist_songs AS ps
    ON p.playlist_id = ps.playlist_id;
```

This example assumes a `playlists` table and a `playlist_songs` table that links playlists to songs. An empty playlist will still appear, with `NULL` in the `song_id` column.
