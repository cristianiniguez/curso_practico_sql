-- Seleccionar alumnos sin carrera
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE c.id IS NULL;
-- Seleccionar alumnos con o sin carrera
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;
-- Seleccionar carreras con o sin alumnos
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  RIGHT JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;
--Seleccionar carreras sin alumnos
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  RIGHT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id DESC;
-- Seleccionar alumnos con carrera
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  INNER JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;
-- Seleccionar alumnos sin carrera y carreras sin alumnos
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  FULL OUTER JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE a.id IS NULL
  OR c.id IS NULL
ORDER BY a.carrera_id DESC,
  c.id DESC;