-- Crea un evento eP6T7BD2, que se va a ejecutar desde que se almacene en el servidor, 
-- repitiéndose cada minuto. Creará una tabla llamada registro_salarios2 con tres campos 
-- como la del ejercicio 1. Además va a insertar un registro cada minuto, con la hora a la 
-- que se ejecute y el resultado de una consulta con una función de agregación con la suma 
-- de los salarios de los jugadores. Después realiza la inserción de un jugador 
-- (fuera del código del evento) para comprobar que la tabla, calcula la suma actualizada del 
-- total del salario de los jugadores. Por último, realiza una consulta sobre la tabla 
-- registro_salarios2, que muestre los registros que contiene.accessible

delimiter $$

-- Creamos el evento que se ejecutará cada minutos desde el momento
-- de su creación
create event eP6T7BD2 on schedule 
	every 1 minute starts current_timestamp + 0
do
	begin
		-- Declaramos una variable para almacenar el total de los salarios de los jugadores
		declare total_salarios integer default 0;

		-- Calculamos la suma del salario de los jugadores y lo almacenamos
		-- en la variable que hemos creado para tal efecto
		select sum(salario) into total_salarios from jugadores;
	
		-- Creamos la tabla para almacenar los registros
		create table if not exists registro_salario2(Id int auto_increment, Hora time not null, Suma_Total int not null, primary key(Id));

		-- Insertamos en la tabla el valor de la hora actual y el total de salarios
		-- de los jugadores que hemos calculado
		insert into registro_salario2 values(0, current_time, total_salarios);
	end; $$

-- Mostramos los resultados
select * from registro_salario2;
