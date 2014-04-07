-- Cree un procedimiento que muestre las tres primeras letras de una cadena pasada como parámetro en MAYÚSCULAS, 
-- con el nombre “pP1T7BD1”. (hay que usar funciones de texto predefinidas LEFT(str,len) y UPPER(str), 
-- http://dev.mysql.com/doc/refman/5.0/es/string-functions.html)
delimiter $$
create procedure pP1T7BD1(in cadena varchar(25))
begin
	-- Declaramos una variable para almacenar los resultados
	declare resultado varchar(25);

	-- Asignamos a la variable el valor en mayusculas de la cadena
	set resultado = upper(cadena);

	-- Asignamos a la variable los 3 primeros caracteres de la variable resultado
	set resultado = left(resultado,3);

	-- Mostramos los caracteres
	select resultado;
end; $$

-- Prueba del procedimiento
call pP1T7BD1("Lorito");
