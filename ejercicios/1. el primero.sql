-- Seleccionando el primero con FETCH
SELECT *
FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;
-- Seleccionando el primero con LIMIT
SELECT *
FROM platzi.alumnos
LIMIT 1;
-- Seleccionando el primero con Window Functions
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_num
WHERE row_id = 1;