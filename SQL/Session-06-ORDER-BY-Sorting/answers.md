# Session 6: ORDER BY + Sorting

## Task 1: Sort Products by Price

```sql
SELECT *
FROM products
ORDER BY price ASC;
```

`ASC` sorts products in ascending order, from the lowest price to the highest price.

## Task 2: Find the Five Most Expensive Products

```sql
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;
```

`DESC` sorts products from highest price to lowest price. `LIMIT 5` returns only the first five records.

## Task 3: Sort Movies by Release Year and Rating

```sql
SELECT *
FROM movies
ORDER BY release_year DESC, rating DESC;
```

Movies are sorted by release year, newest first. Movies with the same release year are then sorted by rating, highest first.

## Task 4: Display the First Ten Restaurants Alphabetically

```sql
SELECT *
FROM restaurants
ORDER BY name ASC
LIMIT 10;
```

The query sorts restaurants alphabetically by name and returns the first ten records.

## Task 5: Find the Top Three Trending Songs

```sql
SELECT *
FROM songs
ORDER BY play_count DESC, added_at DESC
LIMIT 3;
```

The query sorts songs by play count in descending order. If two songs have the same play count, the song added more recently appears first. It then returns the top three records.
