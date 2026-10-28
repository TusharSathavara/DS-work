# Session 8: Probability Basics

import random


# Task 1: Probability of getting Heads

def calculate_probability(event_count, total_outcomes):
    if total_outcomes <= 0:
        return 0

    return event_count / total_outcomes


heads_probability = calculate_probability(1, 2)

print("TASK 1: Coin Toss")
print("Probability of Heads:", heads_probability)


# Task 2: Roll a six-sided die 100 times

six_count = 0
total_rolls = 100

for _ in range(total_rolls):
    roll = random.randint(1, 6)

    if roll == 6:
        six_count += 1

experimental_probability = calculate_probability(
    six_count, total_rolls
)

print("\nTASK 2: Dice Simulation")
print("Total Rolls:", total_rolls)
print("Number of Sixes:", six_count)
print("Experimental Probability:", experimental_probability)
print("Theoretical Probability:", 1 / 6)


# Task 3: Probability of picking a Pop song

genres = [
    "pop", "rock", "pop", "hiphop", "pop",
    "jazz", "rock", "pop", "hiphop", "pop",
    "rock", "pop", "jazz", "pop", "hiphop",
    "pop", "rock", "pop", "jazz", "pop"
]

pop_count = genres.count("pop")

pop_probability = calculate_probability(
    pop_count, len(genres)
)

print("\nTASK 3: Spotify Genres")
print("Total Songs:", len(genres))
print("Pop Songs:", pop_count)
print("Probability of Pop:", round(pop_probability, 2))


# Task 4: Probability of ordering both food and dessert

def probability_food_and_dessert(food_users, dessert_users):
    food_set = set(food_users)
    dessert_set = set(dessert_users)

    if not food_set:
        return 0

    both_users = food_set.intersection(dessert_set)
    unique_food_users = food_set.union(dessert_set)

    if not unique_food_users:
        return 0

    return len(both_users) / len(unique_food_users)


food_orders = ["U1", "U2", "U3", "U4", "U5"]
dessert_orders = ["U2", "U3", "U6"]

both_probability = probability_food_and_dessert(
    food_orders, dessert_orders
)

print("\nTASK 4: Food and Dessert")
print("Users Ordering Both:", len(
    set(food_orders).intersection(set(dessert_orders))
))
print("Probability of Both:", round(both_probability, 2))


# Task 5: Conditional Probability for Recommendations

# Example: Users who bought a phone and headphones

phone_buyers = 100
phone_and_headphone_buyers = 35

def conditional_probability(both_events, given_event):
    if given_event <= 0:
        return 0

    return both_events / given_event


headphone_probability = conditional_probability(
    phone_and_headphone_buyers, phone_buyers
)

print("\nTASK 5: Conditional Probability")
print("Phone Buyers:", phone_buyers)
print("Bought Phone and Headphones:", phone_and_headphone_buyers)
print(
    "Probability of Headphones Given Phone:",
    round(headphone_probability, 2)
)
print(
    "Recommendation: Suggest headphones to phone buyers."
)
