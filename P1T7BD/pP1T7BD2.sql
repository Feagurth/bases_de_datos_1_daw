-- Cree un procedimiento que concatene dos cadenas pasadas como parámetros, con el nombre “pP1T7BD2”. 
-- (hay que usar la función de texto predefinida CONCAT(str1,str2,...) 
-- http://dev.mysql.com/doc/refman/5.0/es/string-functions.html)
delimiter $$
create procedure pP1T7BD2(in cadena1 varchar(25), in cadena2 varchar(25))
begin
	-- Declaramos una variable para almacenar el resultado
	declare resultado varchar(50);

	-- Concatenamos las dos cadenas
	set resultado = concat(cadena1, cadena2);

	-- Mostramos el resultado
	select resultado;
end; $$

-- Prueba del método
call pP1T7BD2("Lorito", "Bonito");