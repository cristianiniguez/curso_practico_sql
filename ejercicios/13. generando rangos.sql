-- funcion generate_series
SELECT *
FROM generate_series(1, 4);
SELECT *
FROM generate_series(5, 1);
SELECT *
FROM generate_series(5, 1, -2);
SELECT *
FROM generate_series(3, 4);
SELECT *
FROM generate_series(4, 3);
SELECT *
FROM generate_series(4, 4);
SELECT *
FROM generate_series(4, 3, -1);
SELECT *
FROM generate_series(3, 4, -1);
SELECT *
FROM generate_series(1.1, 4.1, 1.3);
-- generate_series con fechas
SELECT current_date + s.a AS dates
FROM generate_series(0, 14, 7) AS s(a);
-- generate_series con horas
SELECT *
FROM generate_series(
    '2020-09-01 00:00:00'::timestamp,
    '2020-09-04 12:00:00'::timestamp,
    '10 hours'
  );
-- generate_series con inner join
SELECT a.id,
  a.nombre,
  a.apellido,
  a.carrera_id,
  s.a
FROM platzi.alumnos AS a
  INNER JOIN generate_series(0, 10) AS s(a) ON s.a = a.carrera_id
ORDER BY a.carrera_id;