USE ferreteria3Hermanos;
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

delete from clientes WHERE ape_cli='Maidana';
select * from cambios_log;
