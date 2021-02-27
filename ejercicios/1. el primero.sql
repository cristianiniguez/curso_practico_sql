-- Seleccionando el primer alumno
-- con FETCH
SELECT *
FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;
-- con LIMIT
SELECT *
FROM platzi.alumnos
LIMIT 1;
-- con Window Functions
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_num
WHERE row_id = 1;
-- Seleccionando los primeros 5 alumnos
-- con FETCH 
SELECT *
FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;
-- con LIMIT
SELECT *
FROM platzi.alumnos
LIMIT 5;
-- con Windows Functions
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_num
WHERE row_id <= 5;