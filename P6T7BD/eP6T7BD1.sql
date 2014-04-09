-- Crea un evento eP6T7BD1, que se va a ejecutar dentro de 1 minuto y que va a 
-- crear una tabla llamada registro_salarios con tres campos un id autoincrementable, 
-- hora de tipo time y suma_total de tipo entero. Además va a insertar un registro 
-- con la hora a la que se ejecute y el resultado de una consulta que utilizará una 
-- función de agregación para el cálculo de la suma de los salarios de los jugadores. 
-- Por último, realiza una consulta sobre la tabla registro_salarios, que muestre los 
-- registros que contiene.

delimiter $$
-- Creamos el evento para que se ejecute en la hora 
-- en la que se cree mas un intervalo de 1 minuto
create event eP6T7BD1 on schedule
	at current_timestamp + interval 1 minute

do
	begin
		-- Declaramos una variable para almacenar el total de los salarios de los jugadores
		declare total_salarios integer default 0;

		-- Calculamos la suma del salario de los jugadores y lo almacenamos
		-- en la variable que hemos creado para tal efecto
		select sum(salario) into total_salarios from jugadores;
	
		-- Borramos la tabla si existiese con anterioridad	
		drop table if exists registro_salario;

		-- Creamos la tabla para almacenar los registros
		create table registro_salario(Id int auto_increment, Hora time not null, Suma_Total int not null, primary key(Id));

		-- Insertamos en la tabla el valor de la hora actual y el total de salarios
		-- de los jugadores que hemos calculado
		insert into registro_salario values(0, current_time, total_salarios);
	end;$$

-- Mostramos los resultados
select * from registro_salario;
