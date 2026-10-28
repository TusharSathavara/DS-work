# SESSION 2 - Mean, Median & Mode

## Task 1: Calculate the Mean of Daily Spotify Song Plays

**File:** `playlist_stats.py`

```python
song_plays = [120, 135, 150, 200, 120, 90, 200]

mean_plays = sum(song_plays) / len(song_plays)

print("Mean number of plays:", mean_plays)
```

**Output:**
```text
Mean number of plays: 145.0
```

**Explanation:** The mean is calculated by adding all the play counts and dividing the total by the number of values. Here, the total is 1015 and there are 7 values, so the mean is 1015 / 7 = 145 plays.

## Task 2: Find the Median Zomato Delivery Time

```python
from statistics import median

delivery_times = [30, 25, 40, 35, 30, 45, 30]

median_time = median(delivery_times)

print("Median delivery time:", median_time, "minutes")
```

**Output:**
```text
Median delivery time: 30 minutes
```

**Explanation:** After sorting, the data is `[25, 30, 30, 30, 35, 40, 45]`. There are 7 values, so the middle (4th) value is 30 minutes.

## Task 3: Find the Most Common Flipkart Product Rating (Mode)

```python
from statistics import mode

ratings = [5, 4, 4, 3, 5, 4, 2, 4]

common_rating = mode(ratings)

print("Most common rating:", common_rating)
```

**Output:**
```text
Most common rating: 4
```

**Explanation:** The rating 4 appears four times, more often than any other rating. Therefore, the mode is 4.

## Task 4: Compare Mean, Median, and Mode for Three YouTube Channels

The following example uses three sample datasets. Channel C contains a very high view count (5000) to demonstrate the effect of an outlier.

```python
from statistics import mean, median, multimode

channel_a = [100, 120, 110, 105, 115]
channel_b = [80, 90, 85, 95, 100]
channel_c = [100, 120, 110, 105, 5000]

channels = {
    "Channel A": channel_a,
    "Channel B": channel_b,
    "Channel C (with outlier)": channel_c
}

for name, views in channels.items():
    print(name)
    print("Mean:", mean(views))
    print("Median:", median(views))
    print("Mode:", multimode(views))
    print()
```

**Comparison:**

| Channel | Mean | Median | Mode |
|---|---:|---:|---|
| Channel A | 110 | 110 | No mode |
| Channel B | 90 | 90 | No mode |
| Channel C (with outlier) | 1087 | 110 | No mode |

**Conclusion:** Channel C's unusually high value of 5000 increases its mean to 1087, while its median stays at 110. The median is less affected by extreme values, so it can better represent typical views when outliers are present. In these sample datasets, Channel C is the most affected by the outlier.

## Task 5: Use Pandas with a Real Dataset

For this task, we use the **Iris dataset** from the UCI Machine Learning Repository. The dataset includes numeric measurements of iris flowers. The code below loads it with pandas and calculates the mean, median, and mode of the sepal length column.

```python
import pandas as pd

url = "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

columns = [
    "sepal_length",
    "sepal_width",
    "petal_length",
    "petal_width",
    "species"
]

df = pd.read_csv(url, header=None, names=columns)

sepal_lengths = pd.to_numeric(df["sepal_length"], errors="coerce").dropna()

print("Mean sepal length:", sepal_lengths.mean())
print("Median sepal length:", sepal_lengths.median())
print("Mode of sepal length:", sepal_lengths.mode().tolist())
```

**Explanation:** Pandas loads the real dataset into a DataFrame. We select the numeric `sepal_length` column and calculate its mean, median, and mode. An internet connection is needed to load the dataset from the UCI website.

---

## Summary

- **Mean** is the average of the values.
- **Median** is the middle value after sorting the data.
- **Mode** is the most frequently occurring value.
- An **outlier** can pull the mean strongly, while the median is generally less affected.
- Pandas can calculate these statistics for numeric columns in real datasets.
