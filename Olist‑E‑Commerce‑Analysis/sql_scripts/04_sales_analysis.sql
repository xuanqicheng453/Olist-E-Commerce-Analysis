USE ecommerce_analytics;

-- 04_sales_analysis.sql
-- Sales performance analysis

-- 1. Total orders, total sales revenue and average order value
SELECT 
  COUNT(DISTINCT o.order_id) AS total_orders,
  SUM(op.payment_value) AS total_sales,
  AVG(op.payment_value) AS avg_order_value
FROM orders o
JOIN payments op ON o.order_id = op.order_id;

-- 2. Monthly sales and order trend over time
SELECT 
  DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
  COUNT(DISTINCT o.order_id) AS monthly_orders,
  SUM(op.payment_value) AS monthly_sales
FROM orders o
JOIN payments op ON o.order_id = op.order_id
GROUP BY order_month
ORDER BY order_month;

-- 3. Sales amount and order count grouped by payment type
SELECT 
  op.payment_type,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(op.payment_value) AS sales_amount
FROM orders o
JOIN payments op ON o.order_id = op.order_id
GROUP BY op.payment_type;

-- 4. Distribution of order status
SELECT 
  order_status,
  COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY order_status;

-- 5. Sales ranking by customer state
SELECT 
  c.customer_state,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(op.payment_value) AS state_sales
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments op ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY state_sales DESC;
