USE ferreteria3Hermanos;
SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/proveedores.csv'
INTO TABLE proveedores
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(CUIT_PROV
,NOMBRE_PROV
,DIREC_PROV
,TEL_PROV) ;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/clientes.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/producto_por_proveedor.csv'
INTO TABLE producto_por_proveedor
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/descripcion_productos.csv'
INTO TABLE descripcion_productos
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/factura_compra.csv'
INTO TABLE factura_compra
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/factura_venta.csv'
INTO TABLE factura_venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/detalle_compra.csv'
INTO TABLE detalle_compra
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/detalle_venta.csv'
INTO TABLE detalle_venta
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = true;
LOAD DATA LOCAL INFILE '/structure/data-csv/stock.csv'
INTO TABLE stock
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
