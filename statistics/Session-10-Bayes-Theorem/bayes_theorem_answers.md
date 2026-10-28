# Session 10 - Bayes Theorem (Basic)

## Task 1: Bayes Theorem Function

Bayes theorem calculates the probability of an event using prior probability, likelihood, and evidence.

Formula:

P(A | B) = P(B | A) × P(A) / P(B)

Example:

- Prior probability = 0.30
- Likelihood = 0.80
- Evidence = 0.50

Posterior probability = (0.30 × 0.80) / 0.50 = 0.48

Therefore, the posterior probability is 48%.

## Task 2: Swiggy Premium Restaurants

Given:

- Probability of a restaurant being premium = 10%
- Probability of a discount for a premium restaurant = 80%
- Probability of a discount for a regular restaurant = 20%

Total probability of a discount:

P(Discount) = (0.10 × 0.80) + (0.90 × 0.20)

P(Discount) = 0.08 + 0.18 = 0.26

Using Bayes theorem:

P(Premium | Discount) = (0.10 × 0.80) / 0.26

Result = 0.3077, approximately 30.77%.

Therefore, when a discount is observed, the probability that the restaurant is premium is approximately 30.77%.

## Task 3: Spam Detection

A sample of 20 email subjects is used. Some contain the word "free" and are labelled as spam, while others are non-spam.

The program calculates:

- Prior probability of spam
- Probability of the word "free" appearing in spam emails
- Overall probability of the word "free"
- Probability that an email is spam given that it contains "free"

The example dataset contains 10 spam emails. All 10 contain "free", and no non-spam email contains that word.

Therefore, for this particular dataset:

P(Spam | Free) = 100%

This is only a demonstration using a small, artificial dataset. Real spam detection requires a larger and more representative dataset.

## Task 4: Flipkart Recommendation Example

Prompt used:

"Create a Bayes theorem example for Flipkart: 40% of users buy phones, 60% of phone buyers buy a case, and 15% of other users buy a case."

Given:

- P(Phone) = 0.40
- P(Case | Phone) = 0.60
- P(Case | No Phone) = 0.15

Total probability of buying a case:

P(Case) = (0.40 × 0.60) + (0.60 × 0.15)

P(Case) = 0.24 + 0.09 = 0.33

Using Bayes theorem:

P(Phone | Case) = (0.40 × 0.60) / 0.33

Result = 0.7273, approximately 72.73%.

An app could use this probability to improve product recommendations. These values are illustrative, not actual Flipkart statistics.
