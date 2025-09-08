DROP SCHEMA IF EXISTS staging cascade;
CREATE SCHEMA IF NOT EXISTS staging;

-- Canal de venta
CREATE TABLE IF NOT EXISTS staging.canal_de_venta (
  id_canal     int,
  descripcion  text
);

-- Clientes
CREATE TABLE IF NOT EXISTS staging.clientes (
  id_cliente                  int,
  provincia                   text,
  nombre_y_apellido           text,
  domicilio                   text,
  telefono                    text,
  edad                        int,
  localidad                   text,
  longitud                    numeric(13,10),
  latitud                     numeric(13,10),
  fecha_alta                  date,
  usuario_alta                text,
  fecha_ultima_modificacion   date,
  usuario_ultima_modificacion text,
  marca_baja                  int
);

-- Compra
CREATE TABLE IF NOT EXISTS staging.compra (
  id_compra     int,
  fecha         date,
  id_producto   int,
  cantidad      int,
  precio        numeric(14,2),
  id_proveedor  int
);

-- Gasto
CREATE TABLE IF NOT EXISTS staging.gasto (
  id_gasto       int,
  id_sucursal    int,
  id_tipo_gasto  int,
  fecha          date,
  monto          numeric(14,2)
);

-- Productos
CREATE TABLE IF NOT EXISTS staging.productos (
  id_producto  int,
  concepto     text,
  tipo         text,
  precio       numeric(14,2)
);

CREATE TABLE IF NOT EXISTS staging.productos_rechazados (
    id_producto text,
    concepto text,
    tipo text,
    precio text,
    motivo text
);

-- Proveedores
CREATE TABLE IF NOT EXISTS staging.proveedores (
  id_proveedor int,
  nombre       text,
  direccion    text,
  ciudad       text,
  estado       text,
  pais         text,
  departamento text
);

-- Sucursales
CREATE TABLE IF NOT EXISTS staging.sucursales (
  id_sucursal int,
  sucursal    text,
  direccion   text,
  localidad   text,
  provincia   text,
  latitud     numeric(13,10),
  longitud    numeric(13,10)
);

-- Tipos de gasto
CREATE TABLE IF NOT EXISTS staging.tipos_de_gasto (
  id_tipo_gasto    int,
  descripcion      text,
  monto_aproximado numeric(14,2)
);

-- Venta
CREATE TABLE IF NOT EXISTS staging.venta (
  id_venta       int,
  fecha          date,
  fecha_entrega  date,
  id_canal       int,
  id_cliente     int,
  id_sucursal    int,
  id_empleado    int,
  id_producto    int,
  precio         numeric(14,2),
  cantidad       int
);