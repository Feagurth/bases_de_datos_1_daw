delimiter $$
create function fP2T7BD3(valor int) returns int
begin
	-- Declaramos un contador para controlar
	-- las iteraciones del bucle
	declare contador int default 1;
	declare resultado int default 1;

	-- Definimos el bucle para iterar
	bucle_calculo: repeat

		-- Comprobamos si es divisible
		if valor mod contador = 0 then
			return 0;
		end if;

		-- Incrementamos el contador
		set contador = contador + 1;

		-- Comprobamos la condición de salida del bucle
		-- Si el contador llega al valor anterior al número o 
		-- el número es divisible por
		-- el contador
	until contador <=  valor -1 || resultado = 0
	-- Finalizamos el bucle
	end repeat bucle_calculo;
	
	-- Devolvemos el resultado
	-- 0 si no es primo
	-- 1 si es primo
	return resultado;
end; $$

-- Prueba de la función
select fP2T7BD3(7)$$
select fP2T7BD3(8)$$