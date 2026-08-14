DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;

CREATE TABLE alumno (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  es_repetidor ENUM('sí', 'no') NOT NULL,
  teléfono VARCHAR(9)
);

INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990-12-01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998-04-02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988-01-03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993-06-13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995-11-24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991-03-28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996-09-17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994-05-20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999-07-08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998-02-03', 'no', NULL);

-- busqueda  de todas las tablas con *
select *
from alumno;
-- busqueda en la tabla  campo
select nombre from alumno;
-- busqueda por campos
select nombre, apellido1, apellido2 from alumno;
-- usamos la funcion concat_ws para agrupar los nombres con los apellidos
SELECT CONCAT_WS(" ",nombre, apellido1, apellido2) AS nombre_completo, fecha_nacimiento
FROM alumno;
-- ahora las vamos a poner en mayusculas
SELECT UPPER(CONCAT_WS(" ",nombre, apellido1, apellido2)) AS nombre_completo, fecha_nacimiento
FROM alumno;
-- se usa DISTINCT  para no repetir los datos mas de una  ves
SELECT distinct apellido1
 FROM alumno;
 -- ordenar con el ORDER BY
 SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1;

SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1, apellido2, nombre;

-- uso del WHERE 
SELECT *
FROM alumno
WHERE apellido1 = 'sanchez';
-- buscar por id 
SELECT *
FROM alumno
WHERE id = 9;

-- usando operadores 
SELECT nombre, fecha_nacimiento
FROM alumno
WHERE fecha_nacimiento > '1997/01/01';
-- busqueda especifica
SELECT *
FROM  alumno 
where es_repetidor = "no";
-- busqueda especifica por fecha 
select *
from alumno
where (fecha_nacimiento > "1994/01/01" and es_repetidor = "no");
-- se utiliza el between = entre a y h
select * from alumno 
where fecha_nacimiento between 
"1998/01/01" and "1998/12/31";
-- se usa el in para ordenar los apellidoss tal como estan en el parentecis 
SELECT *
FROM alumno
WHERE apellido1 IN ("Sánchez", "Martínez");

SELECT *
FROM alumno
WHERE apellido1 NOT IN ("Sánchez", "Martínez", "Domínguez");
--  utiliza el like que inicie con s
SELECT *
FROM alumno
WHERE apellido1 LIKE 'S%';
-- utiliza el like que inicie con cualquier letra y termine con z
SELECT *
FROM alumno
WHERE apellido1 LIKE '%z';
-- utiliza para  imprimir los que tienen la letra a 
SELECT *
FROM alumno
WHERE nombre LIKE '%a%';

-- llamar por espacios o cantidad de letras 
SELECT *
FROM alumno
WHERE nombre LIKE '____';
-- cuando quiero buscar los nulos 
SELECT *
FROM alumno
WHERE teléfono IS NULL;
-- cuando quiero los no nulos
SELECT *
FROM alumno
WHERE teléfono IS NOT  NULL;

-- 1 Devuelve un listado con dos columnas,
-- donde aparezca en la primera columna el nombre de los alumnos y en la segunda,
-- el nombre con todos los caracteres invertidos.
SELECT nombre,
       REVERSE(nombre) AS nombreReves
FROM alumno;
-- 2  Devuelve un listado con dos columnas,
-- donde aparezca en la primera columna el nombre y los apellidos de los alumnos
-- y en la segunda, el nombre y los apellidos con todos los caracteres invertidos.

SELECT concat_ws(" ",nombre,apellido1) AS nombreCompleto,
reverse( concat_ws("  ", nombre,apellido1)) AS nombreReversa
from alumno; 
-- 3 Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre 
-- y los apellidos de los alumnos en mayúscula y en la segunda, el nombre 
-- y los apellidos con todos los caracteres invertidos en minúscula.

SELECT  UPPER(concat_ws(" ", nombre, apellido1)) AS nombreCompletoMayuscula,
reverse((CONCAT_WS(" ", nombre, apellido1))) AS nombreCompletoMinusculas
from alumno;

-- 4 Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre 
-- y los apellidos de los alumnos, en la segunda, 
-- el número de caracteres que tiene en total el nombre y los apellidos 
-- y en la tercera el número de bytes que ocupa en total.

SELECT concat_ws(" ", nombre , apellido1) AS nombreCompleto,
CHAR_LENGTH( concat_ws(" ",nombre, apellido1)) as numeroCaracteres,
length(concat_ws(" ",nombre, apellido1)) AS numeroBytes
from alumno;
-- 5 Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre 
-- y los dos apellidos de los alumnos. En la segunda columna se 
-- mostrará una dirección de correo electrónico que vamos a calcular para cada alumno. 
-- La dirección de correo estará formada por el nombre y el primer apellido, separados por 
-- el carácter . y seguidos por el dominio @iescelia.org. Tenga en cuenta que la dirección 
-- de correo electrónico debe estar en minúscula. Utilice un alias apropiado para cada columna.

SELECT 
concat_ws(" ", nombre,apellido1, apellido2) as nombreCompleto,
lower(concat_ws(nombre,apellido1,"@iescelia.org")) as correo

from alumno;

-- 6 Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre 
-- y los dos apellidos de los alumnos. En la segunda columna se mostrará una dirección 
-- de correo electrónico que vamos a calcular para cada alumno. La dirección de correo 
-- estará formada por el nombre y el primer apellido, separados por el carácter .
-- y seguidos por el dominio @iescelia.org. Tenga en cuenta que la dirección de correo 
-- electrónico debe estar en minúscula. La tercera columna será una contraseña que vamos 
-- a generar formada por los caracteres invertidos del segundo apellido, seguidos de los 
-- cuatro caracteres del año de la fecha de nacimiento. Utilice un alias apropiado para cada 
-- columna.

select concat_ws( ".", nombre, apellido1 , apellido2) as nombreCompleto ,
lower(concat_ws(nombre,apellido1,"@iescelia.org")) as correo,
CONCAT(
REVERSE(apellido2),YEAR(fecha_nacimiento)) AS contraseña
from alumno;


SET GLOBAL lc_time_names = 'es_ES';
SET lc_time_names = 'es_ES';


select nombre, fecha_nacimiento, monthname( fecha_nacimiento) as "mes nacimiento"
from alumno;

select nombre, apellido1, apellido2, fecha_nacimiento,
truncate(datediff(now(),fecha_nacimiento)/365.25, 0) as edad
from alumno;
