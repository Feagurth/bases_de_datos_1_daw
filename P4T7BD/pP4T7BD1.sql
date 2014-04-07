delimiter $$
create procedure pP4T7BD1()
begin
	
	-- Declaramos una variable para controlar el manejador de errores del cursor
	declare ultimo_registro int default 0;

	-- Declaramos una variable para contar el número de iteraciones
	declare contador int default 1;

	-- Declaramos variables para almacenar los valores a
	-- introducir en la tabla
	declare equipo_local varchar(50) default null;
	declare equipo_visitante varchar(50) default null;
	declare valor_puntuacion varchar(50) default null;

	-- Declaramos un cursor para que almacene
	-- el id de los partidos con puntuación de 90
	-- para el equipo local o para el visitante
	declare partidos cursor for 
		select elocal, evisitante, resultado from partidos where instr(resultado, '90');

	-- Declaramos el manejador de errores para el cursor
	-- Si el cursor no devuelve valores la variable ultimo_registro se pone a 1
	declare continue handler for not found set ultimo_registro = 1;

	-- Abrimos el cursor	
	open partidos;

	-- Creamos una tabla temporal para almacenar los resultados	
	create table tmpTabla(id int, eLocal varchar(50), eVisitante varchar(50), puntuacion varchar(50));

	-- Iniciamos un bucle para iterar por todos los registros del cursor
	bucle_loop: loop

		-- Leemos el registro del cursor y lo almacenamos en las variables
		fetch partidos into equipo_local, equipo_visitante, valor_puntuacion;

		-- Comprobamos si el cursor contiene datos
		if ultimo_registro = 1 then
			-- Si no los tiene cerramos el cursor antes de salir del bucle
			close partidos;

			-- Salimos del bucle
			leave bucle_loop;
		end if;
			
		-- Pasamos el nombre del equipo visitante a la variable correpondiente
		select nombre into equipo_visitante from equipos where id_equipo = equipo_visitante;

		-- Pasamos el nombre del equipo local a la variable correpondiente
		select nombre into equipo_local from equipos where id_equipo = equipo_local;

		-- Insertamos los datos que ha devuelto el cursor y los derivados de las select en la
		-- tabla temporal
		insert into tmpTabla values (contador, 
									equipo_local, 
									equipo_visitante, 
									valor_puntuacion);
		-- Aumentamos el contador
		set contador = contador + 1;
		-- Fin del bucle
	end loop bucle_loop;

	-- Mostramos la información de la tabla temporal
	select eLocal as 'Local', eVisitante as Visitante, puntuacion as Resultado from tmpTabla;

	-- Eliminamos la tabla temporal
	drop table tmpTabla;

end; $$

-- Prueba del procedimiento
call pP4T7BD1();