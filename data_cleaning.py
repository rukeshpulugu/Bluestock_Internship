import pandas as pd
from pathlib import Path

DATA_PATH = Path("data/raw")

for file in DATA_PATH.glob("*.csv"):
    print("=" * 70)
    print(f"Cleaning: {file.name}")

    df = pd.read_csv(file)

    print(f"Original Shape: {df.shape}")

    # Remove duplicate rows
    df = df.drop_duplicates()

    # Remove rows where all values are missing
    df = df.dropna(how="all")

    print(f"Cleaned Shape: {df.shape}")

    print("Missing Values:")
    print(df.isnull().sum())

    print("=" * 70)