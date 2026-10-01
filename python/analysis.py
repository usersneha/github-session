import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('../data/ecommerce_sales.csv', parse_dates=['order_date'])
df.columns = df.columns.str.strip().str.lower()
df = df.drop_duplicates()
df['revenue'] = df['quantity'] * df['unit_price'] * (1 - df['discount_pct'] / 100)

print('=== KPI SUMMARY ===')
print('Orders:', len(df))
print('Revenue: ₹', round(df['revenue'].sum(), 2))
print('Average Order Value: ₹', round(df['revenue'].mean(), 2))
print('Unique Customers:', df['customer_id'].nunique())

category = df.groupby('category', as_index=False).agg(
    orders=('order_id', 'count'),
    units_sold=('quantity', 'sum'),
    revenue=('revenue', 'sum')
).sort_values('revenue', ascending=False)
print('\n=== CATEGORY PERFORMANCE ===')
print(category)

monthly = (df.assign(month=df['order_date'].dt.to_period('M').astype(str))
             .groupby('month', as_index=False)['revenue'].sum())

segment = df.groupby('segment', as_index=False).agg(
    customers=('customer_id', 'nunique'),
    orders=('order_id', 'count'),
    revenue=('revenue', 'sum')
)
segment['aov'] = segment['revenue'] / segment['orders']
print('\n=== CUSTOMER SEGMENTS ===')
print(segment.sort_values('revenue', ascending=False))

plt.figure(figsize=(9, 5))
plt.bar(category['category'], category['revenue'])
plt.title('Revenue by Category')
plt.xlabel('Category')
plt.ylabel('Revenue (₹)')
plt.xticks(rotation=30)
plt.tight_layout()
plt.savefig('../category_revenue.png', dpi=150)
plt.show()

plt.figure(figsize=(10, 5))
plt.plot(monthly['month'], monthly['revenue'], marker='o')
plt.title('Monthly Revenue Trend')
plt.xlabel('Month')
plt.ylabel('Revenue (₹)')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('../monthly_revenue.png', dpi=150)
plt.show()

top_products = (df.groupby(['product', 'category'], as_index=False)['revenue'].sum()
                  .sort_values('revenue', ascending=False).head(10))
print('\n=== TOP 10 PRODUCTS ===')
print(top_products.to_string(index=False))