USE ferreteria3Hermanos;
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
