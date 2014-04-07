-- Cree una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados, 
-- con el nombre “fP1T7BD3”. Hay que aplicar el teorema de Pitágoras y por tanto habrá que usar funciones matemáticas 
-- predefinidas SQRT(X)y POW(X,Y) o POWER(X,Y) 
-- http://platea.pntic.mec.es/curso20/5_edicionhtml/2007/html11/calcular_hipotenusa.html 
-- https://dev.mysql.com/doc/refman/5.0/es/mathematical-functions.html
delimiter $$
create function fP1T7BD3(lado1 int, lado2 int) returns int
begin
	-- Declaramos una variable para almacenar el resultado
	declare resultado real;

	-- Calculamos el resultado como la raiz cuadrada del cuadrado de sus lados
	set resultado = (sqrt(pow(lado1, 2) + pow(lado2,2)));

	-- Devolvemos el resultado
	return resultado;
end; $$

-- Prueba de la función
select fP1T7BD3(2, 3) as hipotenusa;