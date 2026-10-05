# Data Dictionary

## fund_master
Contains master details of mutual funds.

| Column | Description |
|--------|-------------|
| amfi_code | Unique AMFI code |
| fund_name | Name of the mutual fund |
| category | Fund category |
| fund_house | AMC/Fund house |

## nav_history

| Column | Description |
|--------|-------------|
| amfi_code | Fund identifier |
| date | NAV date |
| nav | Net Asset Value |

## investor_transactions

| Column | Description |
|--------|-------------|
| transaction_date | Transaction date |
| transaction_type | SIP / Lumpsum / Redemption |
| amount | Transaction amount |

## scheme_performance

| Column | Description |
|--------|-------------|
| expense_ratio | Expense ratio of the scheme |