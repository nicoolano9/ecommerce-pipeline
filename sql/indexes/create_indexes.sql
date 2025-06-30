-- Acelerar join order_items → orders
CREATE INDEX IF NOT EXISTS idx_order_items_order_id
  ON order_items(order_id);

-- Acelerar join order_items → products
CREATE INDEX IF NOT EXISTS idx_order_items_product_id
  ON order_items(product_id);

-- Acelerar join order_payments → orders
CREATE INDEX IF NOT EXISTS idx_order_payments_order_id
  ON order_payments(order_id);

-- Acelerar join order_reviews → orders
CREATE INDEX IF NOT EXISTS idx_order_reviews_order_id
  ON order_reviews(order_id);

-- Acelerar agrupaciones por fecha de pedido
CREATE INDEX IF NOT EXISTS idx_orders_purchase_ts
  ON orders(order_purchase_timestamp);

-- Acelerar agrupaciones por cliente
CREATE INDEX IF NOT EXISTS idx_orders_customer_id
  ON orders(customer_id);
