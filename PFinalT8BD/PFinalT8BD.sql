-- Diseña e implementa una base de datos objeto relacional para 
-- un consorcio de hospitales que permita gestionar el ingreso de los pacientes. 
-- De cada hospital interesa almacenar su nombre, dirección, teléfono y fax. Crea 
-- al menos los tipos de objeto hospital, médico, paciente, habitación y 
-- diagnóstico. Crea como mínimo un par de atributos por cada tipo de objeto, y 
-- los métodos de asignar valor y obtener valor (put y get) para cada uno de los 
-- atributos del tipo de objeto, además de un constructor que inicialice a un valor 
-- arbitrario elegido por ti a cada atributo. Por último, define una tabla de cada 
-- tipo de objeto e inserta como mínimo 5 registros en cada tabla inventados por ti

-- Eliminación de los tipos si están creados anteriormente
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
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, Nombre VARCHAR2, Apellidos VARCHAR2, Direccion VARCHAR2, Telefono VARCHAR2)RETURN SELF AS RESULT, 
  
  -- Definición del resto de funciones
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
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, Nombre VARCHAR2, Apellidos VARCHAR2, Direccion VARCHAR2, Telefono VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.DNI := DNI;
    SELF.Nombre := Nombre;
    SELF.Apellidos := Apellidos;
    SELF.Direccion := Direccion;
    SELF.Telefono := Telefono;  
  END;
  
  -- Definición del método getDNI
  MEMBER FUNCTION getDNI RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.DNI;
  END getDNI;
  
  -- Definición del método setDNI
  MEMBER PROCEDURE setDNI(DNI VARCHAR2)
  IS BEGIN
    SELF.DNI := DNI;
  END setDNI;
  
   -- Definición del método getNombre
  MEMBER FUNCTION getNombre RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Nombre;
  END getNombre;
  
  -- Definición del método setNombre
  MEMBER PROCEDURE setNombre(Nombre VARCHAR2)
  IS BEGIN
    SELF.Nombre := Nombre;
  END setNombre;  
  
  -- Definición del método getApellidos
  MEMBER FUNCTION getApellidos RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Apellidos;
  END getApellidos;
  
  -- Definición del método setApellidos
  MEMBER PROCEDURE setApellidos(Apellidos VARCHAR2)
  IS BEGIN
    SELF.Apellidos := Apellidos;
  END setApellidos;    
  
  -- Definición del método getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Direccion;
  END getDireccion;  
  
  -- Definición del método setDireccion
  MEMBER PROCEDURE setDireccion(Direccion VARCHAR2)
  IS BEGIN
    SELF.Direccion := Direccion;
  END setDireccion;    
  
  -- Definición del método getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.Telefono;
  END getTelefono;    
  
  -- Definición del método setTelefono
  MEMBER PROCEDURE setTelefono(Telefono VARCHAR2)
  IS BEGIN
    SELF.Telefono := Telefono;
  END setTelefono;      
END;

/

-- Especificación del objeto Medico
CREATE TYPE Medico UNDER Persona 
( 
  -- Atributos del objeto Medico
  numColegiado      VARCHAR2(20), 
  sueldo            FLOAT,
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
  MEMBER FUNCTION getNumColegiado RETURN VARCHAR2,
  MEMBER PROCEDURE setNumColegiado(numColegiado VARCHAR2),
  MEMBER FUNCTION getSueldo RETURN FLOAT,
  MEMBER PROCEDURE setSueldo(sueldo FLOAT)
);

/

-- Cuerpo del objeto Medico
CREATE TYPE BODY Medico
AS
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF AS RESULT
  IS BEGIN
    SELF.numColegiado := numColegiado;
    SELF.sueldo := sueldo;
  END;
  
  -- Definición del método getNumColegiado
  MEMBER FUNCTION getNumColegiado RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.numColegiado;
  END getNumColegiado;
  
  -- Definición del método setNumColegiado
  MEMBER PROCEDURE setNumColegiado(numColegiado VARCHAR2)
  IS BEGIN
    SELF.numColegiado := numColegiado;
  END setNumColegiado;      

  -- Definición del método getSueldo
  MEMBER FUNCTION getSueldo RETURN FLOAT
  IS BEGIN
    RETURN SELF.sueldo;
  END getSueldo;
  
  -- Definición del método setSueldo
  MEMBER PROCEDURE setSueldo(sueldo FLOAT)
  IS BEGIN
    SELF.sueldo := sueldo;
  END setSueldo;      
END;
  
/

-- Especificación del objeto Paciente
CREATE TYPE Paciente UNDER Persona 
( 
  -- Atributos del objeto Medico
  enfermedadesCronicas      VARCHAR2(200), 
  alergologia               VARCHAR2(200), 
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, alergologia VARCHAR2) RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
  MEMBER FUNCTION getEnfermedadesCronicas RETURN VARCHAR2,
  MEMBER PROCEDURE setEnfermedadesCronicas(enfermedadesCronicas VARCHAR2),
  MEMBER FUNCTION getAlergologia RETURN VARCHAR2,
  MEMBER PROCEDURE setAlergologia(alergologia VARCHAR2)
);

/

-- Cuerpo del objeto Paciente
CREATE TYPE BODY Paciente
AS
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, alergologia VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.enfermedadesCronicas := enfermedadesCronicas;
    SELF.alergologia := alergologia;
  END;
  
  -- Definición del método getEnfermedadesCronicas
  MEMBER FUNCTION getEnfermedadesCronicas RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.enfermedadesCronicas;
  END getEnfermedadesCronicas;
  
  -- Definición del método setNumColegiado
  MEMBER PROCEDURE setEnfermedadesCronicas(enfermedadesCronicas VARCHAR2)
  IS BEGIN
    SELF.enfermedadesCronicas := enfermedadesCronicas;
  END setEnfermedadesCronicas;      

  -- Definición del método getAlergologia
  MEMBER FUNCTION getAlergologia RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.alergologia;
  END getAlergologia;
  
  -- Definición del método setAlergologia
  MEMBER PROCEDURE setAlergologia(alergologia VARCHAR2)
  IS BEGIN
    SELF.alergologia := alergologia;
  END setAlergologia;      
END;
  
/

-- Especificación del objeto Habitacion
CREATE TYPE Habitacion AS OBJECT
( 
  -- Atributos del objeto Habitacion
  descripcion               VARCHAR2(50), 
  television                CHAR(1), 
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR) RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2,
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2),
  MEMBER FUNCTION getTelevision RETURN CHAR,
  MEMBER PROCEDURE setTelevision(television CHAR)
);

/

-- Cuerpo del objeto Habitacion
CREATE TYPE BODY Habitacion
AS
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR) RETURN SELF AS RESULT
  IS BEGIN
    SELF.descripcion := descripcion;
    SELF.television := television;
  END;
  
  -- Definición del método getDescripcion
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.descripcion;
  END getDescripcion;
  
  -- Definición del método setNumColegiado
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2)
  IS BEGIN
    SELF.descripcion := descripcion;
  END setDescripcion;      

  -- Definición del método getTelevision
  MEMBER FUNCTION getTelevision RETURN CHAR
  IS BEGIN
    RETURN SELF.television;
  END getTelevision;
  
  -- Definición del método setAlergologia
  MEMBER PROCEDURE setTelevision(television CHAR)
  IS BEGIN
    SELF.television := television;
  END setTelevision;      
END;