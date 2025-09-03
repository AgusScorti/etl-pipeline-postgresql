SET search_path TO raw;

TRUNCATE TABLE canal_de_venta;
COPY canal_de_venta (codigo, descripcion)
FROM '/import/CanalDeVentas.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Clientes
TRUNCATE TABLE clientes;
COPY clientes (
  id, provincia, nombre_y_apellido, domicilio, telefono, edad, localidad, x, y,
  fecha_alta, usuario_alta, fecha_ultima_modificacion, usuario_ultima_modificacion, marca_baja, col10
)
FROM '/import/Clientes.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Compra
TRUNCATE TABLE compra;
COPY compra (id_compra, fecha, id_producto, cantidad, precio, id_proveedor)
FROM '/import/Compra.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Gasto
TRUNCATE TABLE gasto;
COPY gasto (id_gasto, id_sucursal, id_tipo_gasto, fecha, monto)
FROM '/import/Gasto.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Productos
TRUNCATE TABLE productos;
COPY productos (id_producto, concepto, tipo, precio)
FROM '/import/Productos.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Proveedores
TRUNCATE TABLE proveedores;
COPY proveedores (id_proveedor, nombre, address, city, state, country, departamen)
FROM '/import/Proveedores.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Sucursales
TRUNCATE TABLE sucursales;
COPY sucursales (id, sucursal, direccion, localidad, provincia, latitud, longitud)
FROM '/import/Sucursales.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Tipos de Gasto
TRUNCATE TABLE tipos_de_gasto;
COPY tipos_de_gasto (id_tipo_gasto, descripcion, monto_aproximado)
FROM '/import/TiposDeGasto.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

-- Venta
TRUNCATE TABLE venta;
COPY venta (
  id_venta, fecha, fecha_entrega, id_canal, id_cliente,
  id_sucursal, id_empleado, id_producto, precio, cantidad
)
FROM '/import/Venta.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ';', ENCODING 'UTF8');

