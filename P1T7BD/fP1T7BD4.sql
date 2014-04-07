-- 4. Cree una función que devuelva 1 ó 0 si un número es o no divisible por otro, con el nombre “fP1T7BD4”. 
-- ( habrá que usar funciones matemáticas predefinidas MOD(N,M) o N % M o N MOD M )
delimiter $$
create function fP1T7BD4(dividendo int, divisor int) returns int
begin
	-- Declaramos una variable para almacenar el resultado
	declare resultado int;

	-- Asigamos el resultado del modulo
	set resultado =  dividendo % divisor;

	-- Comprobamos el resultado devolviendo el valor adecuado
	if resultado = 0 then
		return 1;
	else
		return 0;
	end if;
end; $$

-- Prueba de la función
select fP1T7BD4(9, 3) as divisible;