-- Seleccionando los alumnos de ciertas posiciones
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER() AS row_id,
      *
    FROM platzi.alumnos
  ) AS alumnos_with_row_num
WHERE row_id IN (1, 5, 10, 12, 15, 20);
-- Seleccionando los alumnos con ciertos id's
SELECT *
FROM platzi.alumnos
WHERE id IN (1, 2, 3);
-- Seleccionando los alumnos con cierto tutor y cierta carrera (usando id's)
SELECT *
FROM platzi.alumnos
WHERE id IN (
    SELECT id
    FROM platzi.alumnos
    WHERE tutor_id = 30
      AND carrera_id = 31
  );