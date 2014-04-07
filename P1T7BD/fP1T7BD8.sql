-- Cree una función que devuelva 1 si ganó el visitante, 2 si ganó el equipo local y 0 si es un empate en un 
-- partido tomando como entrada el resultado en formato ‘xxx-xxx’, con el nombre “fP1T7BD8”.
delimiter $$
create function fP1T7BD8(puntuacion varchar(7)) returns int
begin
	declare numero1 int default 0;
	declare numero2 int default 0;

	-- Obtenemos la puntación del equipo local
	set numero1 = instr(puntuacion, "-");
	set numero1 = substring(puntuacion, 1, numero1);

	-- Obtenemos la puntación del equipo visitante
	set numero2 = instr(puntuacion, "-");
	set numero2 = substring(puntuacion, (numero2 +1) ,(length(puntuacion) -(numero2)));

	-- Los dos equipos tienen la misma puntación
	if numero1 = numero2 then
		return 0;
	else
		-- Comparamos las puntaciónes de los dos equipos
		if numero1 > numero2 then
			-- El equipo local tiene mayor puntación
			return 2;
		else
			-- El equipo visitante tiene mayor puntación
			return 1;
		end if;
	end if;
end; $$


-- Prueba de la función
select fP1T7BD8('147-148') as resultado;