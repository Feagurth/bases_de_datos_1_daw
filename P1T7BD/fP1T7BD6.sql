-- Cree una función que devuelva el mayor de tres números pasados como parámetros con el nombre “fP1T7BD6”.
delimiter $$
create function fP1T7BD6(numero1 int, numero2 int, numero3 int) returns int
begin
	
	-- Declaramos una variable y la inicializamos
	-- a un valor muy bajo
	declare mayor int default -32000;

	-- Comprobamos si el primer número es mayor
	-- que el valor de control de la variable
	if numero1 > mayor then
		-- Si es mayor, asignamos esta valor a la variable
		set mayor = numero1;
	end if;

	-- Comprobamos si el segundo número es mayor
	-- que el valor de la variable de control
	if numero2 > mayor then
		-- Si es mayor, asignamos este valor a la variable
		set mayor = numero2;
	end if;

	-- Comprobamos si el tercer número es mayor
	-- que el valor de la variable de control
	if numero3 > mayor then
		-- Si es mayor, asignamos este valor a la variable
		set mayor = numero3;
	end if;

	-- Devolvemos el valor de la variable
	return mayor;

end; $$

-- Prueba de la función
select fP1T7BD6(-3,-3,1) as NumeroMayor;