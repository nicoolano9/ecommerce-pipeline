EXPLAIN ANALYZE
SELECT
  o.customer_id,
  SUM(oi.price + oi.freight_value) AS total_expense
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_expense DESC
LIMIT 10;