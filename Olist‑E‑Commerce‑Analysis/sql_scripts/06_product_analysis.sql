USE ecommerce_analytics;

-- 06_product_analysis.sql
-- Product and category performance analysis

-- 1. Total sales and order quantity by product category
SELECT
  pc.product_category_name_english AS category_name,
  COUNT(DISTINCT oi.order_id) AS total_orders,
  SUM(oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_translation pc ON p.product_category_name = pc.product_category_name
GROUP BY pc.product_category_name_english
ORDER BY total_revenue DESC;

-- 2. Top 10 best-selling products by revenue
SELECT
  p.product_id,
  pc.product_category_name_english AS category_name,
  SUM(oi.price) AS product_revenue,
  COUNT(DISTINCT oi.order_id) AS product_order_count
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_translation pc ON p.product_category_name = pc.product_category_name
GROUP BY p.product_id, pc.product_category_name_english
ORDER BY product_revenue DESC
LIMIT 10;

-- 3. Average product price per category
SELECT
  pc.product_category_name_english AS category_name,
  AVG(oi.price) AS avg_product_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_translation pc ON p.product_category_name = pc.product_category_name
GROUP BY pc.product_category_name_english
ORDER BY avg_product_price DESC;

-- 4. Average review score for each product category
WITH order_category AS (
    SELECT DISTINCT
        oi.order_id,
        pc.product_category_name_english AS category_name
    FROM order_items oi
    JOIN products p
        ON oi.product_id = p.product_id
    JOIN product_category_translation pc
        ON p.product_category_name = pc.product_category_name
)

SELECT
    oc.category_name,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS review_count
FROM order_category oc
JOIN reviews_raw r
    ON oc.order_id = r.order_id
WHERE r.review_score IS NOT NULL
GROUP BY oc.category_name
ORDER BY avg_review_score DESC;
