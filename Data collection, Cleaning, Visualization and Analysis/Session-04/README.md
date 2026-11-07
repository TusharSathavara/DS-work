# Session 04: Data Collection Using Pandas
## Part 1: Importing and Handling Different Data Formats

**Module:** Data Collection, Cleaning, Visualization and Analysis  
**Session:** 04  
**Project:** Fictional Housing Society Electricity Readings  
**Notebook:** `society_collect.ipynb`

---

## Topics Covered

- Introduction to Pandas
- CSV, Excel, TSV and JSON files
- Importing datasets using `pd.read_csv()`, `pd.read_excel()` and `pd.read_json()`
- Handling different separators
- Reading large files using chunksize
- Iterating through file chunks
- Detecting missing values and data issues
- `df.info()` and `df.describe(include='all')`

---

## Task 1: Detecting Data Quality Issues

Created `readings_messy.csv` from electricity readings by:
- Making 5% of `units_kwh` values missing.
- Converting `amount_inr` values into text such as `Rs 1234.50`.
- Mixing uppercase and lowercase values in the `paid` column.

Loaded the file and inspected it using `df.info()` and `df.describe(include='all')`.

Created `issue_report.csv` containing:
- Column name
- Data type
- Missing value count
- Unique value count

**Important:** This task detects data issues without fixing them.

---

## Task 2: Generating Electricity Reading Datasets

Generated 1,200 monthly electricity readings for 50 flats across 12 months (January–December 2025).

The generated data contains:
- `flat_id`: A-01 to D-25
- `month`: 2025-01 to 2025-12
- `units_kwh`: Random values between 60 and 420
- `amount_inr`: Units multiplied by ₹7.50
- `paid`: 90% Yes and 10% No

Saved the dataset in five formats:

1. `readings_comma.csv`
2. `readings_semicolon.csv`
3. `readings_tab.tsv`
4. `readings.xlsx`
5. `readings.json`

---

## Task 3: Importing and Comparing Files

Loaded all five files back into Pandas DataFrames using the appropriate reading functions.

Compared:
- File name
- DataFrame shape
- Total `units_kwh`

Verified whether all five formats contain matching data totals.

---

## Task 4: Reading Large Files in Chunks

Generated `meter_big.csv` containing 60,000 hourly meter readings.

Used `pd.read_csv(chunksize=10000)` to read the file in six chunks without loading the complete file into memory.

Calculated:
- Total number of rows
- Total kWh consumption
- Number of chunks processed

Compared the chunk-based results against the original generated DataFrame.

---

## Key Learnings

- Pandas supports multiple data formats.
- Different separators can be handled using the `sep` parameter.
- Missing values and inconsistent data types can be detected using Pandas.
- `df.info()` and `df.describe(include='all')` help inspect datasets.
- Chunk-based reading is useful for large CSV files.
- Data consistency can be checked by comparing shapes and aggregate totals.

---

## Files in This Directory

```text
s04_society_collect/
├── README.md
├── society_collect.ipynb
├── readings_messy.csv
├── issue_report.csv
├── readings_comma.csv
├── readings_semicolon.csv
├── readings_tab.tsv
├── readings.xlsx
├── readings.json
└── meter_big.csv
```

The dataset files are generated automatically by running the notebook.

## Requirements

```bash
pip install numpy pandas openpyxl
```

`openpyxl` is required for Excel file operations.

## How to Run

1. Open `society_collect.ipynb` using Jupyter Notebook or VS Code.
2. Install the required libraries if necessary.
3. Select **Restart & Run All**.
4. Verify that all output files are generated successfully.
5. Upload the notebook and generated datasets to GitHub.
