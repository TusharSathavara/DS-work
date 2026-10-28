# Session 4: Skewness (Basic)

import statistics
import matplotlib.pyplot as plt


# Task 1: Swiggy daily order counts

daily_orders = [12, 15, 17, 14, 13, 16, 200, 18, 14, 15]

mean_orders = statistics.mean(daily_orders)
median_orders = statistics.median(daily_orders)

print("TASK 1: Swiggy Daily Orders")
print("Mean:", round(mean_orders, 2))
print("Median:", median_orders)

if mean_orders > median_orders:
    print("Distribution is Right-Skewed.")
elif mean_orders < median_orders:
    print("Distribution is Left-Skewed.")
else:
    print("Distribution may be Symmetrical.")

plt.figure(figsize=(8, 4))
plt.plot(range(1, len(daily_orders) + 1), daily_orders, marker="o")
plt.title("Swiggy Daily Orders Over 10 Days")
plt.xlabel("Day")
plt.ylabel("Number of Orders")
plt.grid(True)
plt.show()


# Task 2: Instagram influencer followers (in thousands)

followers = [5, 7, 8, 8, 9, 10, 12, 15, 95]

mean_followers = statistics.mean(followers)
median_followers = statistics.median(followers)

print("\nTASK 2: Instagram Followers")
print("Mean:", round(mean_followers, 2), "thousand")
print("Median:", median_followers, "thousand")

if mean_followers > median_followers:
    print("The data is Right-Skewed.")
elif mean_followers < median_followers:
    print("The data is Left-Skewed.")
else:
    print("The data may be Symmetrical.")


# Task 3: Real-world example of right-skewed data

youtube_views = [100, 150, 200, 250, 300, 500, 1000, 10000]

print("\nTASK 3: YouTube Video Views")
print("Video views:", youtube_views)
print("Explanation: Most videos have fewer views, while a few videos")
print("have very high views, creating a long tail on the right.")
print("Therefore, the data is Right-Skewed.")


# Task 4: Flipkart product ratings

ratings = [3, 3, 4, 4, 4, 5, 5, 5, 5, 5]

print("\nTASK 4: Flipkart Product Ratings")
print("Ratings:", ratings)

plt.figure(figsize=(7, 4))
plt.hist(
    ratings,
    bins=[2.5, 3.5, 4.5, 5.5],
    edgecolor="black"
)
plt.title("Flipkart Product Ratings Distribution")
plt.xlabel("Rating")
plt.ylabel("Frequency")
plt.xticks([3, 4, 5])
plt.grid(axis="y")
plt.show()

print("Explanation: Most ratings are 5, with fewer lower ratings.")
print("The distribution is Left-Skewed.")
