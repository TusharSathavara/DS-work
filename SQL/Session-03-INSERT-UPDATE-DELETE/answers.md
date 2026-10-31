# Session 3: INSERT, UPDATE & DELETE

## Task 1: Create a Table and Insert One Song

Created a table named `Playlist` with four columns:

- `id`: Unique identifier and primary key.
- `song_name`: Name of the song.
- `artist`: Name of the artist.
- `duration`: Song duration in seconds.

Inserted `Tum Hi Ho` by Arijit Singh as an example of a favorite song.

## Task 2: Insert Three More Songs

Inserted three additional songs into the `Playlist` table:

| id | song_name | artist | duration (seconds) |
|---:|---|---|---:|
| 2 | Kesariya | Arijit Singh | 268 |
| 3 | Heeriye | Jasleen Royal | 194 |
| 4 | Apna Bana Le | Arijit Singh | 261 |

## Task 3: Update an Artist Name

The `UPDATE` statement changes an existing value. The `WHERE` clause ensures that only the selected row is updated.

```sql
UPDATE Playlist
SET artist = 'Arijit Singh'
WHERE id = 1;
```

## Task 4: Delete Short Songs

The following query deletes songs whose duration is less than 120 seconds.

```sql
DELETE FROM Playlist
WHERE duration < 120;
```

The `WHERE` clause prevents all rows from being deleted accidentally.

## Task 5: Update AP Dhillon Song Names

The following query adds `(Remix)` to the end of the song name only when the artist is `AP Dhillon` and the duration is greater than 180 seconds.

```sql
UPDATE Playlist
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'AP Dhillon'
  AND duration > 180;
```

The `AND` condition ensures that both requirements must be satisfied.
