# Task 5: Export top-rated restaurants to CSV

import sqlite3
import pandas as pd

conn = sqlite3.connect("foodie.db")

query = """
SELECT *
FROM Restaurants
WHERE rating > 4.5
"""

df = pd.read_sql_query(query, conn)

df.to_csv("top_rated_restaurants.csv", index=False)

print("Top-rated restaurants exported to top_rated_restaurants.csv")
print(df)

conn.close()
