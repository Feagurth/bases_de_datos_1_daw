-- Crea un m�todo constructor para el tipo de objetos �Profesor�,
-- en el que se indiquen como par�metros el c�digo, nombre, primer
-- apellido, segundo apellido y especialidad. Este m�todo debe asignar
-- al atributo �apellidos� los datos de primer apellido y segundo
-- apellido que se han pasado como par�metros, uni�ndolos con un
-- espacio entre ellos (USA LA FUNCI�N CONCAT).

-- Especificaci�n del objeto Profesor
CREATE OR REPLACE TYPE Profesor UNDER MiembroEscolar (especialidad VARCHAR2(20), antiguedad INTEGER, 
CONSTRUCTOR FUNCTION Profesor(
    codigo integer, nombre varchar2, primerApellido varchar2, segundoApellido varchar2, especialidad VARCHAR2)
  RETURN SELF
AS
  RESULT);
/
-- Cuerpo del objeto Profesor
CREATE OR REPLACE TYPE BODY Profesor
AS
  -- Definimos el constructor del objeto
  CONSTRUCTOR
FUNCTION Profesor(
    codigo integer, nombre varchar2, primerApellido varchar2, segundoApellido varchar2, especialidad VARCHAR2)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los par�metros a las variables de instancia
  SELF.nombre := nombre;
  SELF.apellidos := CONCAT(primerApellido, CONCAT(' ', segundoApellido));
  SELF.especialidad   := especialidad;
  SELF.codigo := codigo;
  SELF.dni := NULL;
  SELF.sexo := NULL;
  SELF.fecha_nac := NULL;
  SELF.antiguedad := 0;
  RETURN;
END;
END;