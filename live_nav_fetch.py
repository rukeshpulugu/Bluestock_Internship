import requests
import pandas as pd
import os

# HDFC Top 100 Direct - Example Scheme
url = "https://api.mfapi.in/mf/125497"

response = requests.get(url)

if response.status_code == 200:
    data = response.json()

    os.makedirs("data/raw", exist_ok=True)

    nav_data = pd.DataFrame(data["data"])
    nav_data.to_csv("data/raw/live_nav.csv", index=False)

    print("✅ Live NAV fetched successfully!")
    print(nav_data.head())

else:
    print("❌ Failed to fetch NAV data.")