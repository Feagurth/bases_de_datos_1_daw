delimiter $$
create procedure pP3T7BD4()
begin

	-- Variable para almacenar el número de registros del cursor
	declare num_registros int default 0;

	-- Declaramos un contador para controlar las iteraciones
	-- del bucle
	declare contador int default 1;

	-- Declaramos una variable para almacenar el id del equipo del cursor equipos	
	declare iequipo int default 0;

	-- Declaramos una variable para almacenar el nombre del equipo del cursor equipos	
	declare nombre_equipo varchar(50) default null;

	-- Declaramos un cursor que contenga todos los equipos que han jugado entre sí
	declare cursor_equipos cursor for 
		select p1.elocal from partidos p1, partidos p2 where  p1.elocal = p2.evisitante and p2.elocal = p1.evisitante;

	select count(*) into num_registros from partidos p1, partidos p2 where  p1.elocal = p2.evisitante and p2.elocal = p1.evisitante;

	-- Abrimos el cursor
	open cursor_equipos;

	-- Creamos una tabla para mostrar los resultados
	create table tmpTabla(id int, nom_equipo varchar(50));

	-- Iniciamos un bucle
	bucle_while: while contador <= num_registros do

		-- Leemos del cursor
		fetch cursor_equipos into iequipo;

		-- Recuperamos el nombre correspondiente de la tabla equipos usando el identificador
		select nombre into nombre_equipo from equipos where id_equipo = iequipo;
	
		-- Cargamos datos en la tabla temporal
		insert into tmpTabla values(contador, nombre_equipo);

		-- Incrementamos el contador
		set contador = contador + 1;

		-- Fin del bucle
	end while bucle_while;

	-- Cerramos el cursor
	close cursor_equipos;

	-- Mostramos los datos de la tabla temporal
	select nom_equipo as NombreEquipo from tmpTabla;
	
	-- Eliminamos la tabla
	drop table tmpTabla;
end; $$

-- Prueba del procedimiento
call pP3T7BD4();