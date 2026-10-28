# Session 7: Correlation

import numpy as np
import matplotlib.pyplot as plt


# Task 1: Instagram Hours vs Daily Posts

instagram_hours = [1, 2, 3, 2, 4, 5, 3]
daily_posts = [1, 2, 3, 2, 4, 5, 3]

correlation_1 = np.corrcoef(instagram_hours, daily_posts)[0, 1]

print("TASK 1: Instagram Usage vs Posts")
print("Correlation Coefficient:", round(correlation_1, 2))
print("Relationship: Positive Correlation")

plt.scatter(instagram_hours, daily_posts)
plt.title("Instagram Hours vs Daily Posts")
plt.xlabel("Hours Spent on Instagram")
plt.ylabel("Number of Daily Posts")
plt.grid(True)
plt.show()


# Task 2: Zomato Orders vs Swiggy Orders

zomato_orders = [10, 15, 20, 25, 30, 35]
swiggy_orders = [12, 18, 19, 28, 32, 38]

correlation_2 = np.corrcoef(zomato_orders, swiggy_orders)[0, 1]

print("\nTASK 2: Zomato vs Swiggy Orders")
print("Correlation Coefficient:", round(correlation_2, 2))

if correlation_2 > 0:
    print("Positive Correlation")
elif correlation_2 < 0:
    print("Negative Correlation")
else:
    print("Zero Correlation")


# Task 3: YouTube Videos Watched vs Study Hours

youtube_videos = [1, 2, 3, 4, 5, 6]
study_hours = [1, 2, 2, 3, 4, 5]

correlation_3 = np.corrcoef(youtube_videos, study_hours)[0, 1]

print("\nTASK 3: Daily Life Correlation")
print("YouTube Videos:", youtube_videos)
print("Study Hours:", study_hours)
print("Correlation Coefficient:", round(correlation_3, 2))


# Task 4: Spotify Time vs Test Marks
# Example dataset with strong negative correlation

spotify_hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
test_marks = [98, 92, 90, 82, 78, 70, 65, 58, 50, 42]

correlation_4 = np.corrcoef(spotify_hours, test_marks)[0, 1]

print("\nTASK 4: Spotify Time vs Test Marks")
print("Spotify Hours:", spotify_hours)
print("Test Marks:", test_marks)
print("Correlation Coefficient:", round(correlation_4, 2))
print("Relationship: Strong Negative Correlation")

plt.scatter(spotify_hours, test_marks)
plt.title("Spotify Time vs Test Marks")
plt.xlabel("Time Spent on Spotify (Hours)")
plt.ylabel("Test Marks")
plt.grid(True)
plt.show()
