# Session 9: Normal Distribution

import numpy as np
import matplotlib.pyplot as plt
from scipy import stats

np.random.seed(42)


# Task 1: Generate 100 random numbers

data = np.random.normal(loc=50, scale=10, size=100)

print("TASK 1: Normal Distribution")
print("Mean:", round(np.mean(data), 2))
print("Standard Deviation:", round(np.std(data), 2))

plt.hist(data, bins=15, density=True, alpha=0.6, edgecolor="black")

x = np.linspace(min(data), max(data), 200)
y = stats.norm.pdf(x, loc=50, scale=10)

plt.plot(x, y)
plt.title("Normal Distribution (Mean=50, SD=10)")
plt.xlabel("Value")
plt.ylabel("Density")
plt.show()


# Task 2: Daily step counts

steps = [
    5000, 6200, 7000, 6500, 8000,
    7500, 6800, 7200, 6000, 7100,
    6900, 7300, 6400, 7600, 7000,
    6700, 7400, 6600, 7100, 7200
]

mean_steps = np.mean(steps)
median_steps = np.median(steps)
mode_steps = stats.mode(steps, keepdims=False).mode

print("\nTASK 2: Daily Step Counts")
print("Mean:", round(mean_steps, 2))
print("Median:", round(median_steps, 2))
print("Mode:", mode_steps)

print("Mean, median, and mode are not exactly equal.")
print("They may be close in a roughly symmetrical distribution.")


# Task 3: Simulate scores of 200 online game players

scores = np.random.normal(loc=70, scale=15, size=200)

lower_limit = 70 - 15
upper_limit = 70 + 15

within_one_sd = np.sum(
    (scores >= lower_limit) & (scores <= upper_limit)
)

percentage = (within_one_sd / len(scores)) * 100

print("\nTASK 3: Online Game Scores")
print("Total Players:", len(scores))
print("Scores between 55 and 85:", within_one_sd)
print("Percentage within one SD:", round(percentage, 2), "%")
print("Expected percentage is approximately 68%.")


# Task 4: Real-world example

delivery_times = np.random.normal(loc=30, scale=8, size=1000)

print("\nTASK 4: Delivery Times")
print("Mean Delivery Time:", round(np.mean(delivery_times), 2))
print("Standard Deviation:", round(np.std(delivery_times), 2))

plt.hist(delivery_times, bins=20, edgecolor="black")
plt.title("Simulated Food Delivery Times")
plt.xlabel("Delivery Time (minutes)")
plt.ylabel("Frequency")
plt.show()
