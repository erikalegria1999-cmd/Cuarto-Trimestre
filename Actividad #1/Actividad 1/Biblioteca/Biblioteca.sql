create database biblioteca character set utf8mb4;
use biblioteca;
create table autor (
id_autor int unsigned auto_increment primary key,
nombre varchar(100) not null,
apellidos varchar(100) not null,
nacionalidad varchar(100) not null
);
create table editorial (
idEditorial int unsigned auto_increment primary key,
nombre varchar(100) not null
);

create table libro (
idLibro int unsigned auto_increment primary key,
titulo varchar(100) not null,
categoria varchar(100) not null,
fechaPublicacion date not null,
idlioma varchar(100) not null,
id_autor int unsigned not null,
foreign key(id_autor) references autor(id_autor),
id_editorial int unsigned not null,
foreign key(id_editorial) references editorial(idEditorial)
);

