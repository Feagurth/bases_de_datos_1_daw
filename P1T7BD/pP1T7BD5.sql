-- 5. Cree un procedimiento que use las estructuras condicionales para mostrar el día de la semana 
-- según un valor de entrada numérico, 1 para domingo, 2 para el lunes, etc, con el nombre “pP1T7BD5”.
delimiter $$
create procedure pP1T7BD5(in numSemana int)
begin
	-- Usamos una estructura case para
	-- mostrar los resultados
	case numSemana
		when 1 then
			select "Domingo";
		when 2 then
			select "Lunes";
		when 3 then
			select "Martes";
		when 4 then
			select "Miercoles";
		when 5 then
			select "Jueves";
		when 6 then
			select "Viernes";
		when 7 then
			select "Sabado";
		else
			select "Error";
	end case;
end; $$

-- Prueba del procedimiento
call pP1T7BD5(5);