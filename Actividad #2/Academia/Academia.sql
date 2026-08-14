Create database academia charset utf8mb4;
use academia;

create table alumnos(
idAlumnos int unsigned auto_increment primary key,
identificacion int unique not null,
nombre varchar(100) not null,
apellido varchar(100) not null,
correo varchar(150) unique not null
);
describe alumnos;

create table profesor(
idProfesor int unsigned auto_increment primary key,
identificacion int unique not null,
nombre varchar(100) not null,
apellido varchar(100) not null,
correo varchar(150) unique not null,
especialidad varchar(200) not null
);
describe profesor;
create table cursos (
idCursos int unsigned auto_increment primary key,
codigo int unique not null,
nombre varchar(100) not null,
horas int not null,
fechaInicio date not null,
Profesor_asignado int unsigned not null,
 foreign key (Profesor_asignado) references profesor(idProfesor)
 on delete restrict
);
describe cursos;

create table matriculaCurso(
idAlumnos int unsigned not null,
idCursos int unsigned not null,
fecha date not null,
primary key(idAlumnos, idCursos),
foreign key(idalumnos) references alumnos(idAlumnos) on delete restrict,
foreign key(idCursos) references cursos(idCursos) on delete restrict
);
describe matriculaCurso;

describe alumnos;

alter table alumnos
add sexo enum("Femenino", "Masculino") not null
after apellido;

desc alumnos;

alter table profesor
add celular varchar(20);

desc profesor;

alter table cursos
modify horas int not null default 60 check (horas > 0);
desc cursos;

alter table profesor
modify especialidad varchar(120)not null;

desc profesor;

alter table matriculaCurso
add fechaMatricula date not null;

desc matriculaCurso;

alter table cursos
drop check cursos_ck_1;

desc cursos;


ALTER TABLE cursos
CHANGE COLUMN horas TotalHoras INT NOT NULL DEFAULT 60;

desc cursos;

show tables;

describe cursos;
desc alumnos;



