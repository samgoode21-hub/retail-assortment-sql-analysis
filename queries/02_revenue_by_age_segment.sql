-- ============================================
-- Query 02: Revenue by Customer Age Segment
-- ============================================
-- Business Question: Which customer age groups 
-- generate the most completed revenue?
-- SQL Concepts: INNER JOIN, CASE WHEN, COUNT DISTINCT, GROUP BY, ROUND
-- Note: Age brackets are even-width to avoid bin-size bias. Revenue per
-- customer separates segment size from customer value.

SELECT
  CASE
    WHEN u.age < 20 THEN 'Under 20'
    WHEN u.age BETWEEN 20 AND 29 THEN '20-29'
    WHEN u.age BETWEEN 30 AND 39 THEN '30-39'
    WHEN u.age BETWEEN 40 AND 49 THEN '40-49'
    WHEN u.age BETWEEN 50 AND 59 THEN '50-59'
    WHEN u.age BETWEEN 60 AND 69 THEN '60-69'
    ELSE '70 and over'
  END AS age_group,
  COUNT(DISTINCT u.id) AS customer_count,
  ROUND(SUM(oi.sale_price) / COUNT(DISTINCT u.id), 2) AS revenue_per_customer,
  ROUND(SUM(oi.sale_price), 2) AS completed_revenue
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
INNER JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON oi.user_id = u.id
WHERE oi.status = 'Complete'
GROUP BY age_group
ORDER BY completed_revenue DESC
