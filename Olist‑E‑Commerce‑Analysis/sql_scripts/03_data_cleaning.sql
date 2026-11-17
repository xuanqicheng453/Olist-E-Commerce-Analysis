USE ecommerce_analytics;

-- 03_data_cleaning.sql
-- 1: Remove duplicate records from reviews_raw table
CREATE TABLE reviews_clean AS
SELECT DISTINCT *
FROM reviews_raw;

-- 2: Check row numbers before and after deduplication
SELECT 'original reviews' AS table_name, COUNT(*) AS row_count FROM reviews_raw
UNION ALL
SELECT 'cleaned reviews' AS table_name, COUNT(*) AS row_count FROM reviews_clean;

-- 3: Double check duplicates are removed
SELECT review_id, COUNT(*) AS duplicate_count
FROM reviews_clean
GROUP BY review_id
HAVING COUNT(*) > 1;
