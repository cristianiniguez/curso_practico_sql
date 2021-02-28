-- Seleccionando los alumnos incorporados en cierto año
-- con EXTRACT
SELECT *
FROM platzi.alumnos
WHERE (
    EXTRACT(
      YEAR
      FROM fecha_incorporacion
    )
  ) = 2019;
-- con DATE_PART
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;
-- con subquery
SELECT *
FROM (
    SELECT *,
      DATE_PART('YEAR', fecha_incorporacion) AS anho_incorporacion
    FROM platzi.alumnos
  ) AS alumnos_con_anho
WHERE anho_incorporacion = 2019;