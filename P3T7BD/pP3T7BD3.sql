delimiter $$
create procedure pP3T7BD3()
begin

	-- Variable para almacenar el número de registros del cursor
	declare num_registros int default 0;

	-- Declaramos un contador para controlar las iteraciones
	-- del bucle
	declare contador int default 1;

	-- Declaramos una variable para el número de rivales que tiene cada equipo
	declare rivales_por_equipo int default 0;

	-- Declaramos un variable para almacenar el id del equipo y otra para el nombre
	declare iequipo int default 0;
	declare nombre_equipo varchar(50) default null;

	-- Declaramos una variable para almacenar el número de rivales
	-- mas alto que tengan los equipos.
	declare maximo_rival int default -1;

	-- Declaramos un cursor para los equipos
	declare equipos cursor for
		select id_equipo, nombre from equipos order by id_equipo;

	-- Creamos una tabla para almacenar los valores intermedios
	create table tmpTabla (id int, nom_equipo varchar(50), numero_rivales int);

	-- Almacenamos el valor de los registros de la tabla
	-- equipo en la variable correspondiente
	select count(*) into num_registros from equipos;

	-- Abrimos el cursor	
	open equipos;

	-- Iteramos en un bucle por los valores del cursor
	bucle_while: while contador <= num_registros do
		
		fetch equipos into iequipo, nombre_equipo;

		-- Comprobamos que rivales ha tenido el equipo de la iteración como local
		-- y como visitante y contamos la cantidad, la cual almacenamos un una variable
		select count(*) into rivales_por_equipo from 
				(Select evisitante as rival from partidos where elocal = iequipo
				union
				select elocal as rival from partidos where evisitante = iequipo) as rivales;

		-- Insertamos el nombre del equipo y el número de rivales en una tabla temporal
		insert into tmpTabla values(contador, nombre_equipo, rivales_por_equipo);		
		
		-- Comprobamos si la variable donde almacenamos
		-- el maximo número de rivales es menor que los rivales
		-- de el equipo de la iteración
		if maximo_rival < rivales_por_equipo then
			-- Si es menor, actualizamos si valor
			set maximo_rival = rivales_por_equipo;
		end if;

		-- Incrementamos el contador
		set contador = contador + 1;
		-- Fin del bucle
	end while bucle_while;

	-- Cerramos el cursor
	close equipos;

	-- Seleccionamos de la tabla temporal el equipo cuya número de rivales
	-- sea igual al número máximo de rivales descubierto en las iteraciones
	select nom_equipo as Equipo, numero_rivales as Rivales from tmpTabla where numero_rivales = maximo_rival;

	-- Eliminamos la tabla temporal
	drop table tmpTabla;
end; $$

-- Prueba del procedimiento
call pP3T7BD3();