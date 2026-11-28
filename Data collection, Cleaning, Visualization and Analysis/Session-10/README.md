# Session 10 – Data Visualization: Matplotlib (Part 1)

## Topics Covered
- Matplotlib line plots, scatter plots, bar charts, and histograms
- Figure and axes concepts
- Titles, axis labels, legends, colors, and alpha
- Saving charts as PNG files

## Files
- `auto_trips.ipynb` – complete assignment notebook
- `auto_trips.csv` – 600 fictional auto-rickshaw trips
- `daily_fare_line.png` – daily total fare line plot
- `fare_vs_distance.png` – distance vs fare scatter plot
- `trips_per_area.png` – trips per area bar chart
- `fare_hist.png` – fare histogram with mean line
- `visualization_verification.csv` – key validation results

## Dataset Details
- Random seed: 42
- 600 trips
- Date period: 01 April 2025 to 30 April 2025
- Areas: Navrangpura, Maninagar, Satellite, Vastrapur, Paldi
- Distance: 1 to 15 km
- Fare formula: `30 + 14 * distance_km + noise`
- Noise range: -15 to +25

## Final Verification
- 600 unique trip IDs
- All four chart images saved
- Scatter plot separates trips up to 5 km and trips over 5 km
- Histogram includes a dashed mean-fare line and legend
