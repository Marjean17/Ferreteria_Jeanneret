-- -------- CREACIÓN DE BASE -----------------

DROP SCHEMA IF EXISTS ferreteria3Hermanos;
CREATE SCHEMA ferreteria3Hermanos;
USE ferreteria3Hermanos;

-- -------- CREACIÓN DE TABLAS -----------------

-- drop table if exists proveedores;
CREATE TABLE IF NOT EXISTS proveedores(
  ID_PROV INT NOT NULL AUTO_INCREMENT,
  CUIT_PROV VARCHAR(20),
  NOMBRE_PROV VARCHAR(25) NOT NULL,
  DIREC_PROV VARCHAR(50) NOT NULL,
  TEL_PROV VARCHAR(20) NOT NULL UNIQUE,
  PRIMARY KEY (ID_PROV)
);

-- drop table if exists descripcion_productos;
CREATE TABLE IF NOT EXISTS descripcion_productos(
  COD_PRO INT NOT NULL AUTO_INCREMENT,
  NOMBRE_PRO VARCHAR(25) NOT NULL,
  DESCR_PRO VARCHAR(100) DEFAULT "Sin información",
  TIEMPO DATETIME,
  PRIMARY KEY (COD_PRO)
);

-- drop table if exists producto_por_proveedor;
CREATE TABLE IF NOT EXISTS producto_por_proveedor(
  ID_PROV INT NOT NULL,
  COD_PRO INT NOT NULL,
  VAL_COS DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  VAL_VTA DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  TIEMPO DATETIME,
  PRIMARY KEY (ID_PROV, COD_PRO),
  FOREIGN KEY (ID_PROV) REFERENCES proveedores(ID_PROV),
  FOREIGN KEY (COD_PRO) REFERENCES descripcion_productos(COD_PRO)
);

-- drop table if exists clientes;
CREATE TABLE IF NOT EXISTS clientes(
  ID_CLI INT NOT NULL AUTO_INCREMENT,
  APE_CLI VARCHAR(25) NOT NULL,
  NOM_CLI VARCHAR(25) NOT NULL,
  DIR_CLI VARCHAR(50) NOT NULL,
  TEL_CLI VARCHAR(20) NOT NULL,
  CON_TRI VARCHAR(25),
  NAC DATE,
  TIEMPO DATETIME,
  PRIMARY KEY (ID_CLI)
);

-- drop table if exists factura_compra;
CREATE TABLE IF NOT EXISTS factura_compra(
  FAC_CPA INT NOT NULL AUTO_INCREMENT,
  ID_PROV INT NOT NULL,
  TIEMPO DATETIME,
  PRIMARY KEY (FAC_CPA),
  FOREIGN KEY (ID_PROV) REFERENCES proveedores(ID_PROV)
);

-- drop table if exists detalle_compra;
CREATE TABLE IF NOT EXISTS detalle_compra(
  FAC_CPA INT NOT NULL,
  COD_PRO INT NOT NULL,
  CAN_PRO INT NOT NULL,
  VAL_CPA DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  TIEMPO DATETIME,
  PRIMARY KEY (FAC_CPA, COD_PRO),
  FOREIGN KEY (FAC_CPA) REFERENCES factura_compra(FAC_CPA),
  FOREIGN KEY (COD_PRO) REFERENCES descripcion_productos(COD_PRO)
);

-- drop table if exists factura_venta;
CREATE TABLE IF NOT EXISTS factura_venta(
  FAC_VTA INT NOT NULL AUTO_INCREMENT,
  ID_CLI INT NOT NULL,
  TIEMPO DATETIME,
  PRIMARY KEY (FAC_VTA),
  FOREIGN KEY (ID_CLI) REFERENCES clientes(ID_CLI)
);

-- drop table if exists detalle_venta;
CREATE TABLE IF NOT EXISTS detalle_venta(
  FAC_VTA INT NOT NULL,
  COD_PRO INT NOT NULL,
  CAN_PRO INT NOT NULL,
  VAL_VTA DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
  TIEMPO DATETIME,
  PRIMARY KEY (FAC_VTA, COD_PRO),
  FOREIGN KEY (FAC_VTA) REFERENCES factura_venta(FAC_VTA),
  FOREIGN KEY (COD_PRO) REFERENCES descripcion_productos(COD_PRO)
);

-- drop table if exists stock;
CREATE TABLE IF NOT EXISTS stock(
  COD_PRO INT NOT NULL,
  CAN_PRO INT NOT NULL,
  TIEMPO DATETIME,
  PRIMARY KEY (COD_PRO),
  FOREIGN KEY (COD_PRO) REFERENCES descripcion_productos(COD_PRO)
);


-- -------- CREACIÓN DE VISTAS -----------------
-- 1) Vamos a ver quienes fueron los 3 mejores clientes
CREATE OR REPLACE VIEW mejoresClientes AS
    SELECT 
        c.APE_CLI
    ,   c.NOM_CLI
    ,   c.TEL_CLI
    ,   dv.VAL_VTA
    FROM
        CLIENTES AS c
            JOIN
        factura_venta AS fv
        ON fv.ID_CLI = c.ID_CLI
			JOIN
		detalle_venta AS dv
        ON dv.FAC_VTA= fv.FAC_VTA
    ORDER BY VAL_VTA DESC
    LIMIT 3
;
SELECT * FROM mejoresClientes;
SELECT * FROM mejoresClientes limit 1 offset 2; -- si quiero solo el 3ro

-- 2) Vamos a ver quienes fueron los 2 proveedores que mas nos vendieron
CREATE OR REPLACE VIEW mayoresProveedores AS
    SELECT 
        p.NOMBRE_PROV
    ,   p.TEL_PROV
    ,   dc.VAL_CPA
    FROM
        PROVEEDORES AS p
            JOIN
        factura_compra AS fc
        ON fc.ID_PROV = p.ID_PROV
			JOIN
		detalle_compra AS dc
        ON dc.FAC_CPA = fc.FAC_CPA
    ORDER BY VAL_CPA DESC
    LIMIT 2
;
SELECT * FROM mayoresProveedores;

-- 3) Vamos a ver a los proveedores que están en CABA 
CREATE OR REPLACE VIEW proveedoresCABA AS
	SELECT * FROM proveedores
    WHERE DIREC_PROV LIKE '%CABA';
SELECT * FROM proveedoresCABA;

-- 4) Vamos a ver a los proveedores que están en el interior 
CREATE OR REPLACE VIEW proveedoresInterior AS
	SELECT * FROM proveedores
    WHERE DIREC_PROV NOT LIKE '%CABA%';
SELECT * FROM proveedoresInterior;

-- 5) Mostramos apellido y nombre por separado de los clientes y despues los concatenamos

create or replace view nombreCompleto as
select concat(nom_cli,' ',ape_cli) as nc
from clientes; 

select substring_index(nc,' ',1) from nombreCompleto;
select substring_index(nc,' ',-1) from nombreCompleto;
select * FROM nombreCompleto;


-- -------- CREACIÓN DE FUNCIONES -----------------

-- 1) Reternamos la descripción de un producto
drop function if exists fMostrarDescr;
delimiter //
create function fMostrarDescr (p_nombre varchar(200))
returns varchar(200)
deterministic
begin
		declare descrBuscada varchar(200);
			select descr_pro into descrBuscada 
			from descripcion_productos 
			where nombre_pro = p_nombre;
            
	return descrBuscada;
end //
delimiter ;

select fMostrarDescr('destornillador') AS descripcion;


-- 2) Retornamos el teléfono de un cliente
drop function if exists fMostrarTelCli;
delimiter //
create function fMostrarTelCli (c_apellido varchar(200))
returns varchar(200)
deterministic
begin
		declare telCliente varchar(200);
			select tel_cli into telCliente 
			from clientes 
			where ape_cli = c_apellido;
            
	return telCliente;
end //
delimiter ;
select fMostrarTelCli('Martínez') AS 'teléfono del cliente';

-- -------- CREACIÓN DE STORE PROCEDURES -----------------

-- 1) Vemos los 3 clientes que mas compraron x producto

drop procedure if exists sp_cliente_x_producto;

DELIMITER //

CREATE PROCEDURE sp_cliente_x_producto (IN p_cod_pro INT)
BEGIN
    DECLARE v_Nom_cli VARCHAR(50);
    DECLARE v_ape_cli VARCHAR(50);
    DECLARE v_tel_cli VARCHAR(20);
    DECLARE v_nombre_pro VARCHAR(20);
    DECLARE v_veces_comprado INT;
    
    SELECT c.Nom_cli, c.ape_cli, c.tel_cli, dp.nombre_pro, COUNT(*) AS veces_comprado
    INTO v_Nom_cli, v_ape_cli, v_tel_cli, v_nombre_pro, v_veces_comprado
    FROM clientes AS c
    JOIN factura_venta AS fv ON fv.id_cli = c.id_cli
    JOIN detalle_venta AS dv ON dv.fac_vta = fv.fac_vta
    JOIN descripcion_productos AS dp ON dp.cod_pro = dv.cod_pro
    WHERE dp.cod_pro = p_cod_pro
    GROUP BY c.Nom_cli, c.ape_cli, c.tel_cli, dp.nombre_pro
    ORDER BY veces_comprado DESC
    LIMIT 3;
    
    -- Devolver el resultado
    SELECT v_Nom_cli, v_ape_cli, v_tel_cli, p_cod_pro, v_nombre_pro, v_veces_comprado;
END //

DELIMITER ;

call sp_cliente_x_producto(3);

-- 2) Vemos Cual fue el producto que mas veces compró un cliente

drop procedure if exists sp_cliente_x_producto_por_apellido;

DELIMITER //

CREATE PROCEDURE sp_cliente_x_producto_por_apellido (IN p_ape_cli VARCHAR(50))
BEGIN
    DECLARE v_Nom_cli VARCHAR(50);
    DECLARE v_ape_cli VARCHAR(50);
    DECLARE v_tel_cli VARCHAR(20);
    DECLARE v_nom_pro_mas_comprado VARCHAR(100);
    DECLARE v_veces_comprado INT;
    
    SELECT c.Nom_cli, c.ape_cli, c.tel_cli
    INTO v_Nom_cli, v_ape_cli, v_tel_cli
    FROM clientes AS c
    WHERE c.ape_cli = p_ape_cli
    LIMIT 1;
    
    SELECT dp.nombre_pro, COUNT(*) AS veces_comprado
    INTO v_nom_pro_mas_comprado, v_veces_comprado
    FROM clientes AS c
    JOIN factura_venta AS fv ON fv.id_cli = c.id_cli
    JOIN detalle_venta AS dv ON dv.fac_vta = fv.fac_vta
    JOIN descripcion_productos AS dp ON dp.cod_pro = dv.cod_pro
    WHERE c.ape_cli = p_ape_cli
    GROUP BY dp.nombre_pro
    ORDER BY veces_comprado DESC
    LIMIT 1;
    
    -- Devolver el resultado
    SELECT v_Nom_cli, v_ape_cli, v_tel_cli, v_nom_pro_mas_comprado, v_veces_comprado;
END //

DELIMITER ;

call sp_cliente_x_producto_por_apellido('Martínez');

-- -------- CREACIÓN DE TRIGGERS -----------------

-- Creamos la tabla de log para registrar cambios
-- drop table if exists cambios_log;
CREATE TABLE IF NOT EXISTS cambios_log (
  ID INT NOT NULL AUTO_INCREMENT,
  TABLA_afectada VARCHAR(50) NOT NULL,
  OPERACION VARCHAR(10) NOT NULL,
  DETALLES VARCHAR(255),
  USUARIO VARCHAR(50),
  FECHA_hora DATETIME,
  PRIMARY KEY (ID)
);

-- Crear el trigger para registrar los ingresos en la tabla proveedores
-- drop trigger if exists trg_crearProv;
DELIMITER $$
CREATE TRIGGER trg_crearProv AFTER INSERT ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'INSERT', CONCAT('Se insertó un nuevo proveedor con ID ', NEW.ID_PROV),current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo
insert into proveedores values(11,'20-22222222-2','cuquin','que se yo 777', '111111111111');
select * from cambios_log;

-- Crear el trigger para registrar los cambios en la tabla proveedores
-- drop trigger if exists trg_modificarProv;
DELIMITER $$
CREATE TRIGGER trg_modificarProv BEFORE UPDATE ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'UPDATE', CONCAT('Se realizó un cambio en un proveedor con ID ', OLD.ID_PROV), current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo
set sql_safe_updates=0;

update proveedores set nombre_prov='Diamante' WHERE nombre_prov='cuquin';
select * from cambios_log;

-- Crear el trigger para registrar las eliminaciones en la tabla proveedores
-- drop trigger if exists trg_borrarProv;
DELIMITER $$
CREATE TRIGGER trg_borrarProv BEFORE DELETE ON proveedores
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('proveedores', 'DELETE', CONCAT('Se eliminó el proveedor con ID ', OLD.ID_PROV), current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo

delete from proveedores WHERE nombre_prov='Diamante';
select * from cambios_log;

-- 4) Crear el trigger para registrar los ingresos en la tabla clientes
-- drop trigger if exists trg_crearCli;
DELIMITER $$
CREATE TRIGGER trg_crearCli AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'INSERT', CONCAT('Se insertó un nuevo Cliente con CUIT ', NEW.ID_CLI),current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo
insert into clientes values(11,'piquin','lucas','que se yo 222', '111111111111','RESPONSABLE INSCRIPTO', NULL,NULL);
select * from cambios_log;

-- 5) Crear el trigger para registrar los cambios en la tabla clientes
-- drop trigger if exists trg_modificarCli;
DELIMITER $$
CREATE TRIGGER trg_modificarCli BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'UPDATE', CONCAT('Se realizó un cambio en un cliente con CUIT ', OLD.ID_CLI), current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo
set sql_safe_updates=0;

update clientes set APE_CLI='Maidana' WHERE APE_CLI='piquin';
select * from cambios_log;

-- 6) Crear el trigger para registrar las eliminaciones en la tabla clientes
-- drop trigger if exists trg_borrarCli;
DELIMITER $$
CREATE TRIGGER trg_borrarCli BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
  INSERT INTO cambios_log (TABLA_afectada, OPERACION, DETALLES, USUARIO, FECHA_hora)
  VALUES ('clientes', 'DELETE', CONCAT('Se eliminó el cliente con CUIT ', OLD.ID_CLI), current_user(), NOW());
END$$
DELIMITER ;
-- ejemplo

delete from CLIENTES WHERE ape_cli='Maidana';
select * from cambios_log;
