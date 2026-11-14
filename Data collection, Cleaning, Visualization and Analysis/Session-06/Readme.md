# Session 06 – Data Cleaning (Part 1: Missing Values)

## Topics Covered
- Identifying missing values with `isnull()`, `notnull()`, and `isna()`
- Missing-value handling with `dropna()` and `fillna()`
- Mean, median, mode, forward fill, and backward fill
- Missingness mechanisms: MCAR, MAR, and MNAR
- Practical cleaning of a fictional Gujarat two-wheeler listings dataset

## Files
- `bike_cleaning.ipynb` – complete assignment notebook
- `bike_listings_raw.csv` – 400 raw two-wheeler listings with intentional missing values
- `missing_report.csv` – missing counts, percentages, and mechanisms by column
- `bike_listings_s6.csv` – cleaned dataset with missing values filled
- `cleaning_summary.csv` – row counts, column counts, and mean price comparison

## Dataset Details
- Brands: Veloce, Rajhans, Sundar, Tarang
- Cities: Ahmedabad, Surat, Vadodara, Rajkot
- Model years: 2008–2023
- Kilometres driven: 2,000–90,000
- Owner count: 1–3
- Price: ₹25,000–₹1,40,000
- Random seed: 42

## Verification
- Raw dataset: 400 rows
- `km_driven`: 32 missing values (8%)
- `owner_count`: missing for half of listings with model year below 2013
- `price_inr`: highest values missing using the 95th-percentile cut-off
- Cleaned dataset: 400 rows and zero missing values
