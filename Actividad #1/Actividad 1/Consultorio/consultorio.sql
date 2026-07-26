create database consultorio character set utf8mb4;
use consultorio;

create table paciente(
idPaciente int unsigned auto_increment primary key,
identificacion bigint unsigned not null unique,
nombre varchar(100) not null,
apellido varchar(100) not null,
genero varchar(100) not null,
fechaNacimiento date not null
);
create table medico (
idMedico int unsigned auto_increment primary key,
nombre varchar(100) not null,
apellido varchar(100) not null,
correo varchar(150) not null unique,
especialidad varchar(100) not null
);

create table cita(
idCita int unsigned auto_increment primary key,
fechaHora datetime not null,
idPaciente int unsigned not null,
idMedico int unsigned not null,
foreign key (idpaciente) references paciente(idPaciente),
foreign key (idMedico) references medico(idMedico)
);
