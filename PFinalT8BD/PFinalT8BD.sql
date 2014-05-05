-- Diseña e implementa una base de datos objeto relacional para 
-- un consorcio de hospitales que permita gestionar el ingreso de los pacientes. 
-- De cada hospital interesa almacenar su nombre, dirección, teléfono y fax. Crea 
-- al menos los tipos de objeto hospital, médico, paciente, habitación y 
-- diagnóstico. Crea como mínimo un par de atributos por cada tipo de objeto, y 
-- los métodos de asignar valor y obtener valor (put y get) para cada uno de los 
-- atributos del tipo de objeto, además de un constructor que inicialice a un valor 
-- arbitrario elegido por ti a cada atributo. Por último, define una tabla de cada 
-- tipo de objeto e inserta como mínimo 5 registros en cada tabla inventados por ti

-- Eliminación de tipos y tablas en caso de que existieran de algúna ejecución
-- anterior
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

---------------------------------
-- Definición del tipo Persona --
---------------------------------

-- Cabecera del objeto Persona
CREATE TYPE Persona AS OBJECT
(
  -- Atributos del objeto Persona
  DNI                 VARCHAR2(10),
  nombre              VARCHAR2(15), 
  apellidos           VARCHAR2(30),   
  direccion           VARCHAR2(250),
  telefono            VARCHAR2(15), 
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, nombre VARCHAR2, apellidos VARCHAR2, 
      direccion VARCHAR2, telefono VARCHAR2)RETURN SELF AS RESULT, 
  
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
  CONSTRUCTOR FUNCTION Persona(DNI VARCHAR2, Nombre VARCHAR2, Apellidos VARCHAR2, 
      Direccion VARCHAR2, Telefono VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.DNI := DNI;
    SELF.nombre := nombre;
    SELF.apellidos := apellidos;
    SELF.direccion := direccion;
    SELF.telefono := telefono;
    RETURN;
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
    RETURN SELF.nombre;
  END getNombre;
  
  -- Definición del método setNombre
  MEMBER PROCEDURE setNombre(nombre VARCHAR2)
  IS BEGIN
    SELF.nombre := nombre;
  END setNombre;  
  
  -- Definición del método getApellidos
  MEMBER FUNCTION getApellidos RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.apellidos;
  END getApellidos;
  
  -- Definición del método setApellidos
  MEMBER PROCEDURE setApellidos(apellidos VARCHAR2)
  IS BEGIN
    SELF.apellidos := apellidos;
  END setApellidos;    
  
  -- Definición del método getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getDireccion;  
  
  -- Definición del método setDireccion
  MEMBER PROCEDURE setDireccion(direccion VARCHAR2)
  IS BEGIN
    SELF.direccion := direccion;
  END setDireccion;    
  
  -- Definición del método getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.telefono;
  END getTelefono;    
  
  -- Definición del método setTelefono
  MEMBER PROCEDURE setTelefono(telefono VARCHAR2)
  IS BEGIN
    SELF.telefono := telefono;
  END setTelefono;      
END;

/

--------------------------------
-- Definición del tipo Médico --
--------------------------------

-- Especificación del objeto Medico
CREATE TYPE Medico UNDER Persona 
( 
  -- Atributos del objeto Medico
  numColegiado      VARCHAR2(20), 
  sueldo            FLOAT,
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF 
      AS RESULT,
  
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
  CONSTRUCTOR FUNCTION Medico(numColegiado VARCHAR2, sueldo FLOAT) RETURN SELF 
      AS RESULT
  IS BEGIN
    SELF.numColegiado := numColegiado;
    SELF.sueldo := sueldo;
    RETURN;
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

----------------------------------
-- Definición del tipo Paciente --
----------------------------------

-- Especificación del objeto Paciente
CREATE TYPE Paciente UNDER Persona 
( 
  -- Atributos del objeto Medico
  enfermedadesCronicas      VARCHAR2(200), 
  alergologia               VARCHAR2(200), 
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, 
      alergologia VARCHAR2) RETURN SELF AS RESULT,
  
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
  CONSTRUCTOR FUNCTION Paciente(enfermedadesCronicas VARCHAR2, 
      alergologia VARCHAR2) RETURN SELF AS RESULT
  IS BEGIN
    SELF.enfermedadesCronicas := enfermedadesCronicas;
    SELF.alergologia := alergologia;
    RETURN;
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

------------------------------------
-- Definición del tipo Habitación --
------------------------------------

-- Especificación del objeto Habitacion
CREATE TYPE Habitacion AS OBJECT
( 
  -- Atributos del objeto Habitacion
  descripcion               VARCHAR2(50), 
  television                CHAR(1),
  refPaciente               REF Paciente,
  
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR, 
      refPaciente REF Paciente) RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
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
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Habitacion(descripcion VARCHAR2, television CHAR, 
      refPaciente REF Paciente) RETURN SELF AS RESULT
  IS BEGIN
    SELF.descripcion := descripcion;
    SELF.television := television;
    SELF.refPaciente := refPaciente;
    RETURN;
  END;
  
  -- Definición del método getDescripcion
  MEMBER FUNCTION getDescripcion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.descripcion;
  END getDescripcion;
  
  -- Definición del método setDescripcion
  MEMBER PROCEDURE setDescripcion(descripcion VARCHAR2)
  IS BEGIN
    SELF.descripcion := descripcion;
  END setDescripcion;      

  -- Definición del método getTelevision
  MEMBER FUNCTION getTelevision RETURN CHAR
  IS BEGIN
    RETURN SELF.television;
  END getTelevision;
  
  -- Definición del método setTelevision
  MEMBER PROCEDURE setTelevision(television CHAR)
  IS BEGIN
    SELF.television := television;
  END setTelevision;      
  
  -- Definición del método getRefPaciente
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente
  IS BEGIN
    RETURN SELF.refPaciente;
  END getRefPaciente;
  
  -- Definición del método setRefPaciente
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente)
  IS BEGIN
    SELF.refPaciente := refPaciente;
  END setRefPaciente;        
END;

/

-------------------------------------------
-- Definición del tipo TablaHabitaciones --
-------------------------------------------

-- Creamos un tipo para almacenar las habitaciones
-- del hospital
CREATE TYPE TablaHabitaciones
   AS TABLE OF REF Habitacion;

/

----------------------------------
-- Definición del tipo Hospital --
----------------------------------

-- Especificación del objeto Hospital
CREATE TYPE Hospital AS OBJECT
( 
  -- Atributos del objeto Habitacion
  nombre               VARCHAR2(50), 
  direccion            VARCHAR2(250), 
  telefono             VARCHAR2(15), 
  fax                  VARCHAR2(15),
  habitaciones         TablaHabitaciones,
    
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Hospital(nombre VARCHAR2, direccion VARCHAR2, 
      telefono VARCHAR2, fax VARCHAR2, habitaciones TablaHabitaciones) 
      RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
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
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Hospital(nombre VARCHAR2, direccion VARCHAR2, 
      telefono VARCHAR2, fax VARCHAR2, habitaciones TablaHabitaciones) 
      RETURN SELF AS RESULT
  IS BEGIN
    SELF.nombre := nombre;
    SELF.direccion := direccion;
    SELF.telefono := telefono;
    SELF.fax := fax;
    SELF.habitaciones := habitaciones;
    RETURN;
  END;
  
  -- Definición del método getNombre
  MEMBER FUNCTION getNombre RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.nombre;
  END getNombre;
  
  -- Definición del método setNombre
  MEMBER PROCEDURE setNombre(nombre VARCHAR2)
  IS BEGIN
    SELF.nombre := nombre;
  END setNombre;      

  -- Definición del método getDireccion
  MEMBER FUNCTION getDireccion RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getDireccion;
  
  -- Definición del método setDireccion
  MEMBER PROCEDURE setDireccion(direccion VARCHAR2)
  IS BEGIN
    SELF.direccion := direccion;
  END setDireccion; 
    
  -- Definición del método getTelefono
  MEMBER FUNCTION getTelefono RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.direccion;
  END getTelefono;
  
  -- Definición del método setTelefono
  MEMBER PROCEDURE setTelefono(telefono VARCHAR2)
  IS BEGIN
    SELF.telefono := telefono;
  END setTelefono;   
  
  -- Definición del método getFax
  MEMBER FUNCTION getFax RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.fax;
  END getFax;
  
  -- Definición del método setFax
  MEMBER PROCEDURE setFax(fax VARCHAR2)
  IS BEGIN
    SELF.fax := fax;
  END setFax;     
  
  -- Definición del método getFax
  MEMBER FUNCTION getHabitaciones RETURN TablaHabitaciones
  IS BEGIN
    RETURN SELF.habitaciones;
  END getHabitaciones;
  
  -- Definición del método setFax
  MEMBER PROCEDURE setHabitaciones(habitaciones TablaHabitaciones)
  IS BEGIN
    SELF.habitaciones := habitaciones;
  END setHabitaciones;      
END;

/

-------------------------------------
-- Definición del tipo Diagnóstico --
-------------------------------------

-- Especificación del objeto Diagnostico
CREATE TYPE Diagnostico AS OBJECT
( 
  -- Atributos del objeto Diagnostico
  enfermedad           VARCHAR2(100), 
  tratamiento          VARCHAR2(500), 
  refPaciente          REF Paciente, 
  refMedico            REF Medico,
    
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Diagnostico(enfermedad VARCHAR2, tratamiento VARCHAR2, 
      refPaciente REF Paciente, refMedico REF Medico) RETURN SELF AS RESULT,
  
  -- Definición del resto de funciones
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
  -- Definición del constructor
  CONSTRUCTOR FUNCTION Diagnostico(enfermedad VARCHAR2, tratamiento VARCHAR2, 
      refPaciente REF Paciente, refMedico REF Medico) RETURN SELF AS RESULT
  IS BEGIN
    SELF.enfermedad := enfermedad;
    SELF.tratamiento := tratamiento;
    SELF.refPaciente := refPaciente;
    SELF.refMedico := refMedico;
    RETURN;
  END;
  
  -- Definición del método getEnfermedad
  MEMBER FUNCTION getEnfermedad RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.enfermedad;
  END getEnfermedad;
  
  -- Definición del método setEnfermedad
  MEMBER PROCEDURE setEnfermedad(enfermedad VARCHAR2)
  IS BEGIN
    SELF.enfermedad := enfermedad;
  END setEnfermedad;   
  
  -- Definición del método getTratamiento
  MEMBER FUNCTION getTratamiento RETURN VARCHAR2
  IS BEGIN
    RETURN SELF.tratamiento;
  END getTratamiento;
  
  -- Definición del método setTratamiento
  MEMBER PROCEDURE setTratamiento(tratamiento VARCHAR2)
  IS BEGIN
    SELF.tratamiento := tratamiento;
  END setTratamiento;   
  
  -- Definición del método getRefPaciente
  MEMBER FUNCTION getRefPaciente RETURN REF Paciente
  IS BEGIN
    RETURN SELF.refPaciente;
  END getRefPaciente;
  
  -- Definición del método setRefPaciente
  MEMBER PROCEDURE setRefPaciente(refPaciente REF Paciente)
  IS BEGIN
    SELF.refPaciente := refPaciente;
  END setRefPaciente;     
  
  -- Definición del método getRefMedico
  MEMBER FUNCTION getRefMedico RETURN REF Medico
  IS BEGIN
    RETURN SELF.refMedico;
  END getRefMedico;
  
  -- Definición del método setRefPaciente
  MEMBER PROCEDURE setRefMedico(refMedico REF Medico)
  IS BEGIN
    SELF.refMedico := refMedico;
  END setRefMedico;     
  
END;

/

-------------------------------------------
-- Creación de las tablas de los objetos --
-------------------------------------------

-- Creación de tablas a partir de los objetos creados anteriormente
CREATE TABLE tbPersona OF Persona;
CREATE TABLE tbPaciente OF Paciente;
CREATE TABLE tbMedico OF Medico;
CREATE TABLE tbHabitacion OF Habitacion;  
CREATE TABLE tbDiagnostico OF Diagnostico;

-- Al crear la tabla a partir del objeto Hospital, hay que especificar que el 
-- campo correspondiente a la tabla anidada se almacenará en una tabla aparte
CREATE TABLE tbHospital OF Hospital(nombre NOT NULL, direccion NOT NULL, 
    telefono NOT NULL, fax NOT NULL) NESTED TABLE habitaciones 
    STORE AS tbTablaHabitaciones;

------------------------------
-- Declaración de variables --
------------------------------

-- Declaramos las variables que usaremos
DECLARE 
  unMedico        Medico;
  unPaciente      Paciente;
  unDiagnostico   Diagnostico;
  unaHabitacion   Habitacion;
  unHospital      Hospital;
  
  refMedico       REF Medico;
  refPaciente     REF Paciente;
  
  refHab1         REF Habitacion;
  refHab2         REF Habitacion;
  refHab3         REF Habitacion;
  refHab4         REF Habitacion;
  refHab5         REF Habitacion;
  
BEGIN

--------------------------------------
-- Creación e insercción de medicos --
--------------------------------------

  -- Creamos el primer médico
  unMedico := NEW Medico('11111111A', 'Rudy', 'Mentario', 'Acacias, 15', 
      '111111111', '001', 1000.00);
  
  -- Lo introducimos en la tabla correspondiente
  INSERT INTO tbMedico VALUES(unMedico);

  -- Creamos el segundo médico
  unMedico := NEW Medico('22222222B', 'Carmen', 'Opausia', 'Palmeras, 3', 
      '222222222', '002', 2000.00);
    
  -- Lo introducimos en la tabla correspondiente  
  INSERT INTO tbMedico VALUES(unMedico);

  -- Creamos el tercer médico
  unMedico := NEW Medico('33333333C', 'Josechu', 'Leton', 'Rododendros, 49', 
      '333333333', '003', 3000.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);

  -- Creamos el cuarto médico
  unMedico := NEW Medico('44444444D', 'Jose', 'Rucho', 'Pino, 5', 
      '4444444444', '004', 4000.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);
  
  -- Creamos el quinto médico  
  unMedico := NEW Medico('55555555E', 'Pepe', 'Ñazo', 'Abetos, 6', 
      '555555555', '005', 5000.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);
  
  -- Creamos el sexto médico  
  unMedico := NEW Medico('123654789G', 'Alan', 'Brito', 'Eucaliptos, 56', 
      '123654789', '006', 1000.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);  
  
    -- Creamos el septimo médico  
  unMedico := NEW Medico('115975382E', 'Estela', 'Gartija', 'Chopos, sn', 
      '123123132', '007', 1500.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);  

  -- Creamos el octavo médico  
  unMedico := NEW Medico('115544669T', 'Chema', 'Pamundi', 'Carambolo, 7', 
      '123321123', '008', 1550.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);  

  -- Creamos el noveno médico  
  unMedico := NEW Medico('987654321K', 'Jesus', 'Tituto', 'Lentisco, 99', 
      '456654456', '009', 1235.00);

  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbMedico VALUES(unMedico);  

----------------------------------------
-- Creación e insercción de pacientes --
----------------------------------------
  
  -- Creamos el primer paciente
  unPaciente := NEW Paciente('66666666F', 'Pepe', 'Reza', 'Alcornoques, 45', 
      '666666666', 'Herpes', 'Alergico a las sulfamidas');
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el segundo paciente
  unPaciente := NEW Paciente('777777777G', 'Aitor', 'Tilla', 'Limonero, 6', 
      '777777777', 'Cardiopatía congénita', 'Alergico al trabajo');
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);  

  -- Creamos el tercer paciente
  unPaciente := NEW Paciente('88888888H', 'Carmelo', 'Cotón', 'Alcornoques, 54', 
      '888888888', NULL, NULL);
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el Cuarto paciente
  unPaciente := NEW Paciente('99999999I', 'Encarna', 'Vales', 'Cedro, 11', 
      '999999999', 'Piedras en el riñon', 'Alergica al trabajo');
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el quinto paciente
  unPaciente := NEW Paciente('75891814J', 'Enrique', 'Cido', 'Laurel, 67', 
      '123456789', 'Hepatitis C', 'Alergico al comino');
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el sexto paciente
  unPaciente := NEW Paciente('141748924H', 'Debora', 'Dora', 'Higero, 89', 
      '963258741', NULL, NULL);
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el septimo paciente
  unPaciente := NEW Paciente('15896547M', 'Francisco', 'Rupto', 'Madroño, 1', 
      '987123658', 'Gota', NULL);
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el octavo paciente
  unPaciente := NEW Paciente('11224563P', 'Andres', 'Trozado', 'Mimosa, 89', 
      '778922546', NULL, 'Intolerancia a la lactosa');
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

  -- Creamos el noveno paciente
  unPaciente := NEW Paciente('74586932X', 'Ricardo', 'Borriquero', 'Nogal, 11', 
      '112236984', 'Enfermedad de Chrom', NULL);
  
  -- Lo introducimos en la tabla correspondiente    
  INSERT INTO tbPaciente VALUES(unPaciente);

-------------------------------------------
-- Creación e insercción de diagnósticos --
-------------------------------------------

  -- Creamos una referencia para el primer paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '66666666F';
  
  -- Creamos una referencia para el primer medico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '11111111A';

  -- Creamos el primer diagnóstico
  unDiagnostico := NEW Diagnostico('Enfermedad de Addison', 
      'Dosis de fludrocortisona', refPaciente, refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);
  
  -- Creamos una referencia para el segundo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '777777777G';
  
  -- Creamos una referencia para el segundo medico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '22222222B';

  -- Creamos el segundo diagnóstico
  unDiagnostico := NEW Diagnostico('Mononucleosis infecciosa', 
      'reposo, ingesta abundante de líquidos y la toma de ibuprofeno o paracetamol', 
      refPaciente, refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);  
    
  -- Creamos una referencia para el tercer paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '88888888H';
  
  -- Creamos una referencia para el tercer médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '33333333C';

  -- Creamos el tercer diagnóstico
  unDiagnostico := NEW Diagnostico('Enfermedad de Crohn', 
      'Infliximab y Adalimumab', refPaciente, refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);  
    
  -- Creamos una referencia para el cuarto paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '99999999I';
  
  -- Creamos una referencia para el cuarto médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '44444444D';

  -- Creamos el cuarto diagnóstico
  unDiagnostico := NEW Diagnostico('Cordoma', 
      'Resección quirúrgica completa, seguida de radioterapia', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);      
        
  -- Creamos una referencia al quinto paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '75891814J';
  
  -- Creamos una referencia al quinto médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '55555555E';

  -- Creamos el quinto diagnóstico
  unDiagnostico := NEW Diagnostico('Extrofia vesical', 
      'Reconstrucción quirúrgica de la vejiga y los genitales', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);       
  
  -- Creamos una referencia al sexto paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '141748924H';
  
  -- Creamos una referencia al sexto médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '123654789G';

  -- Creamos el sexto diagnóstico
  unDiagnostico := NEW Diagnostico('Aniridia', 
      'Trabeculectomía', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);      
  
    -- Creamos una referencia al septimo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '15896547M';
  
  -- Creamos una referencia al septimo médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '115975382E';

  -- Creamos el septimo diagnóstico
  unDiagnostico := NEW Diagnostico('Cólera', 
      'Rehidratación agresiva y antibióticos', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);      
  
    -- Creamos una referencia al octavo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '11224563P';
  
  -- Creamos una referencia al octavo médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '115544669T';

  -- Creamos el octavo diagnóstico
  unDiagnostico := NEW Diagnostico('Enfermedad de Dupuytren', 
      'Cirugía', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);  

    -- Creamos una referencia al noveno paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '74586932X';
  
  -- Creamos una referencia al noveno médico
  SELECT REF (p) INTO refMedico FROM tbMedico p WHERE p.DNI = '987654321K';

  -- Creamos el noveno diagnóstico
  unDiagnostico := NEW Diagnostico('Brucelosis', 
      'Rifampicina (600 a 900 mg diarios) y Doxiciclina (200 mg diarios) durante seis semanas', refPaciente, 
      refMedico);

  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbDiagnostico VALUES(unDiagnostico);  
  
-------------------------------------------
-- Creación e insercción de habitaciones --
-------------------------------------------
  
  -- Creamos una referencia para el primer paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '66666666F';

  -- Creamos la primera habitación
  unaHabitacion := NEW Habitacion('Habitación 001', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);       
  
  -- Creamos una referencia para el segundo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '777777777G';

  -- Creamos la segunda habitación
  unaHabitacion := NEW Habitacion('Habitación 002', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);       

  -- Creamos una referencia para el tercer paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '88888888H';

  -- Creamos la tercera habitación
  unaHabitacion := NEW Habitacion('Habitación 003', 'n', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);       
  
  -- Creamos la cuarta habitación. Esta habitación no tendrá pacientes
  unaHabitacion := NEW Habitacion('Habitación 004', 'n', NULL);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);       

    -- Creamos una referencia para el quinto paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '75891814J';

  -- Creamos la quinta habitación
  unaHabitacion := NEW Habitacion('Habitación 005', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);         

  -- Creamos una referencia para el sexto paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '141748924H';

  -- Creamos la sexta habitación
  unaHabitacion := NEW Habitacion('Habitación 1A', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);         

  -- Creamos una referencia para el septimo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '15896547M';

  -- Creamos la septima habitación
  unaHabitacion := NEW Habitacion('Baja 1', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);         

  -- Creamos una referencia para el octavo paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '11224563P';

  -- Creamos la octava habitación
  unaHabitacion := NEW Habitacion('3-2', 's', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);         

-- Creamos una referencia para el noveno paciente
  SELECT REF (p) INTO refPaciente FROM tbPaciente p WHERE p.DNI = '74586932X';

  -- Creamos la novena habitación
  unaHabitacion := NEW Habitacion('Habitacion 315', 'n', refPaciente);
  
  -- La insertamos en la tabla correspondiente
  INSERT INTO tbHabitacion VALUES(unaHabitacion);         
  
---------------------------------------
-- Creación e insercción de Hospital --
---------------------------------------
  
  -- Creamos las referencias a las habitaciones que tiene el primer hospital.
  SELECT REF (p) INTO refHab1 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 001';
      
  SELECT REF (p) INTO refHab2 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 002';
      
  SELECT REF (p) INTO refHab3 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 003';
      
  SELECT REF (p) INTO refHab4 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 004';
      
  SELECT REF (p) INTO refHab5 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 005';
  
  -- Creamos un nuevo objeto hospital, pasandole las referencias a las habitaciones
  -- como un objeto TablaHabitaciones
  unHospital := New Hospital('Sagrado Corazón', 
      'C/ Viladomat, 288, 08029 Barcelona', 
      '934948924', 
      '934948925', 
      TablaHabitaciones(refHab1, refHab2, refHab3, refHab4, refHab5));
  
  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbHospital VALUES(unHospital);
    
  -- Creamos las referencias a las habitaciones que tiene el segundo hospital.
  SELECT REF (p) INTO refHab1 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitación 1A';
  
  -- Creamos un nuevo objeto hospital, pasandole las referencias a las habitaciones
  -- como un objeto TablaHabitaciones
  unHospital := New Hospital('Clínica Mediterraneo', 
      'Nueva Musa, s/n  [04007]', '950621063', '950621036',
      TablaHabitaciones(refHab1));
  
  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbHospital VALUES(unHospital);  
  
  -- Creamos las referencias a las habitaciones que tiene el tercer hospital.
  SELECT REF (p) INTO refHab1 FROM tbHabitacion p 
      WHERE p.descripcion = 'Baja 1';
  
  -- Creamos un nuevo objeto hospital, pasandole las referencias a las habitaciones
  -- como un objeto TablaHabitaciones
  unHospital := New Hospital('Clínica San Rafael', 
      'La Estrecha, 33 (La Corredoira)[33011]', '985282526', '985282566',
      TablaHabitaciones(refHab1));
  
  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbHospital VALUES(unHospital);  

  -- Creamos las referencias a las habitaciones que tiene el cuarto hospital.
  SELECT REF (p) INTO refHab1 FROM tbHabitacion p 
      WHERE p.descripcion = '3-2';
  
  -- Creamos un nuevo objeto hospital, pasandole las referencias a las habitaciones
  -- como un objeto TablaHabitaciones
  unHospital := New Hospital('Complejo Asistencial de Soria', 
      'Pso. de Santa Bárbara, s/n  [42005]', '975234300', '975234301', 
      TablaHabitaciones(refHab1));
  
  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbHospital VALUES(unHospital);  

  -- Creamos las referencias a las habitaciones que tiene el quinto hospital.
  SELECT REF (p) INTO refHab1 FROM tbHabitacion p 
      WHERE p.descripcion = 'Habitacion 315';
  
  -- Creamos un nuevo objeto hospital, pasandole las referencias a las habitaciones
  -- como un objeto TablaHabitaciones
  unHospital := New Hospital('Hospital Universitari Arnau De Vilanova de Lleida', 
      'Av. Alcalde Rovira Roure, 80  [25198]', '973248100', '973248101',
      TablaHabitaciones(refHab1));
  
  -- Lo insertamos en la tabla correspondiente
  INSERT INTO tbHospital VALUES(unHospital);  
END;