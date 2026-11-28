# Session 08 – Data Cleaning (Part 3: Duplicates, Typos, Consistency)

## Topics Covered
- Detecting duplicates with `duplicated()` and `value_counts()`
- Removing exact duplicates with `drop_duplicates()`
- Keeping the latest relisted row per ID
- Fixing category case, whitespace, and spelling inconsistencies
- Fuzzy matching with `difflib.get_close_matches()`
- Standardizing Yes/No values into 1/0

## Files
- `bike_duplicates.ipynb` – complete assignment notebook
- `bike_listings_clean.csv` – final cleaned 400-row dataset
- `duplicate_report.csv` – row counts and unique listing IDs at each duplicate-removal stage
- `category_consistency_report.csv` – category counts before and after repair

## Input Dataset
The notebook loads `../Session-07/bike_listings_s7.csv`, created in Session 07.

## Reproducibility
- 25 exact duplicate rows are sampled with `random_state=42`
- 10 relisted rows are sampled with `random_state=7`; their `price_inr` is reduced by 5%
- `drop_duplicates()` reduces the dataset from 435 to 410 rows
- Keeping the last row per `listing_id` reduces it from 410 to 400 rows
- Random category inconsistencies and insurance values use NumPy seed 7

## Final Verification
- 400 rows
- 400 unique `listing_id` values
- Exactly 4 brands and 4 cities
- `is_insured` contains only 0 and 1
