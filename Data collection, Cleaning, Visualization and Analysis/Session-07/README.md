# Session 07 – Data Cleaning (Part 2: Outliers & Data Types)

## Topics Covered
- Outlier detection using boxplots, IQR, and Z-score
- IQR capping, 5th–95th percentile clipping, and log transformation
- Data type conversion using `astype()`, `str.replace()`, and `pd.to_numeric()`
- Category, integer, and Boolean data types
- Mixed date parsing using `pd.to_datetime()`

## Files
- `bike_outliers.ipynb` – complete assignment notebook
- `outlier_report.csv` – IQR and Z-score outlier counts
- `outlier_treatment_summary.csv` – maximum and mean for original and treated columns
- `dtype_memory_report.csv` – before/after data types and memory usage
- `bike_listings_s7.csv` – final 400-row dataset with treated columns and parsed dates

## Input
The notebook reads `../Session-06/bike_listings_s6.csv`, created in Session 06.

## Reproducibility
- 400 listings; random seed 7
- 10 random prices multiplied by 6
- 6 random `km_driven` values set to 400,000
- 60% dates formatted as `DD/MM/YYYY`; remaining dates as `DD-Mon-YYYY`
- No rows are dropped during outlier treatment

## Verification
The final dataset retains 400 rows and has zero missing parsed dates.
