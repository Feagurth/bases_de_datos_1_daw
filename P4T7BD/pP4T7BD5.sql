delimiter $$
create procedure pP4T7BD5()
begin

	-- Declaramos una variable para controlar el manejador de errores del cursor
	declare ultimo_registro int default 0;

	-- Declaramos un contador para controlar las iteraciones
	-- del bucle
	declare contador int default 1;

	-- Declaramos una variable para almacenar el id del equipo del cursor equipos	
	declare iequipo int default 0;

	-- Declaramos una variable para almacenar el nombre del equipo del cursor equipos	
	declare nombre_equipo varchar(50) default null;

	-- Declaramos una variable para almacenar la cantidad de partidos jugados por equipo
	declare partidos_jugados int default 0;

	-- Declaramos una variable para almacenar cual es el número máximo de partidos jugados
	declare maximo_partidos int default 0;

	-- Declaramos un cursor que contenga todos los equipos que han jugado entre sí
	declare equipos cursor for 
		select id_equipo, nombre from equipos order by id_equipo;

	-- Declaramos el manejador de errores para el cursor
	-- Si el cursor no devuelve valores la variable ultimo_registro se pone a 1
	declare continue handler for not found set ultimo_registro = 1;

	-- Abrimos el cursor
	open equipos;

	-- Creamos una tabla para mostrar los resultados
	create table tmpTabla(id int, nom_equipo varchar(50), jugados int);

	-- Iniciamos un bucle
	bucle_loop: loop

		-- Leemos la información del cursor
		fetch equipos into iequipo, nombre_equipo;

		-- Verificamos si quedan registros por leer en el cursor
		if ultimo_registro = 1 then
			-- Si no es así, cerramos el cursor
			close equipos;

			-- Salimos del bucle
			leave bucle_loop;
		end if;

		-- Calculamos el número de partidos jugados por el equipos
		select count(*) into partidos_jugados 
							from (	select * from partidos where elocal = iequipo
									union
									select * from partidos where evisitante = iequipo) as num_partidos;

		-- Insertamos los valores recopilados en la tabla temporal
		insert into tmpTabla values (contador, nombre_equipo, partidos_jugados);

		-- Comprobamos si los partidos jugados existentes en la iteración
		-- es mayor que el almacenado en la variable a tal fin
		if maximo_partidos < partidos_jugados then
			-- Si es mayor, sobreescribimos su valor con el de los partidos jugados
			set maximo_partidos = partidos_jugados;			
		end if;

		-- Incrementamos el contador
		set contador = contador + 1;

		-- Fin del bucle
	end loop bucle_loop;

	-- Mostramos los datos de la tabla temporal
	select nom_equipo As Equipo, jugados as PartidosJugados from tmpTabla where jugados = maximo_partidos;

	-- Eliminamos la tabla temporal
	drop table tmpTabla;

end; $$

-- Prueba del procedimiento
call pP4T7BD5();