# Session 05: Data Collection Using Pandas (Part 2)
## Database Extraction, JSON Normalization, Web Loading and Relational Merging

**Module:** Data Collection, Cleaning, Visualization and Analysis  
**Session:** 05  
**Project:** College Cultural & Technical Fest Management System  
**Notebook:** `fest_collect.ipynb`  
**Status:** Completed  

---

## Topics Covered

- Reading data from relational databases using SQL
- SQLite database connection with `sqlite3.connect()`
- SQL queries with `pd.read_sql()` vs `pd.read_sql_query()`
- Database constraints and parameterized simple queries (`SELECT ... WHERE`)
- Handling nested JSON API responses
- Normalizing hierarchical nested structures using `pd.json_normalize()`
- Web-based data extraction and reading directly from URLs (`raw.githubusercontent.com`)
- Splitting datasets and partitioned file storage
- File system and path operations with `pathlib.Path` (`mkdir()`, `glob()`)
- Batch dataset discovery and concatenation with `pd.concat()`
- Relational dataset merging with `pd.merge()`
- Merge integrity validation using `validate='m:1'`
- Verification through programmatic assertions

---

## Task Walkthrough & Implementation

### Task 1: SQLite Database Creation and SQL Querying

**Objective:**
Create a SQLite database `fest.db` and insert a 400-row `registrations` table containing student registrations for college fest events. Read back all paid registrations using SQL queries via Pandas.

**Data Generation Parameters:**
- `reg_id`: Registration IDs from 1 to 400 (`np.arange(1, 401)`)
- `student_id`: Alphanumeric student identifiers `S001` to `S400`
- `event`: Five fest events (`Dance`, `Coding`, `Quiz`, `Gaming`, `Music`)
- `college`: Six realistic invented institution names
- `ticket_inr`: Ticket prices ranging from 0 to 500 in steps of 50
- `paid`: Payment status (`Yes` / `No`)
- Reproducibility seed: `np.random.seed(42)`

**Implementation & Verification:**
- Created SQLite database connection using `sqlite3.connect('fest.db')`.
- Wrote table to SQLite using `registrations.to_sql('registrations', conn, index=False, if_exists='replace')`.
- Executed query:
  ```sql
  SELECT * FROM registrations WHERE paid = 'Yes'
  ```
- Loaded results back into DataFrames using both `pd.read_sql_query()` and `pd.read_sql()`.
- Verified that both methods return matching shapes `(210, 6)`.

---

### Task 2: Nested JSON API Ingestion & Flattening

**Objective:**
Generate a nested API-style payload containing 15 fictional corporate sponsors, export to `sponsors_api.json`, and unpack nested keys into a flat tabular format.

**JSON Schema:**
```json
{
  "status": "ok",
  "data": [
    {
      "sponsor": "TechNova Solutions",
      "amount_inr": 150000,
      "contact": {
        "city": "Bengaluru",
        "tier": "Platinum"
      }
    }
  ]
}
```

**Implementation & Verification:**
- Dumped 15 sponsors with contact hierarchy using `json.dump()`.
- Ingested the JSON payload back into memory using `json.load()`.
- Flattened the nested `data` field using `pd.json_normalize(loaded_data["data"])`.
- Validated column names, confirming the presence of nested attributes:
  - `sponsor`
  - `amount_inr`
  - `contact.city`
  - `contact.tier`

---

### Task 3: Event Metadata & Direct Web Loading

**Objective:**
Create an events metadata dataset `fest_events.csv` with 5 rows detailing event logistics, host it on GitHub, and ingest it into Pandas directly from its web address.

**Event Logistics Table:**
| event | venue | day | budget_inr |
| :--- | :--- | :---: | :---: |
| Dance | Auditorium Stage A | 1 | 75000 |
| Coding | Computing Lab 1 | 1 | 50000 |
| Quiz | Seminar Hall B | 2 | 35000 |
| Gaming | Indoor Sports Complex | 2 | 60000 |
| Music | Open Air Amphitheatre | 3 | 90000 |

**Implementation & Verification:**
- Saved `fest_events.csv` with event venues, day scheduling (days 1 to 3), and budgets.
- Configured ingestion using `pd.read_csv()` from the public raw GitHub URL:
  ```python
  raw_url = "https://raw.githubusercontent.com/TusharSathavara/DS-work/main/Data%20collection,%20Cleaning,%20Visualization%20and%20Analysis/Session-05/fest_events.csv"
  events = pd.read_csv(raw_url)
  ```
- Verified the shape: `(5, 4)`.

---

### Task 4: Partitioned Storage, Glob Concatenation & Validated Merge

**Objective:**
Partition the 400 registrations into day-wise CSV files, dynamically discover and combine them using `pathlib.Path.glob()`, and perform a validated left merge with the event metadata.

**Partitioning:**
- Created directory `fest_data/` using `Path('fest_data').mkdir(exist_ok=True)`.
- Split `registrations` into three slices:
  - `day1.csv`: 130 rows (index 0 to 130)
  - `day2.csv`: 140 rows (index 130 to 270)
  - `day3.csv`: 130 rows (index 270 to 400)
- Total partitioned rows: 130 + 140 + 130 = 400 rows.

**Recombination & Relational Merge:**
- Discovered day files using `sorted(Path('fest_data').glob('day*.csv'))`.
- Concatenated all partitions into a single DataFrame using `pd.concat(..., ignore_index=True)`.
- Performed relational merge with `events` on key column `event`:
  ```python
  fest_master = combined_registrations.merge(
      events,
      on="event",
      how="left",
      validate="m:1"
  )
  ```
- Exported combined master dataset to `fest_master.csv`.

**Integrity Assertions:**
- Verified total master row count: `assert len(fest_master) == 400`.
- Verified 100% venue completeness: `assert fest_master['venue'].isna().sum() == 0`.
- Both assertions passed without errors.

---

## Key Learnings

- Relational databases can be queried seamlessly using Pandas with either `pd.read_sql_query()` (for SQL queries) or `pd.read_sql()` (which accepts either a table name or query).
- Deeply nested JSON APIs can be parsed and flattened into tabular DataFrames using `pd.json_normalize()`, producing clean dot-notation column names (`parent.child`).
- DataFrames can be loaded directly from remote web URLs (`raw.githubusercontent.com`), enabling reproducible and cloud-accessible data pipelines.
- Modern file system manipulation is best handled with `pathlib.Path`, making partition folder creation and pattern-based discovery (`glob`) cross-platform and concise.
- Batch reading partitioned files via `glob()` followed by `pd.concat()` is the standard pattern for ingesting distributed datasets.
- Relational integrity should be verified during merges using the `validate` argument (`m:1` ensures the right DataFrame contains unique lookup keys), coupled with defensive assertions on row counts and null values.

---

## Files in This Directory

```text
Session-05/
├── README.md
├── fest_collect.ipynb
├── fest.db
├── sponsors_api.json
├── fest_events.csv
├── fest_master.csv
└── fest_data/
    ├── day1.csv
    ├── day2.csv
    └── day3.csv
```

All dataset files, partitions, databases, and master tables are generated automatically by running `fest_collect.ipynb`.

---

## Requirements

```bash
pip install numpy pandas requests
```

---

## How to Run

1. Open `fest_collect.ipynb` using Jupyter Notebook, JupyterLab, or VS Code.
2. Select the Python kernel.
3. Select **Restart & Run All** to run all cells from top to bottom.
4. Verify that all datasets, database entries, partitions, and assertions execute cleanly.

