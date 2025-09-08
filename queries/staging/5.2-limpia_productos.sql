TRUNCATE staging.productos;
INSERT INTO staging.productos (
    id_producto,
    concepto,
    tipo,
    precio
)
SELECT 
    id_producto::int,
    COALESCE(NULLIF(TRIM(concepto), ''), 'sin dato') AS concepto,
    COALESCE(NULLIF(TRIM(tipo), ''), 'sin dato') AS tipo,
    ROUND(precio::numeric, 2) AS precio
FROM raw.productos
WHERE precio::numeric > 0
  AND precio::numeric <= 100000;

TRUNCATE staging.productos_rechazados;
INSERT INTO staging.productos_rechazados (id_producto, concepto, tipo, precio, motivo)
SELECT 
    id_producto,
    concepto,
    tipo,
    precio,
    CASE 
      WHEN precio::numeric = 0 THEN 'precio igual a cero'
      WHEN precio::numeric > 100000 THEN 'precio fuera de lo comun'
    END AS motivo
FROM raw.productos
WHERE precio::numeric = 0
   OR precio::numeric > 100000;