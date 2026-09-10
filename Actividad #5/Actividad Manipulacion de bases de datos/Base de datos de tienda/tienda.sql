create database Biblioteca CHARSET utf8mb4;
use biblioteca;

Create table autor(
idAutor int auto_increment primary key,
nombre varchar(250) not null,
apellido varchar(250) not null,
nacionalidad varchar(250) not null
);

create table editorial(
idEditorial int auto_increment primary key,
nombre varchar(250) not null
);

create table libro(
idLibro int auto_increment primary key,
titulo varchar (250) not null,
categoria varchar(250) not null,
fechaPublicacion datetime not null,
idioma varchar(250) not null,
libro_autor int,
libro_editorial int,
foreign key (libro_autor) references autor(idautor),
foreign key (libro_editorial) references editorial(idEditorial)
);
select * from editorial;
insert into editorial(nombre) value("Norma"), ("Aguila"),("Alfaguaira");
select* from autor;

insert into autor(nombre,apellido,nacionalidad) 
value("Gabriel","Márquez","Colombia"),
("José Eustasio","Rivera","Colombiano");

insert into autor(nombre,apellido,nacionalidad)
value("Inca Garcilaso","de la Vega ","peruano"),
("Juan","Espinoza Medrano","peruano");

insert into autor(nombre,apellido,nacionalidad)
value("Carlos","Fuentes","Mexicanos"),
("Octavio","Paz","Mexicanos");
insert into libro (titulo,categoria,fechaPublicacion,idioma,libro_autor,libro_editorial)
value
("Cien años de soledad", "Novela", "1967-05-30", "Español", 1, 1),
("La vorágine", "Novela", "1924-01-01", "Español", 2, 2),
("Comentarios Reales de los Incas", "Historia", "1609-04-09", "Español", 4, 3),
("Apologético en favor de Don Luis de Góngora", "Literatura", "1662-01-01", "Español", 5, 1),
("La muerte de Artemio Cruz", "Novela", "1962-01-01", "Español", 6, 2),
("El laberinto de la soledad", "Ensayo", "1950-01-01", "Español", 7, 3);
select libro.titulo,libro.categoria,libro.fechaPublicacion,libro.idioma,
    autor.nombre,autor.apellido,autor.nacionalidad
from libro
inner join autor
on libro.libro_autor = autor.idAutor;
update editorial
set nombre = "Alfaguara"
where idEditorial = 3;
select * from editorial;
update autor
set nombre = "Vicente", apellido = "Fernández"
where idAutor = 6 ;
select * from autor
where nacionalidad = "mexicanos";

select libro.titulo,autor.nombre,autor.apellido,autor.nacionalidad
from libro
inner join autor
on libro.libro_autor= autor.idAutor
where autor.nacionalidad = "mexicanos";
select * from libro;
update libro
inner join autor
on libro.libro_autor = autor.idAutor
set libro.idioma = "Mandarín"
where autor.nacionalidad = "Mexicanos";

select libro.titulo,libro.idioma, autor.nombre, autor.apellido
from libro
inner join autor
on libro.libro_autor = autor.idautor
where autor.nacionalidad = "mexicanos";
select * from libro;
delete from libro
where idlibro = 8;
select * from libro;
delete from libro
where idlibro in (11, 12);

select 
    libro.titulo,
    concat(autor.nombre, ' ', autor.apellido) as autor,
    editorial.nombre as editorial,
    libro.fechaPublicacion
from libro
inner join autor
    on libro.libro_autor = autor.idAutor
inner join editorial
    on libro.libro_editorial = editorial.idEditorial;
#Insertar 5 editoriales    
insert into editorial (nombre)
values
("planeta"),
("alfaguara"),
("sudamericana"),
("seix barral"),
("penguin random house");
#Insertar 5 autores suramericanos
insert into autor (nombre, apellido, nacionalidad)
values
("jorge", "isaacs", "colombiano"),
("mario", "vargas llosa", "peruano"),
("jorge", "amado", "brasileño"),
("augusto", "roa bastos", "paraguayo"),
("ernesto", "sábato", "argentino");
#Insertar 2 libros por cada autor
insert into libro
(titulo, categoria, fechaPublicacion, idioma, libro_autor, libro_editorial)
values
("maría", "novela", "1867-05-01", "español", 8, 4),
("francisca", "novela", "2020-01-01", "español", 8, 5),
("la ciudad y los perros", "novela", "1963-01-01", "español", 9, 6),
("conversación en la catedral", "novela", "1969-01-01", "español", 9, 7),
("doña flor y sus dos maridos", "novela", "1966-01-01", "español", 10, 8),
("capitanes de la arena", "novela", "1937-01-01", "español", 10, 4),
("yo el supremo", "novela", "1974-01-01", "español", 11, 5),
("hijo de hombre", "novela", "1960-01-01", "español", 11, 6),
("el túnel", "novela", "1948-01-01", "español", 12, 7),
("sobre héroes y tumbas", "novela", "1961-01-01", "español", 12, 8);
update libro
set fechaPublicacion = "2026-01-01"
where idlibro > 0;
select titulo, fechaPublicacion
from libro;

select
    libro.titulo,
    concat(autor.nombre, ' ', autor.apellido) as autor,
    editorial.nombre as editorial,
    libro.fechaPublicacion
from libro
inner join autor
    on libro.libro_autor = autor.idautor
inner join editorial
    on libro.libro_editorial = editorial.ideditorial;