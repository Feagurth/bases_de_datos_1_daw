-- Obtener, de la tabla “Alumnado”, el alumno que tiene el código 100,
-- asignándoselo a una variable “unAlumno”. Modifica el código del alumno
-- guardado en esa variable “unAlumno” asignando el valor 101, y su curso debe
-- ser el segundo que se había creado anteriormente.
-- Inserta ese alumno en la tabla “Alumnado”.
DECLARE
  -- Variable para almacenar el objeto Alumno
  unAlumno Alumno;
  
  -- Variable para almacenar referencia a un objeto Profesor 
  profe REF Profesor;
BEGIN

  -- Seleccionamos el alumno con código 100 y lo almacenamos en la variable correspondiente
  SELECT Alumno(a.codigo, a.dni, a.nombre, a.apellidos, a.sexo, a.fecha_nac, a.cursoalumno) INTO unAlumno FROM Alumnado a WHERE a.codigo = 100;
  
  -- Cambiamos el valor del código
  unAlumno.codigo := 101;
  
  -- Selecionamos la referencia al profesor usando el dni y lo almacenamos
  -- en la variable declarada a tal efecto
  SELECT REF (p) INTO profe FROM Profesorado p WHERE p.DNI = '51083099F';
  
  -- Creamos un nuevo curso usando el profesor anterior y actualizamos el valor de cursosalumno
  -- del objeto alumno con el que estamos trabajando
  unAlumno.cursoalumno := NEW Cursos(2, 'Curso 2', profe, 20, '01/06/2011', '30/06/2011', 30);
  
  -- Insertamos el objeto en la tabla Alumnado
  INSERT INTO Alumnado VALUES
    (unAlumno
    );
  
END;

/ 

-- Mostramos el contenido de la tabla Alumnado
Select * from Alumnado;