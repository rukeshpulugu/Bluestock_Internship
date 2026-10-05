import pandas as pd
from pathlib import Path

DATA_PATH = Path("data/raw")

for file in DATA_PATH.glob("*.csv"):
    print("=" * 70)
    print(f"EDA Report: {file.name}")

    df = pd.read_csv(file)

    print("\nShape")
    print(df.shape)

    print("\nColumns")
    print(df.columns.tolist())

    print("\nData Types")
    print(df.dtypes)

    print("\nMissing Values")
    print(df.isnull().sum())

    print("\nStatistical Summary")
    print(df.describe(include="all"))

    print("=" * 70)