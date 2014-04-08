DELIMITER $$ 
-- Crea un disparador dP5T7BD1 para que cada vez que se inserte un registro en la tabla partidos, después se actualicen los campos de puntos de la tabla equipos 
-- incrementando en 1 los puntos del equipo vencedor del partido. (prueba el funcionamiento insertando un par de registros y muestra las capturas de 
-- pantalla de las tablas partidos y equipos, antes y después de activarse el disparador).accessible

-- Borramos el disparador si existe anteriormente
drop trigger if exists dP5T7BD1;

-- Creamos el disparador para que se lanze cada vez que haya una insercción en la tabla partidos
create trigger dP5T7BD1 before insert on partidos for each row 
begin
 
	-- Declaramos dos variables temporales para almacenar las puntuaciones de los dos equipos que se enfrente
	declare temporal1 int default 0;
	declare temporal2 int default 0;

	-- Sacamos la puntuación del equipo local
	set temporal1 = REPLACE(SUBSTRING(SUBSTRING_INDEX(new.resultado, "-", 1), LENGTH(SUBSTRING_INDEX(new.resultado, "-", 1 -1)) + 1), "-", '');

	-- Sacamos la puntuación del equipo visitante
	set temporal2 = REPLACE(SUBSTRING(SUBSTRING_INDEX(new.resultado, "-", 2), LENGTH(SUBSTRING_INDEX(new.resultado, "-", 2 -1)) + 1), "-", '');

	-- Si la puntuación del equipo local es mayor
	if temporal1 > temporal2 then

		-- El equipo local gana y aumentamos la puntuación en uno en la tabla de equipos
		update equipos set puntos = puntos + 1 where id_equipo = new.elocal;
	else

		-- El equipo local pierde y aumentamos la puntuación del rival en uno en la tabla de equipos
		update equipos set puntos = puntos + 1 where id_equipo = new.evisitante;
	end if;
END; $$