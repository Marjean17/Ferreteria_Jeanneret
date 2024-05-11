USE ferreteria3Hermanos;
-- -------- CREACIÓN DE VISTAS -----------------
-- 1) Vamos a ver quienes fueron los 3 mejores clientes
CREATE OR REPLACE VIEW mejoresClientes AS
    SELECT 
        c.APE_CLI
    ,   c.NOM_CLI
    ,   c.TEL_CLI
    ,   dv.VAL_VTA
    FROM
        clientes AS c
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
        proveedores AS p
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