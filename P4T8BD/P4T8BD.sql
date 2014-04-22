-- Crea un tabla “Profesorado” de objetos “Profesor”. Inserta en dicha tabla
-- dos
-- objetos “Profesor”. El primero de ellos con los datos:
-- codigo: 2
-- dni: 51083099F
-- nombre: MARIA LUISA
-- apellidos: FABRE BERDUN
-- sexo: F
-- fecha_nac: 31/03/1975
-- especialidad: TECNOLOGIA
-- antiguedad: 4
-- El segundo objeto “Profesor” debes crearlo usando el método constructor que
-- has
-- realizado anteriormente. Debes usar los siguientes datos:
-- codigo: 3
-- nombre: JAVIER
-- apellidos: JIMENEZ HERNANDO
-- especialidad: LENGUA

-- Creamos la tabla profesorado para que almacene objetos profesor
CREATE TABLE Profesorado OF Profesor;
/
DECLARE
  -- Declaramos dos objetos de tipo profesor
  profe1 Profesor;
  profe2 Profesor;
BEGIN
  -- Inicializamos el primer objeto usando el constructor por defecto de la clase
  profe1 := NEW Profesor(2, '51083099F', 'MARIA LUISA', 'FABRE BERDUN', 'F', '31/03/1975', 'TECNOLOGIA', 4);
  
  -- Inicializamos el segundo objeto con el constructor definido en tareas anteriores
  profe2 := NEW Profesor(3, 'JAVIER', 'JIMENEZ', 'HERNANDO', 'LENGUA');
  
  -- Insertamos el primer objeto en la tabla Profesorado
  INSERT INTO Profesorado VALUES
    (profe1
    );
    
  -- Insertamos el segundo objeto en la tabla Profesorado
  INSERT INTO Profesorado VALUES
    (profe2
    );
END;
/

-- Mostramos los resultados
SELECT * FROM PROFESORADO;