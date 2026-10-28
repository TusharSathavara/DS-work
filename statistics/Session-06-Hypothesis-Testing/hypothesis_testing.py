# Session 6: Hypothesis Testing (Basic)

from scipy import stats
import math


# Task 2: Two-sample t-test

# Group A: New Zomato homepage
mean_a = 350
n_a = 30
std_a = 50

# Group B: Old Zomato homepage
mean_b = 320
n_b = 30
std_b = 50

# Calculate t-statistic and p-value
standard_error = math.sqrt((std_a**2 / n_a) + (std_b**2 / n_b))
t_statistic = (mean_a - mean_b) / standard_error

degrees_of_freedom = n_a + n_b - 2

p_value = 2 * stats.t.sf(abs(t_statistic), degrees_of_freedom)

print("TASK 2: Zomato A/B Test")
print("T-statistic:", round(t_statistic, 4))
print("P-value:", round(p_value, 4))

alpha = 0.05

if p_value < alpha:
    print("Reject the null hypothesis.")
    print("The difference is statistically significant.")
else:
    print("Fail to reject the null hypothesis.")
    print("The difference is not statistically significant.")


# Task 4: Flipkart Add to Wishlist button

old_clicks = 480
new_clicks = 520
total_users = old_clicks + new_clicks

old_rate = old_clicks / total_users
new_rate = new_clicks / total_users

print("\nTASK 4: Flipkart Wishlist Button")
print("Old button clicks:", old_clicks)
print("New button clicks:", new_clicks)
print("Old click rate:", round(old_rate * 100, 2), "%")
print("New click rate:", round(new_rate * 100, 2), "%")

# Approximate two-proportion z-test
pooled_rate = (old_clicks + new_clicks) / (2 * total_users)

standard_error = math.sqrt(
    pooled_rate * (1 - pooled_rate) *
    (1 / total_users + 1 / total_users)
)

z_statistic = (new_rate - old_rate) / standard_error

p_value_button = 2 * stats.norm.sf(abs(z_statistic))

print("Z-statistic:", round(z_statistic, 4))
print("P-value:", round(p_value_button, 4))

if p_value_button < alpha:
    print("The difference is statistically significant.")
else:
    print("The difference may be due to chance.")
