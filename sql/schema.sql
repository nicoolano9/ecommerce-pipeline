-- schema.sql

-- BORRAR tablas dependientes
DROP TABLE IF EXISTS order_reviews;
DROP TABLE IF EXISTS order_payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;

-- BORRAR tablas maestras
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS geolocation;
DROP TABLE IF EXISTS category_translation;

-- Clientes
CREATE TABLE customers (
  customer_id    VARCHAR PRIMARY KEY,
  customer_unique_id VARCHAR,
  customer_zip_code_prefix INTEGER,
  customer_city VARCHAR,
  customer_state CHAR(2)
);

-- Productos
CREATE TABLE products (
  product_id       VARCHAR PRIMARY KEY,
  product_category_name VARCHAR,
  product_name_lenght INTEGER,
  product_description_lenght INTEGER,
  product_photos_qty INTEGER,
  product_weight_g INTEGER,
  product_length_cm INTEGER,
  product_height_cm INTEGER,
  product_width_cm INTEGER
);

-- Pedidos
CREATE TABLE orders (
  order_id           VARCHAR PRIMARY KEY,
  customer_id        VARCHAR REFERENCES customers(customer_id),
  order_status       VARCHAR,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at  TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

-- Pagos de pedidos
CREATE TABLE order_payments (
  order_id            VARCHAR REFERENCES orders(order_id),
  payment_sequential  INTEGER,
  payment_type        VARCHAR,
  payment_installments INTEGER,
  payment_value       NUMERIC
);


-- Items de pedido
CREATE TABLE order_items (
  order_id      VARCHAR REFERENCES orders(order_id),
  order_item_id INTEGER,
  product_id    VARCHAR REFERENCES products(product_id),
  seller_id     VARCHAR,
  shipping_limit_date TIMESTAMP,
  price         NUMERIC,
  freight_value NUMERIC,
  PRIMARY KEY (order_id, order_item_id)
);

-- Reseñas
CREATE TABLE order_reviews (
  review_id     VARCHAR PRIMARY KEY,
  order_id      VARCHAR REFERENCES orders(order_id),
  review_score  INTEGER,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);

-- Vendedores
CREATE TABLE sellers (
  seller_id    VARCHAR PRIMARY KEY,
  seller_zip_code_prefix INTEGER,
  seller_city  VARCHAR,
  seller_state CHAR(2)
);

-- Geolocalización
CREATE TABLE geolocation (
  geolocation_id           SERIAL PRIMARY KEY,
  geolocation_zip_code_prefix INTEGER,
  geolocation_lat         NUMERIC,
  geolocation_lng         NUMERIC,
  geolocation_city        VARCHAR,
  geolocation_state       CHAR(2)
);

-- Traducción de categorías
CREATE TABLE category_translation (
  product_category_name      VARCHAR PRIMARY KEY,
  product_category_name_english VARCHAR
);
