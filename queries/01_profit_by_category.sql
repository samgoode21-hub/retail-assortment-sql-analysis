-- Query 1: Profit by Category
-- Business question: Which product categories generate the most profit?
-- Revenue defined as completed sales only (excludes cancelled and returned orders).

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
