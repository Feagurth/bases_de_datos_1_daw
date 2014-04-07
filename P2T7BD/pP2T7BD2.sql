delimiter $$
create procedure pP2T7BD2(in valor int)
begin
	-- Declaramos un contador para controlar
	-- las iteraciones del bucle
	declare contador int default 0;
	declare resultado float default 0;

	-- Definimos el bucle para iterar
	bucle_calculo: repeat

	-- Aumentamos el contador
	set contador = contador + 1;

	-- Añadimos el valor de 1 dividido entre el contador al resultado
	set resultado = resultado + (1/contador);

	-- Comprobamos la condición de salida del bucle
	until contador >= valor 
	-- Finalizamos el bucle
	end repeat bucle_calculo;
	
	-- Mostramos el resultado
	select resultado;
end; $$


-- Prueba del procedimiento
call pP2T7BD2(5);