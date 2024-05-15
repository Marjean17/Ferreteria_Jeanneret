use mysql;

--CREATE USER IF NOT EXISTS
CREATE USER IF NOT EXISTS 'admin'@'%' INDENTIFIED BY '123';

--GRANT ALL PRIVILEGES
GRANT ALL PRIVILEGES ON ferreteria_jeanneret.* TO 'admin'@'%' WHIT GRANT OPTION;

FLUSH PRIVILEGES;

USE ferreteria_jeanneret;

-- CREACI0N DE ROLES Y ASGNACION DE PRIVILEGIOS
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

GRANT SELECT ON ferreteria_jeanneret.clientes 
GRANT UPDATE, DELETE ON 
      ferreteria_jeanneret.clientes
    , ferreteria_jeanneret.factura_compra
    , ferreteria_jeanneret.detalle_compra 
WHERE DIREC_PROV NOT LIKE '%CABA' TO role_compras_ventas;