-- ============================================
-- Query 03: Top Brands by Revenue
-- ============================================
-- Business Question: Which brands generated the most completed 
-- revenue, and do they win on volume or price?
-- SQL Concepts: INNER JOIN, GROUP BY, SUM, COUNT, ROUND, LIMIT
-- Note: Units sold and average price per unit distinguish volume-driven
-- brands from premium, low-volume brands.

SELECT
  p.brand,
  ROUND(SUM(oi.sale_price), 2) AS total_revenue,
  COUNT(*) AS units_sold,
  ROUND(SUM(oi.sale_price) / COUNT(*), 2) AS avg_price_per_unit
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
WHERE oi.status = 'Complete'
GROUP BY p.brand
ORDER BY total_revenue DESC
LIMIT 10
