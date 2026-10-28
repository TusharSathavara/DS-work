# Session 6 - Hypothesis Testing (Basic)

## Task 1: Null and Alternative Hypotheses

Scenario: People spend more time on Instagram than on YouTube daily.

- Null Hypothesis (H0): People spend equal or less time on Instagram than on YouTube on average.
- Alternative Hypothesis (H1): People spend more time on Instagram than on YouTube on average.

## Task 2: Zomato A/B Test

Group A (new homepage):
- Sample size: 30
- Average order value: ₹350
- Standard deviation: ₹50

Group B (old homepage):
- Sample size: 30
- Average order value: ₹320
- Standard deviation: ₹50

Using a two-sample t-test:

- T-statistic: Approximately 2.324
- P-value: Approximately 0.024

At a 0.05 significance level, the p-value is less than 0.05. Therefore, we reject the null hypothesis and conclude that the average order values are statistically significantly different.

## Task 3: A/B Test for a WhatsApp Feature

Feature: A redesigned dark mode setting.

- Control Group: Users see the existing dark mode setting.
- Variant Group: Users see the redesigned dark mode setting.
- Metric: Percentage of users who enable dark mode and continue using it.

Null Hypothesis (H0): The redesigned setting does not change the dark mode adoption rate.

Alternative Hypothesis (H1): The redesigned setting changes the dark mode adoption rate.

Users would be randomly assigned to the two groups. After collecting enough data, the adoption rates would be compared using a suitable statistical test.

## Task 4: Flipkart Add to Wishlist Button

- New button clicks: 520
- Old button clicks: 480
- Total users: 1000
- New button click rate: 52%
- Old button click rate: 48%

The observed difference is 4 percentage points. However, the difference alone does not prove that the new design is better.

A two-proportion test is needed to calculate the p-value. If the p-value is below 0.05, the difference is statistically significant; otherwise, we fail to reject the null hypothesis.

With 500 users in each group, the approximate p-value for 52% versus 48% is 0.571, so the difference is not statistically significant.
