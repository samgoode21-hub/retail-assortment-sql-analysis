-- ============================================
-- Query 04: Dead Inventory by Category
-- ============================================
-- Business Question: Which product categories carry 
-- the most never-sold inventory?
-- SQL Concepts: LEFT JOIN, IS NULL, GROUP BY, COUNT, ORDER BY
-- Note: LEFT JOIN retains products with no matching sales. Filtering on
-- IS NULL isolates them. An INNER JOIN cannot answer this question.

SELECT
  p.category,
  COUNT(*) AS never_sold_count
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
LEFT JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
WHERE oi.order_id IS NULL
GROUP BY p.category
ORDER BY never_sold_count DESC
