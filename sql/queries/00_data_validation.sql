-- Linea para correr:
-- psql -U $Env:DB_USER -d $Env:DB_NAME -f sql/queries/00_data_validation.sql

-- Ningún order_items sin order id válido
SELECT
  COUNT(*) AS orphan_order_items_orders
FROM order_items oi
LEFT JOIN orders o
  ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Ningún order_items sin produc id válido
SELECT
  COUNT(*) AS orphan_order_items_products
FROM order_items oi
LEFT JOIN products p
  ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Ningún order_payment sin odrder id válido
SELECT
  COUNT(*) AS orphan_order_payments_orders
FROM order_payments op
LEFT JOIN orders o
  ON op.order_id = o.order_id
WHERE o.order_id IS NULL;
-- Ningún order_review sin order id válido
SELECT
  COUNT(*) AS orphan_order_reviews_orders
FROM order_reviews rv
LEFT JOIN orders o
  ON rv.order_id = o.order_id
WHERE o.order_id IS NULL;