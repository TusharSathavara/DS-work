# Session 15: SQL + Python Integration

import sqlite3
import pandas as pd

# Task 1: Create database and Restaurants table
conn = sqlite3.connect("foodie.db")
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    cuisine TEXT,
    rating REAL
)
""")

conn.commit()

# Task 2: Insert sample restaurants
restaurants = [
    (1, "La Pino'z Pizza", "Italian", 4.3),
    (2, "Honest", "Fast Food", 3.8),
    (3, "Udupi", "South Indian", 4.5)
]

cursor.executemany("""
INSERT OR IGNORE INTO Restaurants (id, name, cuisine, rating)
VALUES (?, ?, ?, ?)
""", restaurants)

conn.commit()

# Fetch restaurants with rating above 4.0
cursor.execute("""
SELECT name
FROM Restaurants
WHERE rating > 4.0
""")

print("Restaurants with rating above 4.0:")
for row in cursor.fetchall():
    print(row[0])

# Task 3: Load data into a Pandas DataFrame
df = pd.read_sql_query("SELECT * FROM Restaurants", conn)

print("\nFirst two restaurants:")
print(df.head(2))

# Task 4: Add delivery_charge and final_rating columns
df["delivery_charge"] = 50

df["final_rating"] = df.apply(
    lambda row: row["rating"] + 0.1
    if row["cuisine"] == "Italian"
    else row["rating"],
    axis=1
)

print("\nUpdated DataFrame:")
print(df)

conn.close()
