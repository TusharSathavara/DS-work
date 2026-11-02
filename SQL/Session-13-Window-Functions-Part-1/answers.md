# Session 13: Window Functions - Part 1

## Task 1: Create Playlists Table

Created a `Playlists` table with four columns:

- `id`: Unique playlist identifier.
- `user_id`: ID of the user who owns the playlist.
- `playlist_name`: Name of the playlist.
- `total_likes`: Total likes received by the playlist.

Inserted eight sample playlists belonging to different users. Some playlists have the same `user_id`, and two playlists have the same number of likes.

## Task 2: ROW_NUMBER()

```sql
SELECT
    playlist_name,
    user_id,
    total_likes,
    ROW_NUMBER() OVER (ORDER BY total_likes DESC, id ASC) AS row_num
FROM Playlists;
```

`ROW_NUMBER()` assigns a unique sequential number to each playlist. Playlists are ordered by likes from highest to lowest. The `id` column breaks ties consistently.

## Task 3: RANK()

```sql
SELECT
    playlist_name,
    user_id,
    total_likes,
    RANK() OVER (ORDER BY total_likes DESC) AS playlist_rank
FROM Playlists;
```

`RANK()` gives equal ranks to playlists with the same number of likes. The next rank is skipped after a tie. For example, two playlists tied at rank 1 are followed by rank 3.

## Task 4: DENSE_RANK() with PARTITION BY

```sql
SELECT
    playlist_name,
    user_id,
    total_likes,
    DENSE_RANK() OVER (
        PARTITION BY user_id
        ORDER BY total_likes DESC
    ) AS dense_rank
FROM Playlists;
```

`PARTITION BY user_id` creates a separate ranking for each user. `DENSE_RANK()` gives tied playlists the same rank without skipping the next rank.

## Task 5: Top 2 Playlists Per User

```sql
WITH RankedPlaylists AS (
    SELECT
        playlist_name,
        user_id,
        total_likes,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY total_likes DESC, id ASC
        ) AS row_num
    FROM Playlists
)
SELECT playlist_name, user_id, total_likes, row_num
FROM RankedPlaylists
WHERE row_num <= 2
ORDER BY user_id, row_num;
```

The CTE assigns a row number separately for each user. The outer query selects only rows numbered 1 or 2, returning up to two playlists per user.

**Key difference:**
- `ROW_NUMBER()`: Always assigns a unique number.
- `RANK()`: Ties share a rank, and subsequent ranks may be skipped.
- `DENSE_RANK()`: Ties share a rank, but subsequent ranks are not skipped.
