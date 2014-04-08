DELIMITER $$ 
-- Crea un disparador dP5T7BD2 para que cada vez que se actualice el campo puntos de un equipo se compruebe si es mayor que alguno de los 
-- demás y si es así se debe actualizar el campo posición de los equipos implicados.

-- Borramos el disparador si existe anteriormente
drop trigger if exists dP5T7BD2;

-- Creamos el disparador para que se lanze cada vez que haya una insercción en la tabla partidos
create trigger dP5T7BD2 after update on equipos for each row 
begin
 
	-- Declaramos una variable para almacenar la cantidad de quipos inferiores en puntuación
	declare equipos_puntuacion_inferior int(11) default 0;

	-- Calculamos cuantos equipos con puntuación inferiores tenemos
	select count(*) into equipos_puntuacion_inferior from equipos where puntos < new.puntos;

	-- Actualizamos el campo puesto con la cantidad de equipos con puntación inferior
	update clasificacion set puesto = equipos_puntuacion_inferior where id_equipo = new.id_equipo;

END; $$