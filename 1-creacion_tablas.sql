DROP SCHEMA IF EXISTS raw CASCADE;
CREATE SCHEMA raw;
-- SET search_path TO raw; --usa el schema raw por defecto


CREATE TABLE IF NOT EXISTS raw.canal_de_venta (
    codigo      TEXT,
    descripcion TEXT
);

CREATE TABLE IF NOT EXISTS raw.clientes (
    id                          TEXT,
    provincia                   TEXT,
    nombre_y_apellido           TEXT,
    domicilio                   TEXT,
    telefono                    TEXT,
    edad                        TEXT,
    localidad                   TEXT,
    x                           TEXT,
    y                           TEXT,
    fecha_alta                  TEXT,
    usuario_alta                TEXT,
    fecha_ultima_modificacion   TEXT,
    usuario_ultima_modificacion TEXT,
    marca_baja                  TEXT,
    col10                       TEXT
);


CREATE TABLE IF NOT EXISTS raw.compra (
    id_compra    TEXT,
    fecha        TEXT,
    id_producto  TEXT,
    cantidad     TEXT,
    precio       TEXT,
    id_proveedor TEXT
);


CREATE TABLE IF NOT EXISTS raw.gasto (
    id_gasto     TEXT,
    id_sucursal  TEXT,
    id_tipo_gasto TEXT,
    fecha        TEXT,
    monto        TEXT
);


CREATE TABLE IF NOT EXISTS raw.productos (
    id_producto TEXT,
    concepto    TEXT,
    tipo        TEXT,
    precio      TEXT
);


CREATE TABLE IF NOT EXISTS raw.proveedores (
    id_proveedor TEXT,
    nombre       TEXT,
    address      TEXT,
    city         TEXT,
    state        TEXT,
    country      TEXT,
    departamen   TEXT
);


CREATE TABLE IF NOT EXISTS raw.sucursales (
    id         TEXT,
    sucursal   TEXT,
    direccion  TEXT,
    localidad  TEXT,
    provincia  TEXT,
    latitud    TEXT,
    longitud   TEXT
);


CREATE TABLE IF NOT EXISTS raw.tipos_de_gasto (
    id_tipo_gasto    TEXT,
    descripcion      TEXT,
    monto_aproximado TEXT
);


CREATE TABLE IF NOT EXISTS raw.venta (
    id_venta     TEXT,
    fecha        TEXT,
    fecha_entrega TEXT,
    id_canal     TEXT,
    id_cliente   TEXT,
    id_sucursal  TEXT,
    id_empleado  TEXT,
    id_producto  TEXT,
    precio       TEXT,
    cantidad     TEXT
);
