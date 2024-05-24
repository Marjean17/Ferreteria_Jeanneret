use ferreteria3hermanos, mysql;

-- Creo un usuario Admin y le doy todos los privilegios
CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON ferreteria3hermanos.* TO 'admin'@'%';
FLUSH PRIVILEGES;

-- CREACION DE ROLES Y ASGNACION DE PRIVILEGIOS
CREATE ROLE IF NOT EXISTS role_compras_caba;
GRANT SELECT ON ferreteria3hermanos.proveedores TO role_compras_caba;
GRANT SELECT ON ferreteria3hermanos.descripcion_productos TO role_compras_caba;
GRANT SELECT ON ferreteria3hermanos.stock TO role_compras_caba;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.proveedorescaba TO role_compras_caba;
GRANT SELECT, INSERT ON ferreteria3hermanos.factura_compra TO role_compras_caba;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.detalle_compra TO role_compras_caba;

CREATE ROLE IF NOT EXISTS role_compras_interior;
GRANT SELECT ON ferreteria3hermanos.proveedores TO role_compras_interior;
GRANT SELECT ON ferreteria3hermanos.descripcion_productos TO role_compras_interior;
GRANT SELECT ON ferreteria3hermanos.stock TO role_compras_interior;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.proveedoresinterior TO role_compras_interior;
GRANT SELECT, INSERT ON ferreteria3hermanos.factura_compra TO role_compras_interior;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.detalle_compra TO role_compras_interior;

CREATE ROLE IF NOT EXISTS role_ventas;
GRANT SELECT ON ferreteria3hermanos.clientes TO role_ventas;
GRANT SELECT ON ferreteria3hermanos.descripcion_productos TO role_ventas;
GRANT SELECT ON ferreteria3hermanos.stock TO role_ventas;
GRANT SELECT, INSERT ON ferreteria3hermanos.factura_venta TO role_ventas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.detalle_venta TO role_ventas;


CREATE ROLE IF NOT EXISTS role_jefe_compras;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.proveedores TO role_jefe_compras;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.stock TO role_jefe_compras;

CREATE ROLE IF NOT EXISTS role_jefe_ventas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.clientes TO role_jefe_ventas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3hermanos.stock TO role_jefe_ventas;

-- CREACION DE USUARIOS Y ASIGNACION DE ROLES

CREATE USER IF NOT EXISTS 'juan'@'%' IDENTIFIED BY '111' COMMENT "Equipo de Compras - CABA";
GRANT role_compras_caba TO 'juan'@'%';

CREATE USER IF NOT EXISTS 'Pedro'@'%' IDENTIFIED BY '222' COMMENT "Equipo de Compras - Interior";
GRANT role_compras_interior TO 'Pedro'@'%';

CREATE USER IF NOT EXISTS 'Maria'@'%' IDENTIFIED BY '333' COMMENT "Equipo de Ventas";
GRANT role_ventas TO 'Maria'@'%';

CREATE USER IF NOT EXISTS 'Lucas'@'%' IDENTIFIED BY '111' COMMENT "Jefe - Equipo de Compras";
GRANT role_compras_caba, role_compras_interior, role_jefe_compras TO 'Lucas'@'%';

CREATE USER IF NOT EXISTS 'Marcos'@'%' IDENTIFIED BY '111' COMMENT "Jefe - Equipo de Ventas";
GRANT role_ventas, role_jefe_ventas TO 'Marcos'@'%';

FLUSH PRIVILEGES;
