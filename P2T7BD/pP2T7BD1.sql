delimiter $$
create procedure pP2T7BD1(in valor int)
begin
	-- Declaramos un contador para controlar
	-- las iteraciones del bucle
	declare contador int default 0;
	declare resultado int default 0;

	-- Definimos el bucle para iterar
	bucle_calculo: loop

	-- Aumentamos el contador
	set contador = contador + 1;

	-- Añadimos el valor del contador al resultado
	set resultado = resultado + contador;

	-- Comprobamos la condición de salida del bucle
	if contador >= valor then
		-- Mostramos el resultado
		select resultado;

		-- Abandonamos el bucle
		leave bucle_calculo;
	end if;

	-- Finalizamos el bucle
	end loop bucle_calculo;
end; $$


-- Prueba del procedimiento
call pP2T7BD1(10);