-- EA3/staging/staging_jardineria.sql
-- =====================================
-- CREACION DE TABLAS STAGING
-- =====================================

DROP TABLE IF EXISTS stg_clientes;
DROP TABLE IF EXISTS stg_productos;
DROP TABLE IF EXISTS stg_pedidos;
DROP TABLE IF EXISTS stg_detalle_pedidos;

CREATE TABLE stg_clientes (
    codigo_cliente INTEGER,
    nombre_cliente TEXT,
    nombre_contacto TEXT,
    apellido_contacto TEXT,
    telefono TEXT,
    ciudad TEXT,
    pais TEXT,
    credito REAL
);

CREATE TABLE stg_productos (
    codigo_producto INTEGER,
    nombre_producto TEXT,
    categoria TEXT,
    precio REAL,
    stock INTEGER
);

CREATE TABLE stg_pedidos (
    numero_pedido INTEGER,
    codigo_cliente INTEGER,
    fecha_pedido TEXT,
    total REAL
);

CREATE TABLE stg_detalle_pedidos (
    numero_pedido INTEGER,
    codigo_producto INTEGER,
    cantidad INTEGER,
    precio_unitario REAL
);

-- =====================================
-- INSERTAR DATOS
-- =====================================

INSERT INTO stg_clientes VALUES
(1,'Floristería Medellín','Ana','Gómez','3101234567','Medellín','Colombia',5000000.0),
(2,'Jardines Bogotá','Luis','Pérez','3129876543','Bogotá','Colombia',3000000.0),
(3,'Verde Vivo Cali','Carla','Martínez','3155558888','Cali','Colombia',4000000.0),
(4,'Flores Barranquilla','Diego','Rodríguez','3162223333','Barranquilla','Colombia',3500000.0),
(5,'Mi Jardín Bucaramanga','Sofía','López','3177778888','Bucaramanga','Colombia',2500000.0);

INSERT INTO stg_productos VALUES
(101,'Rosa Roja','Flores',5000.0,100),
(102,'Fertilizante Orgánico','Insumos',20000.0,50),
(103,'Orquídea Azul','Flores',25000.0,30),
(104,'Cactus Mini','Plantas',15000.0,40),
(105,'Tierra Fértil','Insumos',10000.0,200);

INSERT INTO stg_pedidos VALUES
(1001,1,'2026-03-28',150000.0),
(1002,2,'2026-03-27',200000.0),
(1003,3,'2026-03-26',300000.0),
(1004,4,'2026-03-25',120000.0),
(1005,5,'2026-03-24',80000.0);

INSERT INTO stg_detalle_pedidos VALUES
(1001,101,10,5000.0),
(1001,102,3,20000.0),
(1002,103,5,25000.0),
(1002,105,4,10000.0),
(1003,101,20,5000.0),
(1003,103,6,25000.0),
(1003,104,3,15000.0),
(1004,104,4,15000.0),
(1004,105,2,10000.0),
(1005,105,8,10000.0);

-- =====================================
-- CONSULTAS DE VERIFICACION (CALIDAD DE DATOS)
-- =====================================

-- Ver todos los clientes
SELECT * FROM stg_clientes;

-- Ver todos los productos
SELECT * FROM stg_productos;

-- Ver pedidos
SELECT * FROM stg_pedidos;

-- Ver detalle de pedidos
SELECT * FROM stg_detalle_pedidos;

-- Validar valores nulos
SELECT * FROM stg_clientes WHERE nombre_cliente IS NULL;

-- Validar totales de ventas
SELECT SUM(total) AS total_ventas FROM stg_pedidos;
