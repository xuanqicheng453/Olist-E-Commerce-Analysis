USE ecommerce_analytics;

-- ========== 1. Count total rows for each table ==========
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'orders' AS table_name, COUNT(*) AS row_count FROM orders
UNION ALL
SELECT 'order_items' AS table_name, COUNT(*) AS row_count FROM order_items
UNION ALL
SELECT 'payments' AS table_name, COUNT(*) AS row_count FROM payments
UNION ALL
SELECT 'reviews' AS table_name, COUNT(*) AS row_count FROM reviews
UNION ALL
SELECT 'products' AS table_name, COUNT(*) AS row_count FROM products
UNION ALL
SELECT 'sellers' AS table_name, COUNT(*) AS row_count FROM sellers
UNION ALL
SELECT 'geolocation' AS table_name, COUNT(*) AS row_count FROM geolocation
UNION ALL
SELECT 'product_category_translation' AS table_name, COUNT(*) AS row_count FROM product_category_translation;

-- ========== 2. Check duplicate review_id in reviews table ==========
SELECT review_id, COUNT(*) AS duplicate_count
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- ========== 3. Check NULL values in key columns ==========
-- Check NULL delivery timestamp in orders
SELECT 
  COUNT(*) AS total,
  SUM(CASE WHEN order_delivered_customer_date IS NULL THEN 1 ELSE 0 END) AS delivered_null
FROM orders;

-- Check NULL review score
SELECT 
  COUNT(*) AS total,
  SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS score_null
FROM reviews;

-- Check NULL product category
SELECT 
  COUNT(*) AS total,
  SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS category_null
FROM products;

-- ========== 4. Order status distribution ==========
SELECT order_status, COUNT(*) AS order_count
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- ========== 5. Payment type distribution ==========
SELECT payment_type, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_type
ORDER BY payment_count DESC;
