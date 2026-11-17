USE ecommerce_analytics;

-- 07_summary_report.sql
-- Final summary report of the E-Commerce project

-- 1. Overall business overview
SELECT
  COUNT(DISTINCT o.order_id) AS total_orders,
  COUNT(DISTINCT o.customer_id) AS total_customers,
  SUM(p.payment_value) AS total_revenue,
  AVG(p.payment_value) AS average_order_value
FROM orders o
JOIN payments p ON o.order_id = p.order_id;

-- 2. Top 5 categories by revenue
SELECT
  t.product_category_name_english AS category_name,
  SUM(oi.price) AS category_revenue
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
JOIN product_category_translation t ON pr.product_category_name = t.product_category_name
GROUP BY category_name
ORDER BY category_revenue DESC
LIMIT 5;

-- 3. Top 5 states with the most customers
SELECT
  c.customer_state,
  COUNT(DISTINCT c.customer_id) AS customer_count
FROM customers c
GROUP BY c.customer_state
ORDER BY customer_count DESC
LIMIT 5;

-- 4. Payment type distribution
SELECT
  p.payment_type,
  COUNT(DISTINCT o.order_id) AS order_count,
  SUM(p.payment_value) AS payment_sales
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY p.payment_type;

-- 5. Average review score across all orders
SELECT
  AVG(r.review_score) AS overall_avg_review_score
FROM reviews_raw r;

-- 6. Order status breakdown
SELECT
  order_status,
  COUNT(DISTINCT order_id) AS order_number
FROM orders
GROUP BY order_status;
