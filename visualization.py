import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

DATA_PATH = Path("data/raw")
OUTPUT_PATH = Path("reports")

OUTPUT_PATH.mkdir(exist_ok=True)

for file in DATA_PATH.glob("*.csv"):

    df = pd.read_csv(file)

    numeric_columns = df.select_dtypes(include="number").columns

    for column in numeric_columns:

        plt.figure(figsize=(8,5))
        df[column].hist(bins=20)

        plt.title(f"{column} Distribution")
        plt.xlabel(column)
        plt.ylabel("Frequency")

        plt.tight_layout()

        plt.savefig(OUTPUT_PATH / f"{file.stem}_{column}.png")

        plt.close()

print("✅ All charts saved successfully!")