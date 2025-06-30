SELECT
  DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
  SUM(oi.price + oi.freight_value) AS incomes
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 1 DESC
LIMIT 10;