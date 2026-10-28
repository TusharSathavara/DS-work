# Session 10: Bayes Theorem (Basic)

# Task 1: Bayes Theorem Function

def bayes_posterior(prior, likelihood, evidence):
    if evidence <= 0:
        return 0

    return (prior * likelihood) / evidence


posterior = bayes_posterior(
    prior=0.30,
    likelihood=0.80,
    evidence=0.50
)

print("TASK 1: Bayes Theorem")
print("Posterior Probability:", round(posterior, 4))


# Task 2: Probability that a Swiggy restaurant is Premium

# Prior probability of a premium restaurant = 10%
prior_premium = 0.10

# Probability of discount given premium = 80%
likelihood_discount_premium = 0.80

# Probability of discount given regular = 20%
likelihood_discount_regular = 0.20

# Total probability of observing a discount
probability_discount = (
    prior_premium * likelihood_discount_premium
    + (1 - prior_premium) * likelihood_discount_regular
)

premium_given_discount = bayes_posterior(
    prior_premium,
    likelihood_discount_premium,
    probability_discount
)

print("\nTASK 2: Swiggy Premium Restaurant")
print(
    "Probability of Premium Given Discount:",
    round(premium_given_discount, 4)
)
print("Percentage:", round(premium_given_discount * 100, 2), "%")


# Task 3: Basic Spam Detection

emails = [
    ("free iPhone offer", True),
    ("claim your free gift", True),
    ("free cash prize", True),
    ("meeting tomorrow", False),
    ("project report update", False),
    ("lunch at 1 PM", False),
    ("free vacation prize", True),
    ("weekly team meeting", False),
    ("free shopping voucher", True),
    ("your appointment reminder", False),
    ("free bonus available", True),
    ("homework submission", False),
    ("free lottery reward", True),
    ("schedule for tomorrow", False),
    ("free discount coupon", True),
    ("important office update", False),
    ("free money now", True),
    ("family dinner plan", False),
    ("free winner reward", True),
    ("class notes attached", False)
]

total_emails = len(emails)
spam_emails = sum(1 for subject, is_spam in emails if is_spam)
non_spam_emails = total_emails - spam_emails

free_spam_emails = sum(
    1 for subject, is_spam in emails
    if "free" in subject.lower() and is_spam
)

free_non_spam_emails = sum(
    1 for subject, is_spam in emails
    if "free" in subject.lower() and not is_spam
)

free_emails = free_spam_emails + free_non_spam_emails

prior_spam = spam_emails / total_emails
likelihood_free_given_spam = free_spam_emails / spam_emails
probability_free = free_emails / total_emails

spam_given_free = bayes_posterior(
    prior_spam,
    likelihood_free_given_spam,
    probability_free
)

print("\nTASK 3: Spam Detection")
print("Total Emails:", total_emails)
print("Spam Emails:", spam_emails)
print("Emails Containing 'free':", free_emails)
print("P(Spam | Free):", round(spam_given_free, 4))
print("Percentage:", round(spam_given_free * 100, 2), "%")


# Task 4: Real-World Example — Flipkart Recommendations

# Example:
# 40% of users buy a phone.
# 60% of phone buyers also buy a phone case.
# 15% of non-phone buyers buy a phone case.

prior_phone = 0.40
likelihood_case_given_phone = 0.60
likelihood_case_given_no_phone = 0.15

probability_case = (
    prior_phone * likelihood_case_given_phone
    + (1 - prior_phone) * likelihood_case_given_no_phone
)

phone_given_case = bayes_posterior(
    prior_phone,
    likelihood_case_given_phone,
    probability_case
)

print("\nTASK 4: Flipkart Recommendation Example")
print("Prompt Used:")
print(
    "Create a Bayes theorem example for Flipkart: "
    "40% of users buy phones, 60% of phone buyers buy "
    "a case, and 15% of other users buy a case."
)
print(
    "Probability of Phone Purchase Given Case Purchase:",
    round(phone_given_case, 4)
)
print("Percentage:", round(phone_given_case * 100, 2), "%")
