-- E-commerce Sales & Customer Analysis
-- Table: ecommerce_sales

-- 1. Overall KPIs
SELECT COUNT(*) AS orders,
       SUM(quantity * unit_price * (1 - discount_pct/100)) AS revenue,
       AVG(quantity * unit_price * (1 - discount_pct/100)) AS avg_order_value,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM ecommerce_sales;

-- 2. Monthly revenue
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)), 2) AS revenue
FROM ecommerce_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 3. Category performance
SELECT category, COUNT(*) AS orders, SUM(quantity) AS units_sold,
       ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)),2) AS revenue
FROM ecommerce_sales
GROUP BY category
ORDER BY revenue DESC;

-- 4. Customer segment performance
SELECT segment, COUNT(DISTINCT customer_id) AS customers,
       COUNT(*) AS orders,
       ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)),2) AS revenue,
       ROUND(AVG(quantity * unit_price * (1 - discount_pct/100)),2) AS avg_order_value
FROM ecommerce_sales
GROUP BY segment
ORDER BY revenue DESC;

-- 5. Regional performance
SELECT region,
       ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)),2) AS revenue,
       COUNT(*) AS orders
FROM ecommerce_sales
GROUP BY region
ORDER BY revenue DESC;

-- 6. Top products by revenue
SELECT product, category, SUM(quantity) AS units_sold,
       ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)),2) AS revenue
FROM ecommerce_sales
GROUP BY product, category
ORDER BY revenue DESC
LIMIT 10;

-- 7. Payment method usage
SELECT payment_method, COUNT(*) AS orders,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS order_share_pct
FROM ecommerce_sales
GROUP BY payment_method
ORDER BY orders DESC;

-- 8. Repeat-customer rate
WITH customer_orders AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM ecommerce_sales
    GROUP BY customer_id
)
SELECT ROUND(
    100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) / COUNT(*), 2
) AS repeat_customer_rate_pct
FROM customer_orders;