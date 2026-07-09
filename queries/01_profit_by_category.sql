-- ============================================
-- Query 01: Profit by Category
-- ============================================
-- Business Question: Which product categories 
-- generate the most profit?
-- SQL Concepts: INNER JOIN, GROUP BY, SUM, ROUND, ORDER BY
-- Note: Revenue defined as completed sales only.

SELECT
  p.category,
  ROUND(SUM(p.cost), 2) AS total_cost,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  ROUND(SUM(oi.sale_price - p.cost), 2) AS total_profit
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
WHERE oi.status = 'Complete'
GROUP BY p.category
ORDER BY total_profit DESC
