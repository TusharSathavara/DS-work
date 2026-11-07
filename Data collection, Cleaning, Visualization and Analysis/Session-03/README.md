# Session 03: NumPy Advanced
## Part 3: Matrix Operations & Manipulation

**Module:** Data Collection, Cleaning, Visualization and Analysis  
**Session:** 03  
**Project:** Kirana Store Tracker  
**Status:** Completed

---

## Topics Covered

- Mathematical operations: Addition, subtraction, multiplication and division
- Element-wise vs matrix multiplication
- Matrix operations: `dot()`, `matmul()`, transpose
- Statistical functions: mean, median, standard deviation, variance and sum
- Linear algebra: determinant, inverse and eigenvalues
- Array manipulation: reshape, flatten and ravel
- Concatenation, stacking and splitting

---

## Task Walkthrough & Implementation

### Task 1: Brand Switching Matrix and Linear Algebra

**Problem Statement:**

Build a 3×3 brand-switching matrix for three tea brands. Calculate its determinant and inverse. Find the eigenvector corresponding to eigenvalue 1 and normalize it to calculate the steady-state market share.

**Implementation:**

```python
import numpy as np

switch_p = np.array([
    [0.7, 0.2, 0.1],
    [0.3, 0.5, 0.2],
    [0.2, 0.3, 0.5]
])

print("Brand Switching Matrix:")
print(switch_p)

# Determinant
print("\nDeterminant:")
print(np.linalg.det(switch_p))

# Inverse
print("\nInverse:")
print(np.linalg.inv(switch_p))

# Eigenvalues and eigenvectors of transpose
eigenvalues, eigenvectors = np.linalg.eig(switch_p.T)

# Find eigenvector corresponding to eigenvalue 1
index = np.argmin(np.abs(eigenvalues - 1))

steady_share = np.real(eigenvectors[:, index])

# Normalize eigenvector
steady_share = steady_share / steady_share.sum()

print("\nEigenvalues:")
print(eigenvalues)

print("\nSteady-State Market Share:")
print(steady_share)

print("\nVerification:")
print(np.allclose(switch_p.T @ steady_share, steady_share))
print("Total Market Share:", steady_share.sum())
```

**Key Learning:**

- `np.linalg.det()` calculates the determinant.
- `np.linalg.inv()` calculates the inverse.
- `np.linalg.eig()` calculates eigenvalues and eigenvectors.
- A normalized eigenvector represents the steady-state market share.

---

### Task 2: Array Manipulation and Memory Sharing

**Problem Statement:**

Generate a second week of sales data. Join two weeks using `np.concatenate()`, create a stacked array using `np.stack()`, and split the combined array back into the original weeks.

Compare `flatten()` and `ravel()` using `np.shares_memory()`.

**Implementation:**

```python
# Generate second week of sales
week1 = units_sold.copy()
week2 = np.random.randint(5, 60, size=(6, 7))

# Concatenate two weeks
two_weeks = np.concatenate((week1, week2), axis=1)

print("Two Weeks Shape:", two_weeks.shape)
print(two_weeks)

# Stack two weeks
stacked = np.stack((week1, week2), axis=0)

print("\nStacked Shape:", stacked.shape)
print(stacked)

# Split back into original weeks
split_weeks = np.split(two_weeks, 2, axis=1)

print("\nFirst Week Matches:",
      np.array_equal(split_weeks[0], week1))

print("Second Week Matches:",
      np.array_equal(split_weeks[1], week2))

# Flatten and ravel comparison
flat_array = two_weeks.flatten()
ravel_array = two_weeks.ravel()

print("\nFlatten Shape:", flat_array.shape)
print("Ravel Shape:", ravel_array.shape)

print("Flatten Shares Memory:",
      np.shares_memory(two_weeks, flat_array))

print("Ravel Shares Memory:",
      np.shares_memory(two_weeks, ravel_array))
```

**Key Learning:**

- `np.concatenate()` joins arrays along an existing axis.
- `np.stack()` joins arrays along a new axis.
- `np.split()` divides an array into multiple sections.
- `flatten()` returns a copy.
- `ravel()` returns a view whenever possible.

---

### Task 3: Daily Revenue and Item Co-Sales Matrix

**Problem Statement:**

Regenerate `units_sold` and `price_inr` using the same seed and values as Session 01.

Calculate daily revenue using three different methods:

1. `price_inr.dot(units_sold)`
2. `np.matmul(price_inr, units_sold)`
3. Element-wise multiplication followed by summation.

Verify that all three results match using `np.allclose()`. Build the item co-sales matrix using matrix multiplication.

**Implementation:**

```python
# Regenerate Session 01 data
np.random.seed(42)

units_sold = np.random.randint(5, 60, size=(6, 7))

price_inr = np.array([52, 44, 45, 380, 140, 120])

# Method 1: Dot product
daily_revenue_1 = price_inr.dot(units_sold)

# Method 2: Matrix multiplication
daily_revenue_2 = np.matmul(price_inr, units_sold)

# Method 3: Element-wise multiplication and sum
daily_revenue_3 = (
    units_sold * price_inr.reshape(6, 1)
).sum(axis=0)

print("Daily Revenue - Dot Product:")
print(daily_revenue_1)

print("\nDaily Revenue - Matmul:")
print(daily_revenue_2)

print("\nDaily Revenue - Element-wise:")
print(daily_revenue_3)

# Verify all methods
print("\nMethod 1 and 2 Match:",
      np.allclose(daily_revenue_1, daily_revenue_2))

print("Method 1 and 3 Match:",
      np.allclose(daily_revenue_1, daily_revenue_3))

print("Method 2 and 3 Match:",
      np.allclose(daily_revenue_2, daily_revenue_3))

# Item co-sales matrix
item_cosales = units_sold @ units_sold.T

print("\nItem Co-Sales Matrix:")
print(item_cosales)

print("\nCo-Sales Matrix Shape:", item_cosales.shape)
```

**Key Learning:**

- Dot product and matrix multiplication calculate daily revenue.
- Element-wise multiplication performs separate multiplication for each element.
- `np.allclose()` verifies numerical results.
- `@` performs matrix multiplication.
- The co-sales matrix shows relationships between item sales patterns.

---

### Task 4: Weekly Statistical Summary

**Problem Statement:**

Create a six-row weekly summary containing each item's total sales, mean, median, standard deviation and variance.

Use NumPy's `axis` argument and identify the day with the highest total units sold.

**Implementation:**

```python
# Item names
item_names = np.array([
    "Rice", "Atta", "Sugar", "Tea", "Oil", "Dal"
])

# Statistical calculations for each item
item_total = units_sold.sum(axis=1)
item_mean = units_sold.mean(axis=1)
item_median = np.median(units_sold, axis=1)
item_std = np.std(units_sold, axis=1, ddof=0)
item_variance = np.var(units_sold, axis=1)

# Create summary table using NumPy
weekly_summary = np.column_stack((
    item_names,
    item_total,
    item_mean,
    item_median,
    item_std,
    item_variance
))

print("Weekly Summary:")
print("Item | Total | Mean | Median | Std | Variance")
print(weekly_summary)

# Calculate daily totals
daily_totals = units_sold.sum(axis=0)

# Find highest sales day
highest_sales_day = np.argmax(daily_totals) + 1

print("\nDaily Total Units:")
print(daily_totals)

print("\nHighest Sales Day:", highest_sales_day)
print("Highest Daily Units:",
      daily_totals[highest_sales_day - 1])
```

**Key Learning:**

- `sum(axis=1)` calculates item-wise totals.
- `mean()` and `median()` calculate central tendency.
- `std()` and `var()` calculate standard deviation and variance.
- `np.argmax()` identifies the index of the highest value.
- NumPy can create summary tables without converting data into Pandas.

---

## Key Learnings

- Matrix operations are useful for mathematical and business calculations.
- Eigenvectors help understand long-term brand switching patterns.
- Array manipulation functions make it easier to combine and divide datasets.
- `flatten()` and `ravel()` differ in memory behaviour.
- Matrix multiplication can calculate daily revenue efficiently.
- Statistical functions help summarize weekly sales performance.
- NumPy supports data analysis without requiring Pandas.

---

## Files in this Directory

```text
s03_kirana_matrix/
├── README.md
└── kirana_matrix.ipynb
```

## How to Run

Open `kirana_matrix.ipynb` using Jupyter Notebook or VS Code.

Install NumPy if required:

```bash
pip install numpy
```

Run all notebook cells from top to bottom.

Finally, select **Restart & Run All** to verify that the notebook executes without errors.
