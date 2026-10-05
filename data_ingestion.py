import pandas as pd
from pathlib import Path

DATA_PATH = Path("data/raw")

csv_files = sorted(DATA_PATH.glob("*.csv"))

print("=" * 60)
print("Mutual Fund Analytics - Data Ingestion")
print("=" * 60)

for file in csv_files:
    print(f"\nLoading: {file.name}")

    df = pd.read_csv(file)

    print("Shape :", df.shape)
    print("\nColumns & Data Types")
    print(df.dtypes)

    print("\nFirst 5 Rows")
    print(df.head())

    print("-" * 60)