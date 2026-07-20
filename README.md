# 📊 Accounts Receivable & Payment Collection Analysis

## Overview

This project presents an end-to-end Finance Analytics solution focused on analyzing the Accounts Receivable (AR) process. The objective is to evaluate customer payment behavior, monitor outstanding invoices, assess credit exposure, and provide actionable insights to improve cash flow and collection efficiency.

The project follows a complete analytics workflow, including data cleaning, SQL analysis, exploratory data analysis (EDA), interactive Power BI dashboards, and executive business recommendations.

---

## Business Problem

Delayed customer payments and outstanding invoices can negatively impact an organization's cash flow and working capital. Finance teams require timely insights into customer payment behavior, overdue invoices, and credit risk to improve collection strategies and reduce financial exposure.

This project addresses these challenges by answering key business questions such as:

- Which customers consistently pay late?
- What is the total outstanding invoice amount?
- How are invoices distributed across aging buckets?
- Which regions and industries contribute the most to outstanding receivables?
- How does customer credit utilization vary by risk rating?
- How do monthly sales compare with cash collections?

---

## Dataset

The analysis uses five related datasets:

| Dataset | Description |
|----------|-------------|
| Customer Master | Customer information, region, industry, payment terms, and account manager |
| Invoices | Invoice details, due dates, invoice amount, and payment status |
| Payments | Customer payment transactions |
| Sales | Customer sales transactions and product categories |
| Credit Limits | Credit limit, current exposure, utilization, and risk rating |

---

## Project Workflow

```text
Raw CSV Files
      │
      ▼
Excel Data Cleaning
      │
      ▼
SQL Database & Business Queries
      │
      ▼
Python Data Validation & EDA
      │
      ▼
Power BI Dashboard
      │
      ▼
Executive Business Report
```

---

## Tools & Technologies

- Microsoft Excel
- MySQL
- Python
- Pandas
- NumPy
- Matplotlib
- Power BI
- Jupyter Notebook
- Git & GitHub

---

## Project Structure

```
Accounts-Receivable-Payment-Collection-Analysis
│
├── Dataset
│
├── SQL
│   └── Accounts_Receivable_SQL_Analysis.sql
│
├── Python
│   ├── 01_Data_Cleaning_Preprocessing.ipynb
│   ├── 02_Exploratory_Data_Analysis.ipynb
│   └── 03_Executive_Business_Report.ipynb
│
├── PowerBI
│   ├── Accounts_Receivable_Dashboard.pbix
│   └── Dashboard Screenshots
│
├── Images
│
└── README.md
```

---

## Project Highlights

### Data Cleaning & Validation

- Removed missing and duplicate records.
- Standardized date formats.
- Validated data types.
- Verified relationships between all datasets.
- Maintained referential integrity across invoices, customers, payments, sales, and credit data.

---

### SQL Analysis

Performed SQL queries to answer business questions such as:

- Monthly cash collections
- Outstanding invoice balances
- Customer payment trends
- Invoice summaries
- Payment history
- Financial reporting

---

### Exploratory Data Analysis (EDA)

Performed business-focused analyses including:

- Monthly Cash Collections
- Payment Status Distribution
- Outstanding Invoice Amount
- Invoice Aging Analysis
- Top 10 Overdue Customers
- Region-wise Outstanding Receivables
- Industry-wise Outstanding Balance
- Credit Utilization by Risk Rating
- High-Risk Customer Exposure
- Sales vs Cash Collections
- Risk Rating Distribution
- Executive KPI Summary

---

## Power BI Dashboard

The interactive dashboard provides:

### Executive Dashboard

- Total Invoice Amount
- Total Cash Collected
- Outstanding Invoice Amount
- Outstanding Percentage
- Monthly Cash Collections
- Invoice Aging Analysis
- Payment Status Distribution
- Sales vs Collections Trend

---

## Key Business Insights

- Identified customers with significant outstanding balances requiring collection follow-up.
- Analyzed invoice aging to prioritize overdue receivables.
- Monitored monthly cash collection trends to support cash flow planning.
- Evaluated customer credit utilization and financial risk.
- Compared sales performance with cash collections to assess collection efficiency.
- Developed executive dashboards for finance reporting and decision-making.

---

## Business Recommendations

- Prioritize collection activities for high-value overdue customers.
- Monitor customers with high credit utilization.
- Review credit limits for high-risk accounts.
- Improve payment follow-up for overdue invoices.
- Use dashboard insights for continuous monitoring of cash flow and receivables.

---

## Repository Contents

- SQL Scripts
- Python Notebooks
- Power BI Dashboard
- Dashboard Screenshots
- Project Documentation

---

## Future Improvements

- Predict late payments using Machine Learning.
- Customer payment risk scoring.
- Cash flow forecasting.
- Automated payment reminder system.
- Real-time ERP integration.

---

## Author

**Poulomi Bhowmick**


---

## License

This project is intended for educational and portfolio purposes.
