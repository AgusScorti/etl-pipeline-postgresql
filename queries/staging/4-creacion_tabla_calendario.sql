CREATE OR REPLACE PROCEDURE staging.load_calendario(p_start date, p_end date)
LANGUAGE plpgsql
AS $$
BEGIN
  -- Poblar rango solicitado
  INSERT INTO staging.calendario (
      fecha, anio, mes, dia, nombre_mes, nombre_dia, trimestre, semana_anio, es_fin_de_semana
  )
  SELECT 
      d::date AS fecha,
      EXTRACT(YEAR FROM d)::int AS anio,
      EXTRACT(MONTH FROM d)::int AS mes,
      EXTRACT(DAY FROM d)::int AS dia,
      INITCAP(TO_CHAR(d, 'TMMonth')) AS nombre_mes,
      INITCAP(TO_CHAR(d, 'TMDay'))   AS nombre_dia,
      EXTRACT(QUARTER FROM d)::int AS trimestre,
      EXTRACT(WEEK FROM d)::int    AS semana_anio,
      CASE WHEN EXTRACT(ISODOW FROM d) IN (6,7) THEN TRUE ELSE FALSE END AS es_fin_de_semana
  FROM generate_series(p_start, p_end, interval '1 day') AS d;
END;
$$;

-- 2) Ejecutar (2015 → 2022)
DROP TABLE IF EXISTS staging.calendario;
 CREATE TABLE IF NOT EXISTS staging.calendario (
      fecha            date PRIMARY KEY,
      anio             int,
      mes              int,
      dia              int,
      nombre_mes       text,
      nombre_dia       text,
      trimestre        int,
      semana_anio      int,
      es_fin_de_semana boolean
  );

CALL staging.load_calendario('2015-01-01', '2022-12-31');