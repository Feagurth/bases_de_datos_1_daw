-- Dise�a e implementa una base de datos objeto relacional para 
-- un consorcio de hospitales que permita gestionar el ingreso de los pacientes. 
-- De cada hospital interesa almacenar su nombre, direcci�n, tel�fono y fax. Crea 
-- al menos los tipos de objeto hospital, m�dico, paciente, habitaci�n y 
-- diagn�stico. Crea como m�nimo un par de atributos por cada tipo de objeto, y 
-- los m�todos de asignar valor y obtener valor (put y get) para cada uno de los 
-- atributos del tipo de objeto, adem�s de un constructor que inicialice a un valor 
-- arbitrario elegido por ti a cada atributo. Por �ltimo, define una tabla de cada 
-- tipo de objeto e inserta como m�nimo 5 registros en cada tabla inventados por ti

-- Eliminaci�n de los tipos si est�n creados anteriormente
DROP TYPE Medico;
DROP TYPE Paciente;
DROP TYPE Persona;
DROP TYPE Habitacion;

/

-- Cabecera del objeto Persona
CREATE TYPE Persona AS OBJECT
(
  -- Atributos del objeto Persona
  DNI                 VARCHAR2(10),
  Nombre              VARCHAR2(15), 
  Apellidos           VARCHAR2(30),   
  Direccion           VARCHAR2(50),
  Telefono            VARCHAR2(15), 
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, Nombre VARCHAR2, Apellidos VARCHAR2, Direccion VARCHAR2, Telefono VARCHAR2)RETURN SELF AS RESULT, 
  
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
    SELF.Nombre := Nombre;
    SELF.Apellidos := Apellidos;
    SELF.Direccion := Direccion;
    SELF.Telefono := Telefono;  
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
    RETURN SELF.Nombre;
  END getNombre;
  
  -- Definici�n del m�todo setNombre
  MEMBER PROCEDURE setNombre(Nombre VARCHAR2)
  IS BEGIN
    SELF.Nombre := Nombre;
  END setNombre;  
  
  -- Definici�n del m�todo getApellidos
  MEMBER FUNCTION getApellidos RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Apellidos;
  END getApellidos;
  
  -- Definici�n del m�todo setApellidos
  MEMBER PROCEDURE setApellidos(Apellidos VARCHAR2)
  IS BEGIN
    SELF.Apellidos := Apellidos;
  END setApellidos;    
  
  -- Definici�n del m�todo getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Direccion;
  END getDireccion;  
  
  -- Definici�n del m�todo setDireccion
  MEMBER PROCEDURE setDireccion(Direccion VARCHAR2)
  IS BEGIN
    SELF.Direccion := Direccion;
  END setDireccion;    
  
  -- Definici�n del m�todo getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Telefono;
  END getTelefono;    
  
  -- Definici�n del m�todo setTelefono
  MEMBER PROCEDURE setTelefono(Telefono VARCHAR2)
  IS BEGIN
    SELF.Telefono := Telefono;
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
  
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR) RETURN SELF AS RESULT,
  
  -- Definici�n del resto de funciones
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2,
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2),
  MEMBER FUNCTION getTelevision RETURN CHAR,
  MEMBER PROCEDURE setTelevision(television CHAR)
);

/

-- Cuerpo del objeto Habitacion
CREATE TYPE BODY Habitacion
AS
  -- Definici�n del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR) RETURN SELF AS RESULT
  IS BEGIN
    SELF.descripcion := descripcion;
    SELF.television := television;
  END;
  
  -- Definici�n del m�todo getDescripcion
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.descripcion;
  END getDescripcion;
  
  -- Definici�n del m�todo setNumColegiado
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2)
  IS BEGIN
    SELF.descripcion := descripcion;
  END setDescripcion;      

  -- Definici�n del m�todo getTelevision
  MEMBER FUNCTION getTelevision RETURN CHAR
  IS BEGIN
    RETURN SELF.television;
  END getTelevision;
  
  -- Definici�n del m�todo setAlergologia
  MEMBER PROCEDURE setTelevision(television CHAR)
  IS BEGIN
    SELF.television := television;
  END setTelevision;      
END;