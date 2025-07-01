-- Linea para correr:
-- psql -U $Env:DB_USER -d $Env:DB_NAME -f sql/queries/03_deduplication.sql

-- Creamos una CTE que numera las reseñas por pedido
WITH ranked_reviews AS (
  SELECT
    review_id,
    order_id,
    review_score,
    review_creation_date,
    ROW_NUMBER() OVER (                     -- 3) ROW_NUMBER(): asigna 1,2,3… a cada fila dentro de su partición.
      PARTITION BY order_id                 -- 1) PARTITION BY order_id: agrupa todas las filas que comparten el mismo order_id.
      ORDER BY review_creation_date DESC    -- 2) ORDER BY review_creation_date DESC: dentro de cada grupo, ordena de la más nueva a la más antigua.
    ) AS rn
  FROM order_reviews
)

-- Seleccionamos solo la reseña "principal" de cada pedido
SELECT
  review_id,
  order_id,
  review_score,
  review_creation_date
FROM ranked_reviews
WHERE rn = 1                                -- 4) WHERE rn = 1: nos quedamos con la reseña más reciente por pedido.
ORDER BY review_creation_date DESC
LIMIT 20;