-- seleccionando promedio de colegiaturas
-- por carrera
SELECT *,
  AVG(colegiatura) OVER(PARTITION BY carrera_id)
FROM platzi.alumnos;
-- en general
SELECT *,
  AVG(colegiatura) OVER()
FROM platzi.alumnos;
-- seleccionando suma de colegiaturas
-- acumuladas (sumando las colegiaturas anteriores)
SELECT *,
  SUM(colegiatura) OVER(
    ORDER BY colegiatura
  )
FROM platzi.alumnos;
-- acumuladas y por carrera
SELECT *,
  SUM(colegiatura) OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura
  )
FROM platzi.alumnos;
-- seleccionando ranking de colegiaturas
-- por carrera
SELECT *,
  RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS brand_rank
FROM platzi.alumnos
ORDER BY carrera_id,
  brand_rank;
-- ranking de 2 más altas colegiaturas
SELECT *
FROM (
    SELECT *,
      RANK() OVER(
        PARTITION BY carrera_id
        ORDER BY colegiatura DESC
      ) AS brand_rank
    FROM platzi.alumnos
    ORDER BY brand_rank
  ) AS rank_colegiaturas_por_carrera
WHERE brand_rank < 3;