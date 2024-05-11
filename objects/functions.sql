USE ferreteria3Hermanos;
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