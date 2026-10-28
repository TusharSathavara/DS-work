# Session 12: Matrix Multiplication & Linear Regression Math Intuition

import numpy as np


# Task 1: Matrix Multiplication for Instagram Engagement

# Rows represent two days; columns represent two Instagram posts.
likes = np.array([
    [100, 150],
    [200, 250]
])

comments = np.array([
    [10, 20],
    [30, 40]
])

result = np.matmul(likes, comments)

print("TASK 1: Matrix Multiplication")
print("Likes Matrix:")
print(likes)

print("\nComments Matrix:")
print(comments)

print("\nResult of Matrix Multiplication:")
print(result)


# Task 2: Linear Regression Prediction Function

def linear_regression_predict(x, m, c):
    return m * x + c


print("\nTASK 2: Linear Regression Prediction")

x = 5
m = 4
c = 10

predicted_y = linear_regression_predict(x, m, c)

print("Input x:", x)
print("Slope m:", m)
print("Intercept c:", c)
print("Predicted y:", predicted_y)


# Task 3: Predict Zomato Delivery Times

distances = [2, 5, 8]

print("\nTASK 3: Zomato Delivery Time Predictions")

for distance in distances:
    predicted_time = linear_regression_predict(
        distance, 4, 10
    )
    print(
        f"Distance: {distance} km -> "
        f"Predicted delivery time: {predicted_time} minutes"
    )


# Task 4: Slope and Intercept in Product Price Prediction

print("\nTASK 4: Slope and Intercept")

print("Example equation: Price = 100 * Rating + 50")
print("Slope = 100: Predicted price increases by ₹100")
print("for every one-point increase in rating.")

print("Intercept = 50: The model predicts ₹50 when")
print("the rating is zero.")


# Task 5: Matrix Multiplication in a Song Recommendation System

print("\nTASK 5: Song Recommendation System")

# Rows represent users; columns represent song features.
user_preferences = np.array([
    [5, 2],
    [1, 4]
])

# Rows represent song features; columns represent songs.
song_features = np.array([
    [3, 1, 4],
    [1, 5, 2]
])

recommendation_scores = np.matmul(
    user_preferences, song_features
)

print("User Preferences:")
print(user_preferences)

print("\nSong Features:")
print(song_features)

print("\nRecommendation Scores:")
print(recommendation_scores)
