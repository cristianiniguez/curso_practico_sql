-- Seleccionando alumnos que son tutores de otros alumnos
SELECT CONCAT(a.nombre, ' ', a.apellido) AS alumno,
  CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM platzi.alumnos AS a
  INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;
-- Seleccionando nombre y número de alumnos de un tutor, mostrando primero el tutor con más alumnos
SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
  COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
  INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC;
-- Seleccionando nombre y número de alumnos de un tutor, mostrando el top 10 con más alumnos
SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
  COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
  INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;
-- Tarea: Seleccionando el promedio de alumnos por tutor
SELECT AVG(alumnos_por_tutor) AS promedio_alumnos_por_tutor
FROM (
    SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
      COUNT(*) AS alumnos_por_tutor
    FROM platzi.alumnos AS a
      INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
    GROUP BY tutor
  ) AS alumnos_tutor;