USE mysql;

-- Creo un usuario Admin y le doy todos los privilegios
/*CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON ferreteria3Hermanos.* TO 'admin'@'%';
FLUSH PRIVILEGES;*/

-- CREACION DE ROLES Y ASGNACION DE PRIVILEGIOS

DROP ROLE IF EXISTS 
    role_compras_caba
,   role_compras_interior
,   role_ventas
,   role_jefe_ventas
,   role_jefe_compras ;


CREATE ROLE IF NOT EXISTS role_compras_caba;
CREATE ROLE IF NOT EXISTS role_compras_interior;
CREATE ROLE IF NOT EXISTS role_ventas;
CREATE ROLE IF NOT EXISTS role_jefe_ventas;
CREATE ROLE IF NOT EXISTS role_jefe_compras;

GRANT SELECT ON ferreteria3Hermanos.proveedores TO role_compras_caba;
GRANT SELECT ON ferreteria3Hermanos.descripcion_productos TO role_compras_caba;
GRANT SELECT ON ferreteria3Hermanos.stock TO role_compras_caba;
GRANT SELECT ON ferreteria3Hermanos.proveedoresCABA TO role_compras_caba ;
GRANT SELECT, INSERT ON ferreteria3Hermanos.factura_compra TO role_compras_caba;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.detalle_compra TO role_compras_caba;


GRANT SELECT ON ferreteria3Hermanos.proveedores TO role_compras_interior;
GRANT SELECT ON ferreteria3Hermanos.descripcion_productos TO role_compras_interior;
GRANT SELECT ON ferreteria3Hermanos.stock TO role_compras_interior;
GRANT SELECT ON ferreteria3Hermanos.proveedoresInterior TO role_compras_interior WITH GRANT OPTION;
GRANT SELECT, INSERT ON ferreteria3Hermanos.factura_compra TO role_compras_interior;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.detalle_compra TO role_compras_interior;


GRANT SELECT ON ferreteria3Hermanos.clientes TO role_ventas;
GRANT SELECT ON ferreteria3Hermanos.descripcion_productos TO role_ventas;
GRANT SELECT ON ferreteria3Hermanos.stock TO role_ventas;
GRANT SELECT, INSERT ON ferreteria3Hermanos.factura_venta TO role_ventas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.detalle_venta TO role_ventas;



GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.proveedores TO role_jefe_compras;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.stock TO role_jefe_compras;
grant role_compras_caba to role_jefe_compras;
grant role_compras_interior to role_jefe_compras;

GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.clientes TO role_jefe_ventas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ferreteria3Hermanos.stock TO role_jefe_ventas;
grant role_ventas to role_jefe_ventas;
-- CREACION DE USUARIOS Y ASIGNACION DE ROLES
drop user if exists juan;
CREATE USER IF NOT EXISTS 'juan'@'%' IDENTIFIED BY '111' COMMENT "Equipo de Compras - CABA";
GRANT role_compras_caba TO 'juan'@'%';
drop user if exists Pedro;
CREATE USER IF NOT EXISTS 'Pedro'@'%' IDENTIFIED BY '222' COMMENT "Equipo de Compras - Interior";
GRANT role_compras_interior TO 'Pedro'@'%';
drop user if exists Maria;
CREATE USER IF NOT EXISTS 'Maria'@'%' IDENTIFIED BY '333' COMMENT "Equipo de Ventas";
GRANT role_ventas TO 'Maria'@'%';
drop user if exists Lucas;
CREATE USER IF NOT EXISTS 'Lucas'@'%' IDENTIFIED BY '111' COMMENT "Jefe - Equipo de Compras";
GRANT role_compras_caba, role_compras_interior, role_jefe_compras TO 'Lucas'@'%';
drop user if exists Marcos;
CREATE USER IF NOT EXISTS 'Marcos'@'%' IDENTIFIED BY '111' COMMENT "Jefe - Equipo de Ventas";
GRANT role_ventas, role_jefe_ventas TO 'Marcos'@'%';

SET DEFAULT ROLE role_compras_caba TO 'juan'@'%'; 
SET DEFAULT ROLE role_compras_interior TO 'Pedro'@'%';
SET DEFAULT ROLE role_ventas TO 'Maria'@'%';
SET DEFAULT ROLE role_jefe_compras TO 'Lucas'@'%';
SET DEFAULT ROLE role_jefe_ventas TO 'Marcos'@'%';
FLUSH PRIVILEGES;
-- SHOW FULL TABLES IN ferreteria3Hermanos WHERE TABLE_TYPE = 'VIEW';
