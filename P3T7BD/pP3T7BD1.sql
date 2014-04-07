delimiter $$
create procedure pP3T7BD1()
begin
	
	-- Declaramos una variable para almacenar el número
	-- de registros
	declare numero_registros int default 1;

	-- Declaramos una variable contador para gestionar
	-- las iteraciones del bucle
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

	-- Calculamos el número de registros devueltos y lo almacenamos en una variable
	select count(*) into numero_registros from partidos where instr(resultado, '90');

	-- Abrimos el cursor	
	open partidos;

	-- Creamos una tabla temporal para almacenar los resultados	
	create table tmpTabla(id int, eLocal varchar(50), eVisitante varchar(50), puntuacion varchar(50));

	-- Iniciamos un bucle para iterar por todos los registros del cursor
	bucle_while: while contador <= numero_registros do
			
		-- Leemos el registro del cursor y lo almacenamos en las variables
		fetch partidos into equipo_local, equipo_visitante, valor_puntuacion;

		select nombre into equipo_visitante from equipos where id_equipo = equipo_visitante;

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
	end while bucle_while;

	-- Cerramos el cursor	
	close partidos;

	-- Mostramos la información de la tabla temporal
	select eLocal as 'Local', eVisitante as Visitante, puntuacion as Resultado from tmpTabla;

	-- Eliminamos la tabla temporal
	drop table tmpTabla;
end; $$

-- Prueba del procedimiento
call pP3T7BD1();