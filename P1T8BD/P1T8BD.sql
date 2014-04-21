-- Crea el tipo de objetos “MiembroEscolar” con los siguientes atributos:
-- codigo INTEGER,
-- dni VARCHAR2(10),
-- nombre VARCHAR2(30),
-- apellidos VARCHAR2(30),
-- sexo VARCHAR2(1),
-- fecha_nac DATE
-- Especificación del objeto MiembroEscolar
CREATE OR REPLACE TYPE MiembroEscolar
AS
  OBJECT
  (
    codigo    INTEGER,
    dni       VARCHAR2(10),
    nombre    VARCHAR2(30),
    apellidos VARCHAR2(30),
    sexo      VARCHAR2(1),
    fecha_nac DATE,
    CONSTRUCTOR
  FUNCTION MiembroEscolar(
      codigo    INTEGER,
      dni       VARCHAR2,
      nombre    VARCHAR2,
      apellidos VARCHAR2,
      sexo      VARCHAR2,
      fecha_nac DATE)
    RETURN SELF
  AS
    RESULT ) NOT FINAL;
  /
  -- Cuerpo del objeto MiembroEscolar
CREATE OR REPLACE TYPE BODY MiembroEscolar
AS
  -- Definimos el constructor del objeto
  CONSTRUCTOR
FUNCTION MiembroEscolar(
    codigo    INTEGER,
    dni       VARCHAR2,
    nombre    VARCHAR2,
    apellidos VARCHAR2,
    sexo      VARCHAR2,
    fecha_nac DATE)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los parámetros a las variables de instancia
  SELF.codigo    := codigo;
  SELF.dni       := dni;
  SELF.nombre    := nombre;
  SELF.apellidos := apellidos;
  SELF.sexo      := sexo;
  SELF.fecha_nac := fecha_nac;
  RETURN;
END;
END;
/
-- Crea, como tipo heredado de “MiembroEscolar”, el tipo de objeto “Profesor” con los siguientes atributos:
-- especialidad VARCHAR2(20),
-- antiguedad INTEGER
-- Especificación del objeto Profesor
CREATE OR REPLACE TYPE Profesor UNDER MiembroEscolar ( especialidad VARCHAR2(20), antiguedad INTEGER, CONSTRUCTOR
FUNCTION Profesor(
    especialidad VARCHAR2,
    antiguedad   INTEGER)
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
    especialidad VARCHAR2,
    antiguedad   INTEGER)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los parámetros a las variables de instancia
  SELF.especialidad := especialidad;
  SELF.antiguedad   := antiguedad;
  RETURN;
END;
END;
/
-- Crea el tipo de objeto “Cursos” con los siguientes atributos:
-- codigo INTEGER,
-- nombre VARCHAR2(20),
-- refProfe REF Profesor,
-- max_Alumn INTEGER,
-- fecha_Inic DATE,
-- fecha_Fin DATE,
-- num_Horas INTEGER
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
    RESULT);
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
END;
/
-- Crea, como tipo heredado de “MiembroEscolar”, el tipo de objeto “Alumno” con los siguientes atributos:
-- cursoAlumno Cursos
-- Especificación del objeto Alumno
CREATE OR REPLACE TYPE Alumno UNDER MiembroEscolar ( cursoAlumno REF Cursos, CONSTRUCTOR
FUNCTION Alumno(
    cursoAlumno REF Cursos)
  RETURN SELF
AS
  RESULT);
/
-- Cuerpo del objeto Alumno
CREATE OR REPLACE TYPE BODY Alumno
AS
  -- Definimos el constructor del objeto
  CONSTRUCTOR
FUNCTION Alumno(
    cursoAlumno REF Cursos)
  RETURN SELF
AS
  RESULT
IS
BEGIN
  -- Asignamos los parámetros a las variables de instancia
  SELF.cursoAlumno := cursoAlumno;
  RETURN;
END;
END;