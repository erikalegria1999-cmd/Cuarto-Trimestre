# 1 Hacer una consulta a la tabla asignatura donde muestre las 
# asignaturas de tipo obligatoria como se muestra a continuación:
select *
from asignatura
where tipo = "obligatoria"; 
# 2 Hacer una consulta que muestre el nombre de la asignatura, créditos y tipo de la tabla 
#asignatura para aquellas asignaturas cuyos créditos son mayores a 4 y cuyo Tipo debe ser 
#diferente a Básica. El resultado debe ser ordenado por los créditos de menor a mayor.  
#Mostrar los resultados como se muestra a continuación. 
select * from asignatura;
select nombre as asignatura,
       creditos,
       tipo
from asignatura
where creditos > 4
  and tipo <> "basica"
order by creditos asc;
#3 Hacer una consulta que muestre el nombre de los alumnos en un solo campo donde incluya, 
# fecha de nacimiento, sexo y teléfono para aquellos alumnos que no tienen teléfono. Mostrar 
# los resultados como se muestra a continuación. 
select 
concat_ws(" ", nombre,apellido1, apellido2) as nombre,
 fecha_nacimiento,
 sexo,
 telefono,
 tipo
 from persona
 where tipo = "alumno" and(telefono = " " or telefono is null); 
# 4 Hacer una consulta que liste los nombres de los profesores con sus apellidos en 
#una sola columna, junto a su fecha de nacimiento, sexo 
# y tipo para aquellos profesores 
# que nacieron en el año 1977 y cuyo sexo es Femenino (M).
select 
    concat_ws(" ", nombre, apellido1, apellido2) as profesor,
    fecha_nacimiento,
    sexo,
    tipo
from persona
where year(fecha_nacimiento) = 1977
  and sexo = "m";
  
# 5 Liste el nombre, apellidos, sexo y tipo, de los profesores o alumnos 
#cuyo apellido1 o apellido2 
# terminan en la letra z. Mostrar los resultados como se muestra a continuación: 
select
    nombre,
    apellido1,
    apellido2,
    sexo,
    tipo
from persona
where tipo in ('profesor', 'alumno')
and (apellido1 like '%z' or apellido2 like '%z');
# 6 Hacer una consulta que devuelva la cantidad de alumnos de la Universidad. Resultado 
#El nombre de la columna llamatlo CAU_SUAPELLIDO 
select 
count(tipo) as "CAU_erik_alegria"
from persona
where tipo = "alumno";

#7 Hacer una consulta que devuelva la cantidad de alumnos de la universidad que tienen alguna 
#asignatura matriculada. Resultado: 
# El nombre de columna llamarla CAMA_SUAPELLIDO 
select count(distinct persona.id) as CAMA_erik_alegria
from persona
inner join alumno_se_matricula_asignatura
on persona.id = alumno_se_matricula_asignatura.id_alumno
where persona.tipo = 'alumno';
#8 Hacer una consulta que devuelva nombre, apellido1, apellido2 de todos
# los profesores de la 
# universidad, ordenados ascendentemente por nombre.
select
nombre,
 apellido1,
 apellido2
from persona
where tipo = "profesor"
order by nombre asc;
#9 Hacer una consulta que devuelva el nombre, apellido1, fecha de Nacimiento y tipo, de los 
#alumnos y profesores que hayan nacido en el segundo semestre del año. Ordenarlos por 
#fecha de nacimiento del menor de edad al mayor de edad.  Resultado:
select
    nombre,
    apellido1,
    fecha_nacimiento,
    tipo
from persona
where tipo in ('alumno', 'profesor')
and month(fecha_nacimiento) between 7 and 12
order by fecha_nacimiento desc;
#10 Hacer una consulta que devuelva el nombre y apellido1 de los profesores de la Universidad 
#que pertenecen a los Departamentos de Matemáticas o Educación. Resultado: 
 select 
    concat_ws(" ", persona.nombre, persona.apellido1) as Profesor,
    departamento.nombre as Departamento
from persona
inner join profesor
    on persona.id = profesor.id_profesor
inner join departamento
    on profesor.id_departamento = departamento.id
where departamento.nombre in ("Matemáticas", "Educación");
# 11 Hacer una consulta que devuelva el nombre, créditos y tipo de las 
#cinco primeras asignaturas 
# con menor crédito. Resultado. 
select
    asignatura.nombre,
    asignatura.creditos,
    asignatura.tipo
from asignatura
order by asignatura.creditos asc
limit 5;
#12 Hacer una consulta que devuelva el nombre, apellido1 y fecha de nacimiento 
#de los alumnos así como también el nombre de la asignatura para aquellos
# alumnos que tienen matriculadas asignaturas. Prueba 
#del resultado de la consulta. Se aclara que pueden ser más datos. 
select
    persona.nombre,
    persona.apellido1,
    persona.fecha_nacimiento,
    asignatura.nombre AS asignatura
from persona
inner join alumno_se_matricula_asignatura matricula
    on persona.id = matricula.id_alumno
inner join asignatura
    on matricula.id_asignatura = asignatura.id
where persona.tipo = 'alumno';
#13 Hacer una consulta que devuelva el nombre, apellido1 de los alumnos y profesores, así como 
#también el nombre de la asignatura para aquellos alumnos que tienen matriculadas 
#asignaturas. Mostrar los resultados de acuerdo a la imagen anexa. Se aclara que pueden ser 
# más datos.
select
    a.nombre as nombre_alumno,
    a.apellido1 as apellido1_alumno,
    p.nombre as nombre_profesor,
    p.apellido1 as apellido1_profesor,
    asig.nombre as nombre_asignatura
from persona a
inner join alumno_se_matricula_asignatura am 
    on a.id = am.id_alumno
inner join asignatura asig 
    on am.id_asignatura = asig.id
inner join persona p
    on asig.id_profesor = p.id
limit 0, 50;

# 14 Hacer una consulta que devuelva el nombre de la asignatura y el nombre del
# grado que tiene alumnos matriculados pertenecientes a los siguientes grados:
# Grado en Ingeniería Informática (Plan 2015), Grado en Matemáticas (Plan 2010).
# No repetir nombre de asignatura. Resultado 
select distinct 
    a.nombre as nombre_asignatura,
    g.nombre as nombre_grado
from asignatura a
join grado g 
on a.id_grado = g.id
join alumno_se_matricula_asignatura am 
ON a.id = am.id_asignatura
where g.nombre in (
    'Grado en Ingeniería Informática (Plan 2015)',
    'Grado en Matemáticas (Plan 2010)'
);

# 15 Hacer una consulta que devuelva el nombre, créditos y tipo de todas las asignaturas 
# que tienen alumnos matriculados cuyo curso escolar su año de inicio este comprendido entre 
# los años 2014 y 2015. La consulta debe mostrar el nombre de la asignatura de manera única.
select distinct a.nombre, a.creditos, a.tipo
from asignatura a
join alumno_se_matricula_asignatura m 
on a.id = m.id_asignatura
join curso_escolar c 
on m.id_curso_escolar = c.id
where c.anyo_inicio BETWEEN 2014 AND 2015;
