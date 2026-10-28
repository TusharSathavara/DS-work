# SESSION 1 - Introduction to Statistics in Data Science

## Task 1: Daily App Actions and Types of Data

| No. | App | Daily Action | Data Generated | Data Type |
|---:|---|---|---|---|
| 1 | Instagram | Liking a post | Number of likes | Numerical |
| 2 | Instagram | Selecting a post category or topic | Category/topic name | Categorical |
| 3 | Zomato | Giving a restaurant a rating | Rating score (for example, 4 out of 5) | Numerical |
| 4 | Flipkart | Searching for a product | Product name or category | Categorical |
| 5 | Flipkart | Checking the product price | Price in rupees | Numerical |

**Explanation:** Numerical data represents numbers or measurable quantities, such as prices and counts. Categorical data represents labels or groups, such as product names, food types, or topics.

## Task 2: Classifying Music-App Data

Sample data: `['Pop', 'Rock', 'Jazz', 'Hip-Hop', 'Pop', 'Rock', 'Jazz', 'Pop']`

This is **categorical data**, because each value represents a music genre rather than a numerical measurement. The data is also **nominal**, a type of categorical data, because the genres have no natural order. We can count how often each genre appears, but the genre names themselves are not quantities.

## Task 3: Using Statistics to Improve an App Feature

**Feature: Restaurant ratings on Zomato**

Statistics can help users choose restaurants by summarizing ratings from many customers. For example, the app can calculate the average rating and show how many people rated each restaurant. It can also compare ratings across restaurants and identify places whose ratings have recently improved or declined. This helps users make more informed decisions.

## Task 4: Three Statistical Terms for a Playlist Recommendation Feature

1. **Mean (Average):** The mean can show the average number of times users listen to songs from a particular genre. For example, if a user listens to Pop songs 2, 4, and 6 times, the mean is `(2 + 4 + 6) / 3 = 4` listens.

2. **Mode:** The mode is the value that appears most often. If a user listens to Pop, Rock, Pop, and Jazz, the mode is Pop. A playlist system could recommend more Pop songs because that genre appears most frequently in the user's listening history.

3. **Variance:** Variance measures how spread out numerical values are from their mean. For example, it can help show whether a user's daily listening time is fairly consistent or changes a lot from day to day. This information could help the app personalize recommendations based on listening habits.

---

**Conclusion:** Statistics helps data scientists understand user behavior, summarize app activity, and make better recommendations. Numerical and categorical data both provide useful information for improving digital products.
