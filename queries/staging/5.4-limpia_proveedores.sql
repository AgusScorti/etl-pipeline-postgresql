TRUNCATE TABLE staging.proveedores;
INSERT INTO staging.proveedores (
    id_proveedor,
    nombre,
    direccion,
    ciudad,
    estado,
    pais,
    departamento
)
SELECT
    id_proveedor::int,
    UPPER(COALESCE(NULLIF(TRIM(nombre), ''), 'SIN DATO')) AS nombre,
    TRIM(address) as direccion,
    TRIM(city) as ciudad,
    TRIM(state) as estado,
    TRIM(country) as pais,
    TRIM(departamen) as departamento
FROM raw.proveedores;