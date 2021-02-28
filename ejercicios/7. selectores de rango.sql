-- Seleccionar alumnos con tutor con id entre 1 y 10
-- con set de opciones (IN)
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
-- con operadores de comparación
SELECT *
FROM platzi.alumnos
WHERE tutor_id >= 1
  AND tutor_id <= 10;
-- con BETWEEN
SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;
-- Seleccionando rangos de números enteros
SELECT int4range(10, 20);
SELECT int4range(10, 20) @> 3;
SELECT int4range(10, 20) @> 10;
SELECT int4range(10, 20) @> 20;
-- Seleccionando rangos de números decimales
SELECT numrange(11.1, 22.2);
SELECT numrange(20.0, 30.0);
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);
SELECT numrange(11.1, 19.9) && numrange(20.0, 30.0);
-- Funciones de rangos
SELECT UPPER(int4range(15, 25));
SELECT LOWER(int4range(15, 25));
SELECT int4range(10, 20) * int4range(15, 25);
SELECT ISEMPTY(numrange(1, 5));
-- Seleccionar alumnos con tutor con id entre 10 y 20 usando rangos
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;
-- Tarea: Interseccion entre IDs de tutores y de carreras
SELECT numrange(
    (
      SELECT MIN(tutor_id)
      FROM platzi.alumnos
    ),
    (
      SELECT MAX(tutor_id)
      FROM platzi.alumnos
    )
  ) * numrange(
    (
      SELECT MIN(carrera_id)
      FROM platzi.alumnos
    ),
    (
      SELECT MAX(carrera_id)
      FROM platzi.alumnos
    )
  );