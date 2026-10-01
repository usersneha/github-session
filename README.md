# E-commerce Sales & Customer Analysis

## Project Overview
A portfolio-ready Data Analyst project analyzing 180 e-commerce transactions across 2025. The project demonstrates data cleaning, KPI analysis, customer segmentation, product/category performance, and business-focused SQL analysis.

## Business Questions
- What are total revenue, orders, average order value, and unique customers?
- Which categories and regions generate the most revenue?
- How do New, Returning, and VIP customers compare?
- Which products are top performers?
- How are customers using different payment methods?
- What is the repeat-customer rate?

## Dataset
Synthetic transactional data created for portfolio practice. Each row represents an order and includes:
- Order date and ID
- Customer ID and segment
- Region
- Product category and product
- Quantity and unit price
- Discount percentage
- Payment method

## Tools & Skills
- **SQL:** SELECT, WHERE, GROUP BY, ORDER BY, CASE, CTEs, aggregate functions, window functions
- **Python:** Pandas, NumPy, Matplotlib
- **Analytics:** KPI calculation, segmentation, trend analysis, business questions
- **GitHub:** project structure, documentation, version control

## Project Structure
```
ecommerce-sales-analysis/
├── data/
│   └── ecommerce_sales.csv
├── sql/
│   └── analysis.sql
├── python/
│   └── analysis.py
└── README.md
```

## How to Run

### SQL
Load `data/ecommerce_sales.csv` into MySQL or another SQL database as `ecommerce_sales`, then run `sql/analysis.sql`.

### Python
Install dependencies:
```bash
pip install pandas numpy matplotlib
```

Then run:
```bash
python python/analysis.py
```

## What This Project Demonstrates
This project is intentionally organized around business questions instead of only code. It demonstrates the workflow a junior Data Analyst should be able to explain: understand the data, calculate KPIs, segment performance, identify patterns, and translate findings into business questions.

## Next Improvements
- Add an Excel dashboard
- Build a Power BI dashboard
- Add customer cohort analysis
- Add RFM segmentation
- Add automated data-quality checks
- Document final business recommendations after analysis
