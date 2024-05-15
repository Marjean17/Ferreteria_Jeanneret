use mysql;

--CREATE USER IF NOT EXISTS
CREATE USER IF NOT EXISTS 'admin'@'%' INDENTIFIED BY '123';

--GRANT ALL PRIVILEGES
GRANT ALL PRIVILEGES ON ferreteria_jeanneret.* TO 'admin'@'%' WHIT GRANT OPTION;
FLUSH PRIVILEGES;

USE ferreteria_jeanneret;


-- CREACION DE ROLES Y ASGNACION DE PRIVILEGIOS
CREATE ROLE role_compras_caba;

GRANT SELECT ON ferreteria_jeanneret.proveedores 
GRANT UPDATE, DELETE ON 
      ferreteria_jeanneret.proveedores
    , ferreteria_jeanneret.factura_compra
    , ferreteria_jeanneret.detalle_compra 
WHERE DIREC_PROV LIKE '%CABA' TO role_compras_caba;


CREATE ROLE role_compras_interior;

GRANT SELECT ON ferreteria_jeanneret.proveedores 
GRANT UPDATE, DELETE ON 
      ferreteria_jeanneret.proveedores
    , ferreteria_jeanneret.factura_compra
    , ferreteria_jeanneret.detalle_compra 
WHERE DIREC_PROV NOT LIKE '%CABA' TO role_compras_interior;


CREATE ROLE role_ventas;

GRANT SELECT ON ferreteria_jeanneret.clientes, stock 
GRANT UPDATE, DELETE ON 
      ferreteria_jeanneret.clientes
    , ferreteria_jeanneret.factura_venta
    , ferreteria_jeanneret.detalle_venta
TO role_ventas;

-- CREACION DE USUARIOS Y ASIGNACION DE ROLES

CREATE USER IF NOT EXISTS 'juan'@'%' INDENTIFIED BY '111' COMMENT 'Equipo de Compras - CABA';
GRANT role_compras_caba TO 'juan'@'%';

CREATE USER IF NOT EXISTS 'Pedro'@'%' INDENTIFIED BY '222' COMMENT 'Equipo de Compras - Interior';
GRANT role_compras_interior TO 'Pedro'@'%';

CREATE USER IF NOT EXISTS 'Maria'@'%' INDENTIFIED BY '333' COMMENT 'Equipo de Ventas';
GRANT role_compras_interior TO 'Maria'@'%';

FLUSH PRIVILEGES;