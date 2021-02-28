-- Insertando un alumno duplicado (con id ya usado)
INSERT INTO platzi.alumnos (
    id,
    nombre,
    apellido,
    email,
    colegiatura,
    fecha_incorporacion,
    carrera_id,
    tutor_id
  )
VALUES (
    1000,
    'Pamelina',
    null,
    'pmylchreestrr@salon.com',
    4800,
    '2020-04-26 10:18:51',
    12,
    16
  );
-- Seleccionar alumnos duplicados
-- con el mismo id
SELECT *
FROM platzi.alumnos AS o
WHERE (
    SELECT COUNT(*)
    FROM platzi.alumnos AS i
    WHERE o.id = i.id
  ) > 1;
-- con los mismos valores
SELECT (platzi.alumnos.*)::text,
  COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;
-- con los mismos valores (menos el id)
-- usando GROUP BY
SELECT (
    platzi.alumnos.nombre,
    platzi.alumnos.apellido,
    platzi.alumnos.email,
    platzi.alumnos.colegiatura,
    platzi.alumnos.fecha_incorporacion,
    platzi.alumnos.carrera_id,
    platzi.alumnos.tutor_id
  )::text,
  COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
  platzi.alumnos.apellido,
  platzi.alumnos.email,
  platzi.alumnos.colegiatura,
  platzi.alumnos.fecha_incorporacion,
  platzi.alumnos.carrera_id,
  platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;
-- usando subqueries
SELECT *
FROM (
    SELECT id,
      ROW_NUMBER() OVER(
        PARTITION BY nombre,
        apellido,
        email,
        colegiatura,
        fecha_incorporacion,
        carrera_id,
        tutor_id
        ORDER BY id ASC
      ) AS row,
      *
    FROM platzi.alumnos
  ) AS duplicados
WHERE duplicados.row > 1;