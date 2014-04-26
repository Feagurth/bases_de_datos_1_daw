-- Crea una colección VARRAY llamada “ListaCursos” en la que se puedan almacenar
-- hasta 10 objetos “Cursos”. Guarda en una instancia “listaCursos1” de dicha 
-- lista, los dos cursos siguientes:
-- El primer curso que debes almacenar en dicha lista debe tener los siguientes
-- datos:
-- codigo: 1
-- nombre: Curso 1
-- refProfe: Referencia al profesor cuyo codigo es 3.
-- max_Alumn: 20 
-- fecha_Inic: 1/6/2011
-- fecha_Fin: 30/6/2011
-- num_Horas: 30
-- El segundo curso que debes almacenar en dicha lista debe tener los siguientes 
-- datos:
-- codigo: 2
-- nombre: Curso 2
-- refProfe: Referencia al profesor cuyo DNI es 51083099F. 
-- max_Alumn: 20 
-- fecha_Inic: 1/6/2011
-- fecha_Fin: 30/6/2011 
-- num_Horas: 30

-- Declaramos un tipo de array de cursos llamado listaCursos con un 
-- máximo de 10 Cursos
DECLARE TYPE ListaCursos IS VARRAY(10) OF Cursos;
  -- Declaramos un array listaCursos1 del tipo ListaCursos
  listaCursos1 ListaCursos;
  
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
  

  -- Mostramos los nombres de los cursos almacenados en el array
  DBMS_OUTPUT.put_line(listaCursos1(1).nombre);
  DBMS_OUTPUT.put_line(listaCursos1(2).nombre);
  
END;
