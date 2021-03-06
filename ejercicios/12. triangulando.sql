-- funcion lpad
SELECT lpad('sql', 15, '*');
SELECT lpad('sql', 15, '+');
-- lpad con select
SELECT lpad('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;
-- seleccionando un triangulo con 10 ids
SELECT lpad('*', id, '*')
FROM platzi.alumnos
WHERE id < 10;
-- seleccionando un triangulo con todos los ids
SELECT lpad('*', id, '*')
FROM platzi.alumnos;
-- seleccionando un triangulo desordenado
SELECT lpad('*', id, '*'),
  carrera_id
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;
-- seleccionando un triangulo con numeros de fila
-- sin ordenar por otro campo
SELECT lpad('*', CAST(row_id AS INT), '*')
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_id
WHERE row_id <= 5;
-- ordenando por otro campo
SELECT lpad('*', CAST(row_id AS INT), '*')
FROM (
    SELECT ROW_NUMBER() OVER(
        ORDER BY carrera_id
      ) AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;