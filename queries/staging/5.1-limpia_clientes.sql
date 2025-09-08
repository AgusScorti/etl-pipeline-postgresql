TRUNCATE TABLE staging.clientes;
INSERT INTO staging.clientes (
  id_cliente,
  Provincia,
  Nombre_y_Apellido,
  Domicilio,
  Telefono,
  Edad,
  Localidad,
  Latitud,
  Longitud,
  Fecha_Alta,
  Usuario_Alta,
  Fecha_Ultima_Modificacion,
  Usuario_Ultima_Modificacion,
  Marca_Baja
)
SELECT
	id::int as id_cliente,
	COALESCE(NULLIF(TRIM(provincia), ''), 'sin dato') as provincia,
	COALESCE(NULLIF(TRIM(nombre_y_apellido), ''), 'sin dato') as nombre_y_apellido,
	COALESCE(NULLIF(TRIM(domicilio), ''), 'sin dato') as domicilio,
	telefono,
	edad::int,
	COALESCE(NULLIF(TRIM(localidad), ''), 'sin dato') as localidad,
	COALESCE(NULLIF(REPLACE(x, ',', '.'), ''), '0.0000000000')::numeric(13,10) as longitud,
	COALESCE(NULLIF(REPLACE(y, ',', '.'), ''), '0.0000000000')::numeric(13,10) as latitud,
	Fecha_Alta::date,
  	Usuario_Alta,
  	Fecha_Ultima_Modificacion::date,
  	Usuario_Ultima_Modificacion,
  	Marca_Baja::int
FROM raw.clientes;