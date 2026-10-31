# Session 5: WHERE Clause + LIKE

## Task 1: Create Restaurants Table

Created a `Restaurants` table with the columns `id`, `name`, `cuisine`, `rating`, and `city`. Inserted five sample restaurant records.

## Task 2: Filter by Rating and City

```sql
SELECT *
FROM Restaurants
WHERE rating > 4.0
  AND city IN ('Ahmedabad', 'Surat');
```

This query returns restaurants with a rating greater than 4.0 that are located in either Ahmedabad or Surat.

## Task 3: Use LIKE

```sql
SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';
```

The `%` wildcard matches zero or more characters. This query finds restaurant names beginning with `Swa`, such as `Swagat` and `Swadisht`.

## Task 4: Use BETWEEN

```sql
SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;
```

`BETWEEN` includes both endpoints, so ratings of 3.5 and 4.5 are included.

## Task 5: Use IN

```sql
SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
```

The `IN` operator selects restaurants whose cuisine matches any of the listed values.
