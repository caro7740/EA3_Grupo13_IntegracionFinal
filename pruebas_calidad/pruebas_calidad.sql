--pruebas_calidad/pruebas_calidad.sql
-- PRUEBAS DE CALIDAD DE DATOS

-- Verificar que hay datos en clientes
SELECT COUNT(*) AS total_clientes FROM stg_clientes;

-- Verificar que no hay valores nulos
SELECT * FROM stg_clientes WHERE nombre_cliente IS NULL;

-- Verificar productos
SELECT COUNT(*) AS total_productos FROM stg_productos;

-- Verificar pedidos
SELECT COUNT(*) AS total_pedidos FROM stg_pedidos;

-- Validar total de ventas
SELECT SUM(total) AS total_ventas FROM stg_pedidos;

-- Verificar duplicados
SELECT codigo_cliente, COUNT(*)
FROM stg_clientes
GROUP BY codigo_cliente
HAVING COUNT(*) > 1;
