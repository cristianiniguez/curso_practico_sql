-- Seleccionando la fecha máxima (la más reciente)
-- de todos los registros (con ORDER BY y LIMIT)
SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;
-- por carrera (con MAX)
SELECT carrera_id,
  MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;
-- Tarea: seleccionando el mínimo nombre (el primero alfabéticamente) por tutor
SELECT tutor_id,
  MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;