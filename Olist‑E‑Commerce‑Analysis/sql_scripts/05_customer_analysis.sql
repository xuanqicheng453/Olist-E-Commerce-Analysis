USE ecommerce_analytics;

-- 05_customer_analysis.sql
-- Customer behavior analysis

-- 1. Total unique customers and customer distribution by state
SELECT
  customer_state,
  COUNT(DISTINCT customer_id) AS customer_count
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;

-- 2. Count orders per customer (check repeat purchase)
SELECT
  order_count_per_customer,
  COUNT(DISTINCT customer_id) AS customer_number
FROM (
    SELECT
      customer_id,
      COUNT(DISTINCT order_id) AS order_count_per_customer
    FROM orders
    GROUP BY customer_id
) AS customer_order_cnt
GROUP BY order_count_per_customer;

-- 3. Average delivery time by state
SELECT
  c.customer_state,
  AVG(TIMESTAMPDIFF(DAY, o.order_purchase_timestamp, o.order_delivered_customer_date)) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
  AND o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_delivery_days;

-- 4. Customer purchase month trend (new & active customer trend)
SELECT
  DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
  COUNT(DISTINCT o.customer_id) AS active_customer
FROM orders o
GROUP BY order_month
ORDER BY order_month;
