# Session 02: NumPy Intermediate
## Part 2: Indexing, Slicing & Broadcasting

**Module:** Data Collection, Cleaning, Visualization and Analysis  
**Session:** 02  
**Project:** Kirana Store Tracker  
**Status:** Completed

---

## Topics Covered

- Indexing in 1D, 2D and nD arrays
- Slicing arrays
- Selecting rows and columns
- Boolean indexing
- Fancy indexing
- Broadcasting rules
- Scalar-to-array broadcasting
- Array-to-array broadcasting
- Masking negative values
- Broadcasting for feature scaling

---

## Task Walkthrough & Implementation

### Task 1: Boolean Masking and Fancy Indexing

**Problem Statement:**

Build a boolean mask using `units_sold > 40`, count and display matching values, and use fancy indexing with `[0, 3, 5]` to select rice, tea and dal rows.

Calculate `stock_change = units_sold - 30`. Use a boolean mask on a copy to replace negative values with zero and count how many values changed.

**Implementation:**

```python
# Boolean masking
high_mask = units_sold > 40

print("High Sales Mask:")
print(high_mask)

print("\nCount of True Values:", np.count_nonzero(high_mask))
print("\nMatching Values:", units_sold[high_mask])

# Fancy indexing: Rice, Tea and Dal
top_items = units_sold[[0, 3, 5]]

print("\nRice, Tea and Dal Sales:")
print(top_items)

# Stock change calculation
stock_change = units_sold - 30

# Work on a copy to preserve the original array
stock_change_clean = stock_change.copy()

negative_mask = stock_change_clean < 0
changed_count = np.count_nonzero(negative_mask)

stock_change_clean[negative_mask] = 0

print("\nOriginal Stock Change:")
print(stock_change)

print("\nCleaned Stock Change:")
print(stock_change_clean)

print("\nValues Changed:", changed_count)
```

**Key Learning:**

- Boolean indexing selects elements based on conditions.
- Fancy indexing selects specific rows or elements using index positions.
- `.copy()` creates an independent array before editing.
- `np.count_nonzero()` counts values that satisfy a condition.

---

### Task 2: Broadcasting and Revenue Calculation

**Problem Statement:**

Create `price_col` as a `(6, 1)` array using the prices 52, 44, 45, 380, 140 and 120.

Calculate revenue using array-to-array broadcasting, calculate GST using scalar broadcasting, and calculate weekend revenue using a day factor.

Verify that row 1 of `revenue_inr` equals `units_sold[1] * 44` using `np.array_equal()`.

**Implementation:**

```python
# Create price column
price_col = np.array([
    [52],
    [44],
    [45],
    [380],
    [140],
    [120]
])

print("Price Column Shape:", price_col.shape)
print("Units Sold Shape:", units_sold.shape)

# Array-to-array broadcasting
revenue_inr = units_sold * price_col

print("\nRevenue in INR:")
print(revenue_inr)

# Scalar broadcasting: Add 5% GST
revenue_gst = revenue_inr * 1.05

print("\nRevenue Including GST:")
print(revenue_gst)

# Weekend revenue calculation
day_factor = np.array([[1, 1, 1, 1, 1, 1.3, 1.4]])

weekend_revenue = revenue_inr * day_factor

print("\nWeekend Revenue:")
print(weekend_revenue)

# Verify broadcasting result
expected_revenue = units_sold[1] * 44

print("\nRow 1 Verification:")
print(np.array_equal(revenue_inr[1], expected_revenue))
```

**Key Learning:**

- Broadcasting allows arrays with compatible shapes to perform element-wise operations.
- A `(6, 1)` array can broadcast with a `(6, 7)` array.
- Scalar values can be applied to every array element.
- `np.array_equal()` checks whether two arrays contain exactly equal values.

---

### Task 3: Min-Max Scaling Using Broadcasting

**Problem Statement:**

Scale every row of `units_sold` into the range 0 to 1.

Subtract each row's minimum and divide by its range using `min(axis=1, keepdims=True)` and `max(axis=1, keepdims=True)`.

Confirm that every row has a minimum of 0 and maximum of 1 using `np.allclose()`.

**Implementation:**

```python
# Calculate row-wise minimum and maximum
row_min = units_sold.min(axis=1, keepdims=True)
row_max = units_sold.max(axis=1, keepdims=True)

# Min-Max scaling
units_scaled = (units_sold - row_min) / (row_max - row_min)

print("Original Units Sold:")
print(units_sold)

print("\nScaled Units Sold:")
print(units_scaled)

# Verify minimum and maximum of every row
scaled_min = units_scaled.min(axis=1)
scaled_max = units_scaled.max(axis=1)

print("\nRow-wise Minimum:", scaled_min)
print("Row-wise Maximum:", scaled_max)

print("\nAll row minimums are zero:",
      np.allclose(scaled_min, 0))

print("All row maximums are one:",
      np.allclose(scaled_max, 1))
```

**Key Learning:**

- `axis=1` performs calculations row-wise.
- `keepdims=True` preserves dimensions for broadcasting.
- Min-Max scaling transforms values into the 0 to 1 range.
- `np.allclose()` checks numerical equality within a tolerance.

---

### Task 4: Indexing, Slicing and nD Array Views

**Problem Statement:**

Regenerate `units_sold` using `np.random.seed(42)` and `np.random.randint(5, 60, size=(6, 7))`.

Create `month_units` using `np.random.randint(5, 60, size=(4, 6, 7))`.

Extract:

- `tea_week`: One row.
- `day3_sales`: One column.
- `staple_block`: First three items and last four days.
- `alt_days`: Every second day.
- `dal_last`: Using negative indexing.
- `w3_tea_d6`: Week 3, tea, day 6.

**Implementation:**

```python
# Generate reproducible sales data
np.random.seed(42)

# 6 items and 7 days
units_sold = np.random.randint(5, 60, size=(6, 7))

# 4 weeks, 6 items and 7 days
month_units = np.random.randint(5, 60, size=(4, 6, 7))

print("Units Sold Shape:", units_sold.shape)
print(units_sold)

print("\nMonthly Units Shape:", month_units.shape)
print(month_units)

# Extract tea sales for one week (week 3)
tea_week = month_units[2, 3, :]

# Extract day 3 sales for all items
day3_sales = units_sold[:, 2]

# First three items and last four days
staple_block = units_sold[:3, -4:]

# Every second day
alt_days = units_sold[:, ::2]

# Last item (Dal), last day using negative indexing
dal_last = units_sold[-1, -1]

# Week 3, Tea, Day 6
w3_tea_d6 = month_units[2, 3, 5]

print("\nTea Week (Week 3):")
print(tea_week)

print("\nDay 3 Sales:")
print(day3_sales)

print("\nStaple Block:")
print(staple_block)

print("\nAlternate Days:")
print(alt_days)

print("\nDal Last Day Sales:")
print(dal_last)

print("\nWeek 3, Tea, Day 6 Sales:")
print(w3_tea_d6)
```

**Key Learning:**

- Slicing extracts selected portions of an array.
- Negative indexing accesses elements from the end.
- `::2` selects every second element.
- A 3D array can represent weeks, items and days.
- Basic NumPy slicing generally creates views rather than independent copies.

---

## Key Learnings

- Boolean indexing helps filter data using conditions.
- Fancy indexing helps select specific rows and columns.
- Broadcasting simplifies calculations between compatible arrays.
- Scalar broadcasting applies one value across an entire array.
- Min-Max scaling normalizes numerical data.
- Slicing and negative indexing make multidimensional data selection easier.
- `.copy()` should be used when an independent editable array is required.

---

## Files in this Directory

```text
s02_kirana_indexing/
├── README.md
└── kirana_indexing.ipynb
```

## How to Run

Open `kirana_indexing.ipynb` using Jupyter Notebook or VS Code.

Install NumPy if required:

```bash
pip install numpy
```

Run all notebook cells from top to bottom.

Finally, select **Restart & Run All** to verify that the notebook executes without errors.
