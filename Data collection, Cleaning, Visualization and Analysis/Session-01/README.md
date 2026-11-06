# Session 01: NumPy Foundations (Part 1: Arrays & Creation)

**Module:** Data Collection, Cleaning, Visualization and Analysis  
**Session:** 01  
**Project:** Kirana Store Tracker  
**Status:** Completed

---

## Topics Covered

- Introduction to NumPy and its importance in Data Science
- Importing NumPy
- Creating NumPy arrays
- Array attributes: `shape`, `ndim`, `size`, `dtype`, `itemsize`, `nbytes`
- Python Lists vs NumPy Arrays
- Memory usage and execution time comparison
- Contiguous memory and array strides
- Creating reusable functions for array reports

---

## Task Walkthrough & Implementation

### Task 1: NumPy Installation, Import and Basic Arrays

**Problem Statement:**

Install NumPy, import it using the standard alias, create `units_sold` and `price_inr` arrays, and examine their attributes.

**Implementation:**

```python
import numpy as np

print("NumPy Version:", np.__version__)

units_sold = np.array([
    [12, 15, 18, 20, 14, 16, 22],
    [10, 13, 17, 19, 15, 18, 21],
    [20, 22, 25, 23, 19, 24, 26],
    [8, 10, 12, 14, 11, 13, 15],
    [16, 18, 20, 22, 17, 19, 21],
    [25, 28, 30, 27, 24, 26, 29]
])

price_inr = np.array([52, 44, 45, 380, 140, 120])

for name, arr in [("units_sold", units_sold), ("price_inr", price_inr)]:
    print(f"\n{name}")
    print("Array:", arr)
    print("Shape:", arr.shape)
    print("Dimensions:", arr.ndim)
    print("Size:", arr.size)
    print("Data Type:", arr.dtype)
    print("Item Size:", arr.itemsize)
    print("Memory (bytes):", arr.nbytes)
```

---

### Task 2: Kirana Store Tracker Arrays

**Problem Statement:**

Create the required NumPy tracker arrays for stock levels, returns, availability, item IDs, day marks and item pairs. Examine their data types, shapes and memory usage.

**Implementation:**

```python
stock_levels = np.array([120, 85, 200, 45, 90, 150])

returns = np.array([5, 2, 8, 1, 4, 6])

in_stock = np.array([True, True, True, False, True, True])

item_ids = np.array([101, 102, 103, 104, 105, 106])

day_marks = np.array([1, 2, 3, 4, 5, 6])

item_pairs = np.array([
    [101, 120],
    [102, 85],
    [103, 200],
    [104, 45],
    [105, 90],
    [106, 150]
])

tracker_arrays = {
    "stock_levels": stock_levels,
    "returns": returns,
    "in_stock": in_stock,
    "item_ids": item_ids,
    "day_marks": day_marks,
    "item_pairs": item_pairs
}

for name, arr in tracker_arrays.items():
    print(f"\n{name}")
    print("Array:", arr)
    print("Shape:", arr.shape)
    print("Data Type:", arr.dtype)
    print("Memory:", arr.nbytes, "bytes")
```

---

### Task 3: Python List vs NumPy Array Performance

**Problem Statement:**

Create a Python list and NumPy array containing one million elements. Compare their memory consumption and execution time. Also examine contiguous memory and array strides.

**Implementation:**

```python
import sys
import timeit

python_list = list(range(1_000_000))
numpy_array = np.arange(1_000_000)

# Memory comparison
list_memory = sys.getsizeof(python_list) + sum(
    sys.getsizeof(item) for item in python_list
)

array_memory = numpy_array.nbytes

print("Python List Memory:", list_memory, "bytes")
print("NumPy Array Memory:", array_memory, "bytes")

# Execution time comparison
list_time = timeit.timeit(
    "sum(python_list)",
    globals=globals(),
    number=10
)

array_time = timeit.timeit(
    "numpy_array.sum()",
    globals=globals(),
    number=10
)

print("\nPython List Time:", list_time)
print("NumPy Array Time:", array_time)

# Memory layout
print("\nC Contiguous:", numpy_array.flags["C_CONTIGUOUS"])
print("F Contiguous:", numpy_array.flags["F_CONTIGUOUS"])
print("Strides:", numpy_array.strides)
```

---

### Task 4: Reusable Array Report Function

**Problem Statement:**

Create an `array_report(name, arr)` function that displays the important attributes and memory information of each NumPy array created during the session.

**Implementation:**

```python
def array_report(name, arr):
    print(f"\n{'=' * 40}")
    print(f"Array Report: {name}")
    print(f"{'=' * 40}")

    print("Array:", arr)
    print("Shape:", arr.shape)
    print("Dimensions:", arr.ndim)
    print("Total Elements:", arr.size)
    print("Data Type:", arr.dtype)
    print("Item Size:", arr.itemsize, "bytes")
    print("Total Memory:", arr.nbytes, "bytes")
    print("Contiguous:", arr.flags["C_CONTIGUOUS"])
    print("Strides:", arr.strides)


all_arrays = {
    "units_sold": units_sold,
    "price_inr": price_inr,
    **tracker_arrays
}

for name, arr in all_arrays.items():
    array_report(name, arr)
```

---

## Key Learnings

- NumPy arrays provide efficient numerical operations.
- Array attributes help understand the structure and memory requirements.
- NumPy arrays generally use less memory than equivalent Python lists.
- Vectorized operations help improve numerical computation performance.
- Strides describe how NumPy accesses elements in memory.
- Reusable functions make array analysis easier.

---

## Files in this Directory

```text
Session-01/
├── README.md
└── kirana_numpy.ipynb
```

## How to Run

Open `kirana_numpy.ipynb` using Jupyter Notebook or VS Code.

Install NumPy if required:

```bash
pip install numpy
```

Run all notebook cells from top to bottom to reproduce the results.
