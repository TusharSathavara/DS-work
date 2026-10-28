# Session 5: Sampling
# Task 2: Simulate Random Sampling

import random

# Create a list of 1000 fake user IDs
users = [f"user{i}" for i in range(1, 1001)]

# Select 50 random users for a survey
sample_users = random.sample(users, 50)

# Display the selected users
print("Total Population:", len(users))
print("Sample Size:", len(sample_users))
print("\nSelected User IDs:")

for user in sample_users:
    print(user)
