WITH 
  -- CTE para agrupar ingresos por mes
  monthly_incomes AS (
    SELECT
      DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
      SUM(oi.price + oi.freight_value) AS incomes
    FROM orders o
    JOIN order_items oi 
      ON o.order_id = oi.order_id
    GROUP BY month
  ),

  -- CTE que añade la media móvil de 3 meses
  con_movil AS (
    SELECT
      month,
      incomes,
      AVG(incomes) OVER (
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ) AS avg_3m
    FROM monthly_incomes
  )

-- Consulta final
SELECT
  month,
  incomes,
  ROUND(avg_3m, 2) AS promedio_movil_3m
FROM con_movil
ORDER BY month DESC
LIMIT 12;

-- Segundo Bloque: Ranking de clientes por gasto

WITH gasto_cliente AS (
-- CTE que calcula el gasto de cada cliente
  SELECT
    o.customer_id,
    SUM(oi.price + oi.freight_value) AS total_gastado
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  GROUP BY o.customer_id
)

-- Consulta final
SELECT
  customer_id,
  total_gastado,
  RANK()      OVER (ORDER BY total_gastado DESC) AS ranking_general,
  ROW_NUMBER() OVER (ORDER BY total_gastado DESC) AS nro_orden
FROM gasto_cliente
ORDER BY ranking_general
LIMIT 10;

WITH monthly_incomes AS (
    SELECT
      DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
      SUM(oi.price + oi.freight_value) AS incomes
    FROM orders o
    JOIN order_items oi 
      ON o.order_id = oi.order_id
    GROUP BY month
  )  -- reutiliza la CTE anterior

SELECT
  month,
  incomes,
  LAG(incomes) OVER (ORDER BY month) AS incomes_mes_anterior,
  incomes - LAG(incomes) OVER (ORDER BY month) AS diff_vs_prev
FROM monthly_incomes
ORDER BY month
LIMIT 12;