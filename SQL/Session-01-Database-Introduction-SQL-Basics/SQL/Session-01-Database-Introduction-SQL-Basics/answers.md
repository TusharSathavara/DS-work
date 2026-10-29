# Session 1: Database Introduction & SQL Basics

## Task 1: Database Creation

Created a database named `music_streaming_app` using MySQL.

## Task 2: Table Creation

Created a table named `playlists` with the following columns:

- `playlist_id`: An integer that uniquely identifies each playlist and acts as the primary key.
- `name`: Stores the playlist name.
- `created_by`: Stores the name of the user who created the playlist.

## Task 3: Sample Data

Inserted three playlists into the table:

| playlist_id | name | created_by |
|---:|---|---|
| 1 | Bollywood Hits | Amit |
| 2 | Chill Vibes | Priya |
| 3 | Workout Mix | Rahul |

## Task 4: SELECT Query

The following query displays all playlists created by Amit:

```sql
SELECT *
FROM playlists
WHERE created_by = 'Amit';
```

**Expected result:**

| playlist_id | name | created_by |
|---:|---|---|
| 1 | Bollywood Hits | Amit |

## Task 5: Difference Between a Table, Row, and Column

Consider a food delivery app like Zomato that stores restaurant information.

### Table
A table is a collection of related data organized into rows and columns. For example, a `restaurants` table stores restaurant details.

### Row
A row represents one complete record in a table. For example, one row might contain the details of a restaurant named "Pizza Palace".

### Column
A column represents a particular attribute of the data. For example, `restaurant_name`, `location`, and `rating` are columns in a restaurants table.

### Example

| restaurant_name | location | rating |
|---|---|---:|
| Pizza Palace | Ahmedabad | 4.5 |
| Burger House | Mehsana | 4.2 |

- **Table:** The complete `restaurants` table.
- **Row:** All the details belonging to Pizza Palace.
- **Column:** The `rating` column contains restaurant ratings.
