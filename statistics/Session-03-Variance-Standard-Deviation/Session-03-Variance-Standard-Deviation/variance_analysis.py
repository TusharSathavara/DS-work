# Session 3: Variance & Standard Deviation

# Task 1: Calculate variance of weekly steps

weekly_steps = [4500, 7000, 5000, 8000, 4000, 9000, 6000]

# Calculate mean
mean_steps = sum(weekly_steps) / len(weekly_steps)

# Calculate population variance
squared_differences = [(step - mean_steps) ** 2 for step in weekly_steps]
variance = sum(squared_differences) / len(weekly_steps)

print("Weekly Steps:", weekly_steps)
print("Mean Steps:", round(mean_steps, 2))
print("Population Variance:", round(variance, 2))


# Task 2: Compare consistency of two friends

friend_a = [200, 200, 200, 200, 200]
friend_b = [100, 300, 150, 400, 50]


def calculate_variance(data):
    mean = sum(data) / len(data)
    squared_differences = [(value - mean) ** 2 for value in data]
    return sum(squared_differences) / len(data)


variance_a = calculate_variance(friend_a)
variance_b = calculate_variance(friend_b)

print("\nFriend A Variance:", round(variance_a, 2))
print("Friend B Variance:", round(variance_b, 2))

if variance_a < variance_b:
    print("Friend A is more consistent.")
else:
    print("Friend B is more consistent.")
