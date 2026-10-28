# Session 1: Introduction to Statistics in Data Science

# Task 1: Daily Actions and Types of Data

daily_actions = [
    ("Instagram", "Number of likes", 150, "Numerical"),
    ("Instagram", "Post category", "Travel", "Categorical"),
    ("Zomato", "Restaurant rating", 4.5, "Numerical"),
    ("Flipkart", "Product category", "Electronics", "Categorical"),
    ("Spotify", "Listening duration", 30, "Numerical")
]

print("TASK 1: Daily Actions and Types of Data")

for app, action, value, data_type in daily_actions:
    print(f"{app} - {action}: {value} ({data_type})")


# Task 2: Classifying Music Genres

music_genres = [
    "Pop", "Rock", "Jazz", "Hip-Hop",
    "Pop", "Rock", "Jazz", "Pop"
]

print("\nTASK 2: Music Genre Data")
print("Music genres:", music_genres)
print("Data type: Categorical Nominal")


# Task 3: Restaurant Ratings

restaurant_ratings = [4.0, 4.5, 5.0, 3.5, 4.0]

average_rating = sum(restaurant_ratings) / len(restaurant_ratings)

print("\nTASK 3: Zomato Restaurant Ratings")
print("Ratings:", restaurant_ratings)
print("Average rating:", round(average_rating, 2))
print("Number of ratings:", len(restaurant_ratings))


# Task 4: Statistical Terms for Playlist Recommendations

listening_minutes = [20, 30, 40]

mean_time = sum(listening_minutes) / len(listening_minutes)

sorted_times = sorted(listening_minutes)
median_time = sorted_times[len(sorted_times) // 2]

music_history = ["Pop", "Rock", "Pop", "Jazz", "Pop"]
mode_genre = max(set(music_history), key=music_history.count)

print("\nTASK 4: Playlist Statistics")
print("Listening times:", listening_minutes)
print("Mean listening time:", mean_time)
print("Median listening time:", median_time)
print("Most listened genre:", mode_genre)
