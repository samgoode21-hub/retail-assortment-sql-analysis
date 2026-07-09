-- Query 4: Dead Inventory by Category
-- Business question: Which product categories carry the most never-sold inventory?
-- A LEFT JOIN retains every product, including those with no matching sales.
-- Products that never sold have no order_id after the join, so filtering on
-- IS NULL isolates them. An INNER JOIN cannot answer this question, since it
-- discards the unmatched rows that are the answer.

SELECT
  p.category,
  COUNT(*) AS never_sold_count
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
LEFT JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
WHERE oi.order_id IS NULL
GROUP BY p.category
ORDER BY never_sold_count DESC
