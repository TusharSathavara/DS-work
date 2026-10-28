# Session 11: Vectors & Matrices (Basic)

# Task 1: Playlist Duration

playlist = [210, 180, 245, 200, 175]

total_duration = sum(playlist)

print("TASK 1: Playlist Duration")
print("Song Durations:", playlist)
print("Total Duration:", total_duration, "seconds")
print("Total Duration:", round(total_duration / 60, 2), "minutes")


# Task 2: Friends' Food Ratings Matrix

# Rows represent friends; columns represent food items.
# Food items: Pizza, Burger, Dosa

ratings = [
    [5, 4, 3],
    [4, 5, 2],
    [3, 4, 5]
]

print("\nTASK 2: Food Ratings Matrix")

for row in ratings:
    print(row)

# Second food item is at index 1.
print("\nRatings for the second food item (Burger):")

for friend_number, row in enumerate(ratings, start=1):
    print(f"Friend {friend_number}: {row[1]}")


# Task 3: Total Orders for Each Dish Across Three Days

# Rows represent days; columns represent dishes.
# Dishes: Pizza, Burger, Dosa, Sandwich

orders = [
    [20, 15, 12, 10],
    [25, 18, 14, 13],
    [22, 16, 17, 11]
]

dish_names = ["Pizza", "Burger", "Dosa", "Sandwich"]

print("\nTASK 3: Total Orders per Dish")

for column in range(len(dish_names)):
    total_orders = sum(day[column] for day in orders)
    print(f"{dish_names[column]}: {total_orders} orders")


# Task 4: Flipkart Product Revenue

# Each row contains [price, quantity_sold]
products = [
    [500, 10],
    [1200, 5],
    [800, 8],
    [1500, 3],
    [300, 20]
]

def calculate_revenue(product_matrix):
    revenues = []

    for product in product_matrix:
        price = product[0]
        quantity_sold = product[1]
        revenue = price * quantity_sold
        revenues.append(revenue)

    return revenues


revenues = calculate_revenue(products)

print("\nTASK 4: Product Revenue")

for index, revenue in enumerate(revenues, start=1):
    print(f"Product {index}: ₹{revenue}")
