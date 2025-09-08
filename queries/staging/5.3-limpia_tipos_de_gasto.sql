TRUNCATE staging.tipos_de_gasto;
INSERT INTO staging.tipos_de_gasto (
	id_tipo_gasto,
	descripcion,
	monto_aproximado
)
SELECT 
	id_tipo_gasto::int,
	descripcion,
	monto_aproximado::numeric
FROM raw.tipos_de_gasto;