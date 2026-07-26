create database inmobiliaria character set utf8mb4;
use inmobiliaria;

create table propietarios(
idpropietario int unsigned auto_increment primary key,
nombreCompleto varchar(200) not null,
direccion varchar(250) not null unique,
telefono int not null 
);
create table arrendatarios(
idArrendatario int unsigned auto_increment primary key,
nombreCompleto varchar(200) not null,
correo varchar(100) not null unique,
telefono int not null
);
create table casas(
idCasa int unsigned auto_increment primary key,
direccion varchar(100) not null,
estrato int not null,
numeroHabitacion int not null,
numeroBaños int not null,
area decimal(10,2) not null,
valorArrendo decimal(10,2) not null,
idpropietario int unsigned not null,
foreign key (idpropietario) references propietarios(idpropietario)
);
create table arriendo(
idArrendo int unsigned auto_increment primary key,
idCasa int unsigned not null,
idArrendatario int unsigned not null,
foreign key (idCasa) references casas(idCasa),
foreign key (idArrendatario) references arrendatarios(idArrendatario)
);
