-- Seleccionando los años, meses y días de las fechas de incorporación
-- primera forma (con EXTRACT)
SELECT EXTRACT(
    YEAR
    FROM fecha_incorporacion
  ) AS anho_incorporacion
FROM platzi.alumnos;
-- segunda forma (con DATE_PART)
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anho_incorporacion
FROM platzi.alumnos;
-- Seleccionando los años, meses y días de las fechas de incorporación
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anho_incorporacion,
  DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
  DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion
FROM platzi.alumnos;
-- Seleccionamos las horas, minutos y segundos de las fechas de incorporación
SELECT DATE_PART('HOUR', fecha_incorporacion) AS hora_incorporacion,
  DATE_PART('MINUTE', fecha_incorporacion) AS minuto_incorporacion,
  DATE_PART('SECOND', fecha_incorporacion) AS segundo_incorporacion
FROM platzi.alumnos;