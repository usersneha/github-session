# Customer Churn & Retention Analysis

## Project Overview
A portfolio Data Analyst project using a synthetic telecom-style customer dataset to understand churn patterns and identify customer characteristics associated with higher retention risk.

## Business Questions
- What is the overall churn rate?
- Which contract types have higher churn?
- How does churn vary with tenure?
- Do customers with more support tickets churn more often?
- How do monthly charges relate to churn?
- Which customer groups should a business investigate for retention actions?

## Dataset
Synthetic data created for portfolio practice. Each row represents one customer.

Key fields:
- Customer ID
- Tenure in months
- Contract type
- Monthly charges
- Total charges
- Support tickets
- Payment method
- Internet service
- Churn flag

## Tools & Skills
- SQL: GROUP BY, CASE, CTEs, aggregate functions, filtering
- Python: Pandas, NumPy, Matplotlib
- Analytics: churn-rate calculation, segmentation, pattern analysis

## Project Structure
```
customer-churn-analysis/
├── data/
│   └── customer_churn.csv
├── sql/
│   └── analysis.sql
├── python/
│   └── analysis.py
└── README.md
```

## Important Note
This dataset is synthetic and is intended to demonstrate analytical workflow, not to represent a real company's customers.

## How to Run
Load the CSV into a SQL database for the SQL analysis, or upload the CSV to Google Colab and run the Python script/notebook logic.

## Next Improvements
- Build a Power BI retention dashboard
- Add churn cohorts
- Add customer lifetime value analysis
- Add a simple churn-risk scoring model
