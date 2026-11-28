# Session 09 – Working with Date & Time Data

## Topics Covered
- Converting strings to datetime with `pd.to_datetime()`
- Extracting year, month, day, weekday, quarter, and hour
- Weekend and month-end flags
- Time-slot feature creation using `.loc`
- Daily, weekly, and month-end resampling
- UTC to Asia/Kolkata timezone conversion

## Files
- `upi_dates.ipynb` – complete assignment notebook
- `upi_raw.csv` – 3,000 generated transactions with text timestamps
- `upi_daily.csv` – daily transaction amount totals
- `upi_weekly.csv` – weekly transaction amount totals
- `upi_monthly.csv` – month-end transaction amount totals
- `upi_clean.csv` – final dataset with datetime features and IST timestamp
- `datetime_verification_report.csv` – key validation results

## Reproducibility
- Random seed: 42
- Date range: 01 January 2025 to 30 June 2025
- Transaction categories: Grocery, Fuel, Recharge, Food, Bills
- Amount range: ₹10 to ₹5,000

## Final Verification
- 3,000 rows in the raw and cleaned datasets
- Daily, weekly, and monthly grand totals match
- UTC to Asia/Kolkata offset is 5 hours 30 minutes
