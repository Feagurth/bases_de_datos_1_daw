-- Dise�a e implementa una base de datos objeto relacional para 
-- un consorcio de hospitales que permita gestionar el ingreso de los pacientes. 
-- De cada hospital interesa almacenar su nombre, direcci�n, tel�fono y fax. Crea 
-- al menos los tipos de objeto hospital, m�dico, paciente, habitaci�n y 
-- diagn�stico. Crea como m�nimo un par de atributos por cada tipo de objeto, y 
-- los m�todos de asignar valor y obtener valor (put y get) para cada uno de los 
-- atributos del tipo de objeto, adem�s de un constructor que inicialice a un valor 
-- arbitrario elegido por ti a cada atributo. Por �ltimo, define una tabla de cada 
-- tipo de objeto e inserta como m�nimo 5 registros en cada tabla inventados por ti

-- Debug
DROP TYPE Hospital FORCE;
DROP TYPE TablaHabitaciones FORCE;
DROP TYPE Habitacion FORCE;
DROP TYPE Diagnostico FORCE;
DROP TYPE Paciente FORCE;
DROP TYPE Medico FORCE;
DROP TYPE Persona FORCE;

DROP TABLE tbPersona;
DROP TABLE tbPaciente;
DROP TABLE tbMedico;
DROP TABLE tbHabitacion;
DROP TABLE tbHospital;
DROP TABLE tbDiagnostico;

-- Cabecera del objeto Persona
CREATE TYPE Persona AS OBJECT
(
  -- Atributos del objeto Persona
  DNI                 VARCHAR2(10),
  nombre              VARCHAR2(15), 
  apellidos           VARCHAR2(30),   
  direccion           VARCHAR2(250),
  telefono            VARCHAR2(15), 
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, nombre VARCHAR2, apellidos VARCHAR2, direccion VARCHAR2, telefono VARCHAR2)RETURN SELF AS RESULT, 
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getDNI RETURN VARCHAR2,
  MEMBER PROCEDURE setDNI(DNI VARCHAR2),
  MEMBER FUNCTION getNombre RETURN VARCHAR2,
  MEMBER PROCEDURE setNombre(Nombre VARCHAR2),
  MEMBER FUNCTION getApellidos RETURN VARCHAR2,
  MEMBER PROCEDURE setApellidos(Apellidos VARCHAR2),
  MEMBER FUNCTION getDireccion RETURN VARCHAR2,
  MEMBER PROCEDURE setDireccion(Direccion VARCHAR2),
  MEMBER FUNCTION getTelefono RETURN VARCHAR2,
  MEMBER PROCEDURE setTelefono(Telefono VARCHAR2)
  ) NOT FINAL;
  
/

-- Cuerpo del objeto Persona
CREATE TYPE BODY Persona
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, Nombre VARCHAR2, Apellidos VARCHAR2, Direccion VARCHAR2, Telefono VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.DNI := DNI;
    SELF.nombre := nombre;
    SELF.apellidos := apellidos;
    SELF.direccion := direccion;
    SELF.telefono := telefono;  
  END;
  
  -- Definici�n del m�todo getDNI
  MEMBER FUNCTION getDNI RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.DNI;
  END getDNI;
  
  -- Definici�n del m�todo setDNI
  MEMBER PROCEDURE setDNI(DNI VARCHAR2)
  IS BEGIN
    SELF.DNI := DNI;
  END setDNI;
  
   -- Definici�n del m�todo getNombre
  MEMBER FUNCTION getNombre RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.nombre;
  END getNombre;
  
  -- Definici�n del m�todo setNombre
  MEMBER PROCEDURE setNombre(nombre VARCHAR2)
  IS BEGIN
    SELF.nombre := nombre;
  END setNombre;  
  
  -- Definici�n del m�todo getApellidos
  MEMBER FUNCTION getApellidos RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.apellidos;
  END getApellidos;
  
  -- Definici�n del m�todo setApellidos
  MEMBER PROCEDURE setApellidos(apellidos VARCHAR2)
  IS BEGIN
    SELF.apellidos := apellidos;
  END setApellidos;    
  
  -- Definici�n del m�todo getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getDireccion;  
  
  -- Definici�n del m�todo setDireccion
  MEMBER PROCEDURE setDireccion(direccion VARCHAR2)
  IS BEGIN
    SELF.direccion := direccion;
  END setDireccion;    
  
  -- Definici�n del m�todo getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.telefono;
  END getTelefono;    
  
  -- Definici�n del m�todo setTelefono
  MEMBER PROCEDURE setTelefono(telefono VARCHAR2)
  IS BEGIN
    SELF.telefono := telefono;
  END setTelefono;      
END;

/

-- Especificaci�n del objeto Medico
CREATE TYPE Medico UNDER Persona 
( 
  -- Atributos del objeto Medico
  numColegiado      VARCHAR2(20), 
  sueldo            FLOAT,
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getNumColegiado RETURN VARCHAR2,
  MEMBER PROCEDURE setNumColegiado(numColegiado VARCHAR2),
  MEMBER FUNCTION getSueldo RETURN FLOAT,
  MEMBER PROCEDURE setSueldo(sueldo FLOAT)
);

/

-- Cuerpo del objeto Medico
CREATE TYPE BODY Medico
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF AS RESULT
  IS BEGIN
    SELF.numColegiado := numColegiado;
    SELF.sueldo := sueldo;
  END;
  
  -- Definici�n del m�todo getNumColegiado
  MEMBER FUNCTION getNumColegiado RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.numColegiado;
  END getNumColegiado;
  
  -- Definici�n del m�todo setNumColegiado
  MEMBER PROCEDURE setNumColegiado(numColegiado VARCHAR2)
  IS BEGIN
    SELF.numColegiado := numColegiado;
  END setNumColegiado;      

  -- Definici�n del m�todo getSueldo
  MEMBER FUNCTION getSueldo RETURN FLOAT
  IS BEGIN
    RETURN SELF.sueldo;
  END getSueldo;
  
  -- Definici�n del m�todo setSueldo
  MEMBER PROCEDURE setSueldo(sueldo FLOAT)
  IS BEGIN
    SELF.sueldo := sueldo;
  END setSueldo;      
END;
  
/

-- Especificaci�n del objeto Paciente
CREATE TYPE Paciente UNDER Persona 
( 
  -- Atributos del objeto Medico
  enfermedadesCronicas      VARCHAR2(200), 
  alergologia               VARCHAR2(200), 
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, alergologia VARCHAR2) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getEnfermedadesCronicas RETURN VARCHAR2,
  MEMBER PROCEDURE setEnfermedadesCronicas(enfermedadesCronicas VARCHAR2),
  MEMBER FUNCTION getAlergologia RETURN VARCHAR2,
  MEMBER PROCEDURE setAlergologia(alergologia VARCHAR2)
);

/

-- Cuerpo del objeto Paciente
CREATE TYPE BODY Paciente
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, alergologia VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.enfermedadesCronicas := enfermedadesCronicas;
    SELF.alergologia := alergologia;
  END;
  
  -- Definici�n del m�todo getEnfermedadesCronicas
  MEMBER FUNCTION getEnfermedadesCronicas RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.enfermedadesCronicas;
  END getEnfermedadesCronicas;
  
  -- Definici�n del m�todo setNumColegiado
  MEMBER PROCEDURE setEnfermedadesCronicas(enfermedadesCronicas VARCHAR2)
  IS BEGIN
    SELF.enfermedadesCronicas := enfermedadesCronicas;
  END setEnfermedadesCronicas;      

  -- Definici�n del m�todo getAlergologia
  MEMBER FUNCTION getAlergologia RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.alergologia;
  END getAlergologia;
  
  -- Definici�n del m�todo setAlergologia
  MEMBER PROCEDURE setAlergologia(alergologia VARCHAR2)
  IS BEGIN
    SELF.alergologia := alergologia;
  END setAlergologia;      
END;
  
/

-- Especificaci�n del objeto Habitacion
CREATE TYPE Habitacion AS OBJECT
( 
  -- Atributos del objeto Habitacion
  descripcion               VARCHAR2(50), 
  television                CHAR(1),
  refPaciente               REF Paciente,
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR, refPaciente REF Paciente) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2,
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2),
  MEMBER FUNCTION getTelevision RETURN CHAR,
  MEMBER PROCEDURE setTelevision(television CHAR),
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente,
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente)
);

/

-- Cuerpo del objeto Habitacion
CREATE TYPE BODY Habitacion
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR, refPaciente REF Paciente) RETURN SELF AS RESULT
  IS BEGIN
    SELF.descripcion := descripcion;
    SELF.television := television;
    SELF.refPaciente := refPaciente;
  END;
  
  -- Definici�n del m�todo getDescripcion
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.descripcion;
  END getDescripcion;
  
  -- Definici�n del m�todo setDescripcion
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2)
  IS BEGIN
    SELF.descripcion := descripcion;
  END setDescripcion;      

  -- Definici�n del m�todo getTelevision
  MEMBER FUNCTION getTelevision RETURN CHAR
  IS BEGIN
    RETURN SELF.television;
  END getTelevision;
  
  -- Definici�n del m�todo setTelevision
  MEMBER PROCEDURE setTelevision(television CHAR)
  IS BEGIN
    SELF.television := television;
  END setTelevision;      
  
  -- Definici�n del m�todo getRefPaciente
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente
  IS BEGIN
    RETURN SELF.refPaciente;
  END getRefPaciente;
  
  -- Definici�n del m�todo setRefPaciente
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente)
  IS BEGIN
    SELF.refPaciente := refPaciente;
  END setRefPaciente;        
END;

/

-- Creamos un tipo para almacenar las habitaciones
-- del hospital
CREATE TYPE TablaHabitaciones
   AS TABLE OF REF Habitacion;

/

-- Especificaci�n del objeto Hospital
CREATE TYPE Hospital AS OBJECT
( 
  -- Atributos del objeto Habitacion
  nombre               VARCHAR2(50), 
  direccion            VARCHAR2(250), 
  telefono             VARCHAR2(15), 
  fax                  VARCHAR2(15),
  habitaciones         TablaHabitaciones,
    
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Hospital(nombre VARCHAR2, direccion VARCHAR2, telefono VARCHAR2, fax VARCHAR2, habitaciones TablaHabitaciones) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getNombre RETURN VARCHAR2,
  MEMBER PROCEDURE setNombre(nombre VARCHAR2),
  MEMBER FUNCTION getDireccion RETURN VARCHAR2,
  MEMBER PROCEDURE setDireccion(direccion VARCHAR2),
  MEMBER FUNCTION getTelefono RETURN VARCHAR2,
  MEMBER PROCEDURE setTelefono(telefono VARCHAR2),
  MEMBER FUNCTION getFax RETURN VARCHAR2,
  MEMBER PROCEDURE setFax(fax VARCHAR2),
  MEMBER FUNCTION getHabitaciones RETURN TablaHabitaciones,
  MEMBER PROCEDURE setHabitaciones(habitaciones TablaHabitaciones)  
);

/

-- Cuerpo del objeto Hospital
CREATE TYPE BODY Hospital
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Hospital(nombre VARCHAR2, direccion VARCHAR2, telefono VARCHAR2, fax VARCHAR2, habitaciones TablaHabitaciones) RETURN SELF AS RESULT
  IS BEGIN
    SELF.nombre := nombre;
    SELF.direccion := direccion;
    SELF.telefono := telefono;
    SELF.fax := fax;
    SELF.habitaciones := habitaciones;
  END;
  
  -- Definici�n del m�todo getNombre
  MEMBER FUNCTION getNombre RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.nombre;
  END getNombre;
  
  -- Definici�n del m�todo setNombre
  MEMBER PROCEDURE setNombre(nombre VARCHAR2)
  IS BEGIN
    SELF.nombre := nombre;
  END setNombre;      

  -- Definici�n del m�todo getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getDireccion;
  
  -- Definici�n del m�todo setDireccion
  MEMBER PROCEDURE setDireccion(direccion VARCHAR2)
  IS BEGIN
    SELF.direccion := direccion;
  END setDireccion; 
    
  -- Definici�n del m�todo getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getTelefono;
  
  -- Definici�n del m�todo setTelefono
  MEMBER PROCEDURE setTelefono(telefono VARCHAR2)
  IS BEGIN
    SELF.telefono := telefono;
  END setTelefono;   
  
  -- Definici�n del m�todo getFax
  MEMBER FUNCTION getFax RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.fax;
  END getFax;
  
  -- Definici�n del m�todo setFax
  MEMBER PROCEDURE setFax(fax VARCHAR2)
  IS BEGIN
    SELF.fax := fax;
  END setFax;     
  
  -- Definici�n del m�todo getFax
  MEMBER FUNCTION getHabitaciones RETURN TablaHabitaciones
  IS BEGIN
    RETURN SELF.habitaciones;
  END getHabitaciones;
  
  -- Definici�n del m�todo setFax
  MEMBER PROCEDURE setHabitaciones(habitaciones TablaHabitaciones)
  IS BEGIN
    SELF.habitaciones := habitaciones;
  END setHabitaciones;      
END;

/

-- Especificaci�n del objeto Diagnostico
CREATE TYPE Diagnostico AS OBJECT
( 
  -- Atributos del objeto Diagnostico
  enfermedad           VARCHAR2(100), 
  tratamiento          VARCHAR2(500), 
  refPaciente          REF Paciente, 
  refMedico            REF Medico,
    
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Diagnostico(enfermedad VARCHAR2, tratamiento VARCHAR2, refPaciente REF Paciente, refMedico REF Medico) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getEnfermedad RETURN VARCHAR2,
  MEMBER PROCEDURE setEnfermedad(enfermedad VARCHAR2),
  MEMBER FUNCTION getTratamiento RETURN VARCHAR2,
  MEMBER PROCEDURE setTratamiento(tratamiento VARCHAR2),
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente,
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente),
  MEMBER FUNCTION getRefMedico RETURN REF Medico,
  MEMBER PROCEDURE setRefMedico(refMedico REF Medico)    
);

/

-- Cuerpo del objeto Diagnostico
CREATE TYPE BODY Diagnostico
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Diagnostico(enfermedad VARCHAR2, tratamiento VARCHAR2, refPaciente REF Paciente, refMedico REF Medico) RETURN SELF AS RESULT
  IS BEGIN
    SELF.enfermedad := enfermedad;
    SELF.tratamiento := tratamiento;
    SELF.refPaciente := refPaciente;
    SELF.refMedico := refMedico;
  END;
  
  -- Definici�n del m�todo getEnfermedad
  MEMBER FUNCTION getEnfermedad RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.enfermedad;
  END getEnfermedad;
  
  -- Definici�n del m�todo setEnfermedad
  MEMBER PROCEDURE setEnfermedad(enfermedad VARCHAR2)
  IS BEGIN
    SELF.enfermedad := enfermedad;
  END setEnfermedad;   
  
  -- Definici�n del m�todo getTratamiento
  MEMBER FUNCTION getTratamiento RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.tratamiento;
  END getTratamiento;
  
  -- Definici�n del m�todo setTratamiento
  MEMBER PROCEDURE setTratamiento(tratamiento VARCHAR2)
  IS BEGIN
    SELF.tratamiento := tratamiento;
  END setTratamiento;   
  
  -- Definici�n del m�todo getRefPaciente
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente
  IS BEGIN
    RETURN SELF.refPaciente;
  END getRefPaciente;
  
  -- Definici�n del m�todo setRefPaciente
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente)
  IS BEGIN
    SELF.refPaciente := refPaciente;
  END setRefPaciente;     
  
  -- Definici�n del m�todo getRefMedico
  MEMBER FUNCTION getRefMedico RETURN REF Medico
  IS BEGIN
    RETURN SELF.refMedico;
  END getRefMedico;
  
  -- Definici�n del m�todo setRefPaciente
  MEMBER PROCEDURE setRefMedico(refMedico REF Medico)
  IS BEGIN
    SELF.refMedico := refMedico;
  END setRefMedico;     
  
END;

/

CREATE TABLE tbPersona OF Persona;
CREATE TABLE tbPaciente OF Paciente;
CREATE TABLE tbMedico OF Medico;
CREATE TABLE tbHabitacion OF Habitacion;
CREATE TABLE tbHospital OF Hospital(nombre NOT NULL, direccion NOT NULL, telefono NOT NULL, fax NOT NULL) NESTED TABLE habitaciones STORE AS tbTablaHabitaciones;
CREATE TABLE tbDiagnostico OF Diagnostico;

