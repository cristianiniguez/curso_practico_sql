-- Seleccionando número de alumnos por carrera
-- mostrando id de carrera
SELECT carrera_id,
  COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;
-- Eliminando carreras con id entre 30 y 40
DELETE FROM platzi.carreras
WHERE id BETWEEN 30 AND 40;
-- Seleccionando alumnos cuya carrera no existe
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;
-- Tarea: Seleccionando alumnos y carreras, incluyendo alumnos sin carrera y carreras sin alumnos
SELECT a.nombre,
  a.apellido,
  a.carrera_id,
  c.id,
  c.carrera
FROM platzi.alumnos AS a
  FULL OUTER JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY a.carrera_id;