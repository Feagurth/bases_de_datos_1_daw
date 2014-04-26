-- Crea una tabla “Alumnado” de objetos “Alumno”. Inserta en dicha tabla las siguientes filas:
-- codigo: 100
-- dni: 76401092Z
-- nombre: MANUEL
-- apellidos: SUAREZ IBAÑEZ
-- sexo: M
-- fecha_nac: 30/6/1990
-- cursoAlumno: objeto previamente creado con los siguientes datos:
-- codigo: 1
-- nombre: Curso 1
-- refProfe: Referencia al profesor cuyo codigo es 3.
-- max_Alumn: 20 
-- fecha_Inic: 1/6/2011
-- fecha_Fin: 30/6/2011
-- num_Horas: 30
--
-- codigo: 102
-- dni: 6915588V
-- nombre: MILAGROSA
-- apellidos: DIAZ PEREZ
-- sexo: F
-- fecha_nac: 28/10/1984
-- cursoAlumno: objeto que se encuentre en la segunda posición de “listaCursos1”
-- (debe tomarse de la lista)

DROP TABLE Alumnado;

-- Creamos la tabla alumnado a partir del objeto Alumno
CREATE TABLE Alumnado OF Alumno;
/

-- Declaramos un tipo de array de cursos llamado listaCursos con un 
-- máximo de 10 Cursos
DECLARE TYPE ListaCursos IS VARRAY(10) OF Cursos;

  -- Declaramos un array listaCursos1 del tipo ListaCursos
  listaCursos1 ListaCursos;
  
  -- Declaramos un objeto alumno
  tmpAlumno Alumno;
  
  -- Declaramos un objeto Cursos para almacenar la referencia de los cursos
  -- que guardemos en los alumnos
  curso REF Cursos;
  
  -- Declaramos dos variables de referencia profe de tipo Profesor para almacenar
  -- las referencias a los profesores que guardaremos en los cursos
  profe1 REF Profesor;
  profe2 REF Profesor;
BEGIN

  -- Inicializamos el array listaCursos1 a un objeto del tipo ListaCursos 
  -- sin elementos
  listaCursos1 := ListaCursos();
  
  -- Definimos el primer elemento del array usando extend
  listaCursos1.extend(1);

  -- Selecionamos la referencia al profesor usando el código y lo almacenamos
  -- en la variable declarada a tal efecto
  SELECT REF (p) INTO profe1 FROM Profesorado p WHERE p.CODIGO = 3;
  
  -- Creamos un nuevo objeto curso con los valores definidos y lo almacenamos en la primera
  -- posición del array listaCursos1
  listaCursos1(1) := NEW Cursos(1, 'Curso 1', profe1, 20, '01/06/2011', '30/06/2011', 30);

  -- Definimos el un nuevo elemento en el array usando extend
  listaCursos1.extend(1);

    -- Selecionamos la referencia al profesor usando el dni y lo almacenamos
  -- en la variable declarada a tal efecto
  SELECT REF (p) INTO profe2 FROM Profesorado p WHERE p.DNI = '51083099F';
  
  -- Creamos un nuevo objeto curso con los valores definidos y lo almacenamos en la segunda
  -- posición del array listaCursos1
  listaCursos1(2) := NEW Cursos(2, 'Curso 2', profe2, 20, '01/06/2011', '30/06/2011', 30); 
  
  -- Creamos un nuevo objeto alumno con los valores definidos
  tmpAlumno := NEW Alumno(100, '76401092Z', 'MANUEL', 'SUAREZ IBAÑEZ', 'M', '30/06/1990', NEW Cursos(1, 'Curso 1', profe1, 20, '01/06/2011', '30/06/2011', 30));

    -- Insertamos el objeto en la tabla Alumnado
  INSERT INTO Alumnado VALUES
    (tmpAlumno
    );

 -- Creamos un nuevo objeto alumno con los valores definidos
  tmpAlumno := NEW Alumno(102, '6915588V', 'MILAGROSA', 'DIAZ PEREZ', 'F', '28/10/1984', listaCursos1(2));

    -- Insertamos el objeto en la tabla Alumnado
  INSERT INTO Alumnado VALUES
    (tmpAlumno
    );

END;

/

-- Mostramos las insercciones en la tabla Alumnado
Select * from Alumnado;  

