# Session 4: SELECT Statement Basics

## Task 1: Create MusicPlaylist and Retrieve All Songs

Created a table named `MusicPlaylist` with the columns `id`, `song_name`, `artist`, `genre`, and `duration`.

Inserted five sample songs and used the following query to retrieve all columns and records:

```sql
SELECT *
FROM MusicPlaylist;
```

## Task 2: Select Specific Columns with LIMIT

The following query displays only the song name and artist for the first three records:

```sql
SELECT song_name, artist
FROM MusicPlaylist
LIMIT 3;
```

## Task 3: Find Unique Restaurant Names

The `DISTINCT` keyword returns unique restaurant names without duplicate values.

```sql
SELECT DISTINCT restaurant
FROM FoodOrders;
```

## Task 4: Use Column Aliases

The `AS` keyword gives readable display names to the selected columns.

```sql
SELECT
    food_item AS Dish,
    order_date AS `Date Ordered`
FROM FoodOrders;
```

## Task 5: Fix the SQL Query

**Original query:**

```sql
SELECT DISTINCT food_item, restaurant
FROM FoodOrders LIMIT 2;
```

**Correct query:**

```sql
SELECT DISTINCT food_item, restaurant
FROM FoodOrders
LIMIT 2;
```

The corrected query places `LIMIT` at the end of the statement. The original query is actually valid SQL in MySQL, so the line break is only for readability. If the original query produced an error, the cause may be elsewhere.
