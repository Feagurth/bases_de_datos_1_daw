delimiter $$
create function fP2T7BD4(valor int) returns int
begin
	-- Declaramos un contador para controlar
	-- las iteraciones del bucle, en este caso
	-- desde valor hasta 1
	declare contador int default valor;

	-- Declaramos una variable resultado para
	-- almacenar la suma de los números primos
	declare resultado int default 0;

	-- Definimos el bucle para iterar
	bucle_calculo: repeat

	-- Comprobamos si es primo usando la
	-- función fP2T7BD
	if fP2T7BD3(contador) = 1 then
		-- Si el valor de contador es primo
		-- lo sumamos al valor de la variable resultado
		set resultado = resultado + contador;
	end if;

	-- Decrementamos el valor de contador
	set contador = contador - 1;

	-- Comprobamos la condición de salida del bucle
	until contador <=  0
	-- Finalizamos el bucle
	end repeat bucle_calculo;
	
	-- Devolvemos el resultado
	return resultado;
end; $$

-- Prueba de la función
select fP2T7BD4(13)