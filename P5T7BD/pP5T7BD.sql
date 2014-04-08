delimiter $$
-- Crea un procedimiento llamado pP5T7BD para crear una nueva tabla llamada clasificación que tenga dos campos: 
-- el campo id_equipo (que es clave ajena de la tabla equipos) y otro campo llamado puesto. Después realiza una 
-- inserción de registros en la tabla clasificación, para que se añadan id de equipos y posición que ocupa en función 
-- de comprobar equipos que tengan menos puntos que él.
create procedure pP5T7BD()

begin

	-- Declaramos una variable para controlar el manejador de errores del cursor
	declare ultimo_registro int default 0;

	-- Declaramos un variable para almacenar el id del equipo y otra los puntos
	declare iequipo int default 0;
	declare puntos_equipo int(11) default 0;

	-- Declaramos una variable para almacenar el número de equipos que tienen una puntuación 	inferior a la del equipo actual
	declare equipos_puntuacion_inferior int(11) default 0;

	-- Declaramos un cursor para los equipos
	declare equipos cursor for
		select id_equipo, puntos from equipos order by id_equipo;

	-- Declaramos el manejador de errores para el cursor
	-- Si el cursor no devuelve valores la variable ultimo_registro se pone a 1
	declare continue handler for not found set ultimo_registro = 1;

	-- Eliminamos la tabla clasificacion si está creada anteriormente
	drop table if exists clasificacion;

	-- Creamos la tabla clasificación
	create table clasificacion (id_equipo int not null, puesto int not null default 0, primary key(id_equipo), 
								foreign key (id_equipo) references equipos(id_equipo) on delete cascade on update cascade);

	-- Abrimos el cursor
	open equipos;

	--  Realizamos un bucle para iterar por todos los registros del cursor
	bucle_loop: loop

		-- Leemos el cursor
		fetch equipos into iequipo, puntos_equipo;

		-- Verificamos si quedan registros por leer en el cursor
		if ultimo_registro = 1 then
			-- Si no es así, cerramos el cursor
			close equipos;

			-- Salimos del bucle
			leave bucle_loop;
		end if;

		-- Vemos cuantos equipos tienen una puntuación inferior a la del equipo en esta iteración
		-- y lo almacenamos en una variable
		select count(*) into equipos_puntuacion_inferior from equipos where puntos < puntos_equipo;

		-- Insertamos la cantidad de equipos con puntuación inferior al actual en la tabla
		-- clasificacion
		insert into clasificacion values(iequipo, equipos_puntuacion_inferior);
			
	end loop bucle_loop;
end; $$

-- Prueba del procedimiento
call pP5T7BD();