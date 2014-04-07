delimiter $$
create procedure pP4T7BD2()
begin

	-- Declaramos una variable para controlar el manejador de errores del cursor
	declare ultimo_registro int default 0;

	-- Declaramos un contador para controlar las iteraciones
	-- del bucle
	declare contador int default 1;

	-- Declaramos una variable para almacenar el salario máximo de los
	-- jugadores de un equipo
	declare salario_max int default 0;

	-- Declaramos unas variable para almacenar el nombre y el apellido
	-- del jugador que más cobre
	declare nombre_jugador varchar(50) default null;
	declare apellido_jugador varchar(50) default null;

	-- Declaramos dos variables para volcar posteriormente los valores
	-- almacenados en el cursor
	declare iequipo int default 0;
	declare nombre_equipo varchar(50) default null;

	-- Declaramos un cursor para almacenar el id y el nombre de los equipos
	declare equipos cursor for
		select id_equipo, nombre from equipos order by id_equipo;

	-- Declaramos el manejador de errores para el cursor
	-- Si el cursor no devuelve valores la variable ultimo_registro se pone a 1
	declare continue handler for not found set ultimo_registro = 1;

	-- Creamos una tabla temporal para almacenar los resultados
	create table tmpTabla(id int, equipo varchar(50), n_jugador varchar(50), a_jugador varchar(50), sueldo int);

	-- Inicializamos el cursor
	open equipos;

	-- Iniciamos un bucle para iterar por todos los registros del 
	-- cursor
	bucle_loop: loop

		-- Leemos el registro del cursor y lo almacenamos en las variables
		-- creadas para ello
		fetch equipos into iequipo, nombre_equipo;

		-- Verificamos si quedan registros por leer en el cursor
		if ultimo_registro = 1 then
			-- Si no es así, cerramos el cursor
			close equipos;

			-- Salimos del bucle
			leave bucle_loop;
		end if;

		-- Seleccionamos el salario más alto de los jugadore del equipo cuyo valor
		-- nos ha devuelto el cursor y lo almacenamos en una variable
		select max(salario) into salario_max from jugadores where equipo = iequipo;

		-- Almacenamos tambien el nombre del jugador cuyo salario sea igual al salario máximo de su equipo
		-- y que pertenezca a ese equipo
		select nombre, apellido into nombre_jugador, apellido_jugador from jugadores where salario = salario_max and equipo = iequipo;

		-- Almacenamos el nombre del equipo en una variable	
		select nombre into nombre_equipo from equipos where id_equipo = iequipo;

		-- Insertamos los valores en la tabla temporal
		insert into tmpTabla values(contador, nombre_equipo, nombre_jugador, apellido_jugador, salario_max);

		-- Incrementamos el contador
		set contador = contador + 1;
		-- Fin del bucle
	end loop bucle_loop;

	-- Devolvemos los resultados almacenados en la tabla temporal
	select equipo as Equipo, n_jugador as Nombre, a_jugador as Apellido, sueldo as Salario from tmpTabla;

	-- Eliminamos la tabla
	drop table tmpTabla;
end; $$

-- Prueba del procedimiento
call pP4T7BD2();