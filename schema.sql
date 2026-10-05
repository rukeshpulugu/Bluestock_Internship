CREATE DATABASE IF NOT EXISTS bluestock_mf;
USE bluestock_mf;
CREATE TABLE fund_master (
    fund_id INT AUTO_INCREMENT PRIMARY KEY,
    amfi_code INT,
    fund_name VARCHAR(255),
    category VARCHAR(100),
    fund_house VARCHAR(150)
);
SHOW TABLES;
DROP TABLE IF EXISTS fund_master;
CREATE TABLE fund_master (
    amfi_code INT PRIMARY KEY,
    fund_name VARCHAR(255),
    category VARCHAR(150),
    fund_house VARCHAR(255)
);
CREATE TABLE nav_history (
    nav_id INT AUTO_INCREMENT PRIMARY KEY,
    amfi_code INT,
    date DATE,
    nav DECIMAL(10,4),

    FOREIGN KEY (amfi_code)
    REFERENCES fund_master(amfi_code)
);
CREATE TABLE aum_by_fund_house (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fund_house VARCHAR(255),
    aum DECIMAL(18,2)
);
SHOW TABLES;
CREATE TABLE monthly_sip_inflows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    month DATE,
    sip_amount DECIMAL(18,2)
);
CREATE TABLE category_inflows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(200),
    inflow DECIMAL(18,2)
);
CREATE TABLE industry_folio_count (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(200),
    folio_count BIGINT
);
CREATE TABLE scheme_performance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amfi_code INT,
    expense_ratio DECIMAL(5,2),
    FOREIGN KEY (amfi_code) REFERENCES fund_master(amfi_code)
);
CREATE TABLE investor_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    amfi_code INT,
    transaction_date DATE,
    transaction_type VARCHAR(50),
    amount DECIMAL(18,2),
    FOREIGN KEY (amfi_code) REFERENCES fund_master(amfi_code)
);
CREATE TABLE portfolio_holdings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amfi_code INT,
    holding_name VARCHAR(255),
    holding_percent DECIMAL(5,2),
    FOREIGN KEY (amfi_code) REFERENCES fund_master(amfi_code)
);
CREATE TABLE benchmark_indices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    benchmark_name VARCHAR(255),
    index_value DECIMAL(18,2),
    date DATE
);
SHOW TABLES;
