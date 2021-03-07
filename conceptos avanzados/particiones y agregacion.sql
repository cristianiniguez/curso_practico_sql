-- seleccionando con numero de fila
-- con proyeccion ordenada por defecto
SELECT ROW_NUMBER() OVER() AS row_id,
  *
FROM platzi.alumnos;
-- con proyeccion ordenada por defecto por otro campo
SELECT ROW_NUMBER() OVER(
    ORDER BY fecha_incorporacion
  ) AS row_id,
  *
FROM platzi.alumnos;
-- seleccionando con primera colegiatura obtenida
-- con proyeccion ordenada por defecto
SELECT FIRST_VALUE(colegiatura) OVER() AS primera_colegiatura,
  *
FROM platzi.alumnos;
-- con proyeccion particionada
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS primera_colegiatura,
  *
FROM platzi.alumnos;
-- seleccionando con ultima colegiatura obtenida
-- con proyeccion ordenada por defecto
SELECT LAST_VALUE(colegiatura) OVER() AS ultima_colegiatura,
  *
FROM platzi.alumnos;
-- con proyeccion particionada
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS ultima_colegiatura,
  *
FROM platzi.alumnos;
-- seleccionando enesima (tercera) colegiatura obtenida
-- con proyeccion ordenada por defecto
SELECT NTH_VALUE(colegiatura, 3) OVER() AS tercera_colegiatura,
  *
FROM platzi.alumnos;
-- con proyeccion particionada
SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS tercera_colegiatura,
  *
FROM platzi.alumnos;
-- seleccionando con ranking de colegiatura
-- con proyeccion particionada
SELECT *,
  RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id,
  colegiatura_rank;
-- con ranking sin tomar en cuenta gaps
SELECT *,
  DENSE_RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id,
  colegiatura_rank;
-- con ranking porcentual
SELECT *,
  PERCENT_RANK() OVER(
    PARTITION BY carrera_id
    ORDER BY colegiatura DESC
  ) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id,
  colegiatura_rank;