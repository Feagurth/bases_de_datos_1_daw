-- Cree una función que calcule el total de puntos en un partido tomando como entrada el resultado en 
-- formato ‘xxx-xxx’, con el nombre “fP1T7BD7”.

delimiter $$
create function fP1T7BD7(puntuacion varchar(7)) returns int
begin

	-- Declaramos dos variables para almacenar los valores de las puntuaciones
	declare numero1 int default 0;
	declare numero2 int default 0;

	-- Obtenemos la primera puntación, la cual será el principio de la cadena
	-- hasta donde se encuentra el valor del guión
	set numero1 = instr(puntuacion, "-");
	set numero1 = substring(puntuacion, 1, numero1);

	-- Obtenemos la segunda puntación, la cual será desde la posiciónd el guión +1
	-- hasta el final de la cadena
	set numero2 = instr(puntuacion, "-");
	set numero2 = substring(puntuacion, (numero2 +1) ,(length(puntuacion) -(numero2)));
	
	-- Devolvemos la suma de los dos resultados
	return (numero1 + numero2);
end; $$

-- Prueba de la función
select fP1T7BD7('148-108') as resultado;