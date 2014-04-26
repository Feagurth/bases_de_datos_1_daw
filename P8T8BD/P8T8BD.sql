-- Crea un método MAP “ordenarCursos” para el tipo “Cursos”. Este método debe retornar
-- el nombre completo del profesor al que hace referencia cada curso.
-- Para obtener el nombre debes utilizar el método getNombreCompleto que se ha creado anteriormente.
-- Realiza una consulta de la tabla “Alumnado” ordenada por “cursoAlumno” para comprobar el
-- funcionamiento del método MAP.


-- Especificación del objeto Cursos
CREATE OR REPLACE TYPE Cursos
AS
  OBJECT
  (
    codigo INTEGER,
    nombre VARCHAR2(20),
    refProfe REF Profesor,
    max_Alumn  INTEGER,
    fecha_Inic DATE,
    fecha_Fin  DATE,
    num_Horas  INTEGER,
    CONSTRUCTOR
  FUNCTION Cursos(
      codigo INTEGER,
      nombre VARCHAR2,
      refProfe REF Profesor,
      max_Alumn  INTEGER,
      fecha_Inic DATE,
      fecha_Fin  DATE,
      num_Horas  INTEGER)
    RETURN SELF
  AS
    RESULT, 
    MAP MEMBER FUNCTION ordenarCursos RETURN VARCHAR2);
  /
  -- Cuerpo del objeto Cursos
CREATE OR REPLACE TYPE BODY Cursos
AS
  -- Definimos el constructor del objeto
  CONSTRUCTOR
FUNCTION Cursos(
    codigo INTEGER,
    nombre VARCHAR2,
    refProfe REF Profesor,
    max_Alumn  INTEGER,
    fecha_Inic DATE,
    fecha_Fin  DATE,
    num_Horas  INTEGER)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los parámetros a las variables de instancia
  SELF.codigo     := codigo;
  SELF.nombre     := nombre;
  SELF.refProfe   := refProfe;
  SELF.max_Alumn  := max_Alumn;
  SELF.fecha_Inic := fecha_Inic;
  SELF.num_Horas  := num_Horas;
  RETURN;
END;

-- Método map del objeto
MAP MEMBER FUNCTION ordenarCursos RETURN VARCHAR2 IS
-- Definimos una variable de tipo Profesor
profe Profesor;
BEGIN

  -- Introducimos el objeto profesor referenciado en el objeto alumno y lo 
  -- almacenamos en la variable definida para tal efecto
  SELECT DEREF(SELF.refProfe) INTO profe FROM Dual;

  -- Devolvemos la cadena que devuelve el método del objeto Profesor
  RETURN profe.getNombreCompleto();
END ordenarCursos;

END;

/

-- Mostramos los registros de Alumnado sin ordenar
SELECT * FROM Alumnado;

/

-- Mostramos los registros de Alumnado ordenador por cursoAlumno
SELECT * FROM Alumnado ORDER BY cursoAlumno;