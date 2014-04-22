-- Crea un método “getNombreCompleto” para el tipo de objetos “Profesor” que
-- permita obtener su nombre completo con el formato “apellidos nombre”
-- Especificación del objeto Profesor
CREATE OR REPLACE TYPE Profesor UNDER MiembroEscolar (especialidad VARCHAR2(20)
, antiguedad INTEGER,
CONSTRUCTOR
FUNCTION Profesor(
    codigo          INTEGER,
    nombre          VARCHAR2,
    primerApellido  VARCHAR2,
    segundoApellido VARCHAR2,
    especialidad    VARCHAR2)
  RETURN SELF
AS
  RESULT, MEMBER FUNCTION getNombreCompleto
  RETURN VARCHAR2);
/
-- Cuerpo del objeto Profesor
CREATE OR REPLACE TYPE BODY Profesor
AS
  -- Definimos el constructor del objeto
  CONSTRUCTOR
FUNCTION Profesor(
    codigo          INTEGER,
    nombre          VARCHAR2,
    primerApellido  VARCHAR2,
    segundoApellido VARCHAR2,
    especialidad    VARCHAR2)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los parámetros a las variables de instancia
  SELF.nombre       := nombre;
  SELF.apellidos    := CONCAT(primerApellido, CONCAT(' ', segundoApellido));
  SELF.especialidad := especialidad;
  SELF.codigo       := codigo;
  SELF.dni          := NULL;
  SELF.sexo         := NULL;
  SELF.fecha_nac    := NULL;
  SELF.antiguedad   := 0;
  RETURN;
END;
-- Función que devuelve el nombre completo del profesor en formato "apellidos
-- nombre"
MEMBER FUNCTION getNombreCompleto
  RETURN VARCHAR2
IS
BEGIN
  -- Concatenamos los apellidos y el nombre separados por un espacio en blanco
  RETURN CONCAT(SELF.apellidos, CONCAT(' ', SELF.nombre));
END;
END;