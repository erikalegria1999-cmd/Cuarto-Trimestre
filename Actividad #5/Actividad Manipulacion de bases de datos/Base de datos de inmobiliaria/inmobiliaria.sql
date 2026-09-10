create database inmobiliaria charset utf8mb4;
use inmobiliaria;

create table propietarios(
idpropietario int auto_increment primary key,
nombreCompleto varchar(250) not null,
direccion varchar(250) unique not null,
telefono int not null
);
create table arrendatarios (
idarrendatario int auto_increment primary key,
nombreCompleto varchar(250) not null,
correo varchar(250) unique not null,
telefono int not null
);
create table casa(
idcasa int auto_increment primary key,
direccion varchar(250) unique not null,
ciudad varchar(250) not null,
estrato int not null,
numeroHabitaciones int not null,
numeroBaños int not null,
area int not null,
idDelPropietario int,
foreign key (idDelPropietario) references propietarios(idpropietario)
);

create table arriendos (
idArrendo int auto_increment primary key,
valorDelArrendo int not null,
fechaInicioArrendo datetime not null,
idCasa int,
idArrendatario int,
foreign key (idCasa) references casa(idcasa),
foreign key (idArrendatario) references arrendatarios(idarrendatario)
);
 insert into  propietarios(nombreCompleto,direccion,telefono)
 values ("erik santiago Alegria rojas","calle 3n #9-94","3245847229"),
 ("alexandra muñoz", "calle 6n #4-31","3105834442"),
 ("cristiano ronaldo","calle 7a #30a-10", "3076100099");
 select * from casa;
 
 insert into casa(direccion,ciudad,estrato,numeroHabitaciones,numeroBaños,area,idDelPropietario)
 values ("calle 3 #6-75", "Popayan", 5, 6, 3, "500", 1),
("calle 10 #5-20", "Popayan", 4, 4, 2, "300", 2),
("carrera 8 #12-40", "Cali", 3, 3, 2, "250", 3);

insert into arrendatarios(nombreCompleto, correo, telefono)
values
("carlos gómez", "carlos@gmail.com", 3001234567),
("laura martínez", "laura@gmail.com", 3107654321),
("andrés rodríguez", "andres@gmail.com", 3159876543);

insert into arriendos(valorDelArrendo, fechaInicioArrendo)
values
(1000000, "2025-04-01 00:00:00");
insert into arriendos(valorDelArrendo, fechaInicioArrendo)
values
(1000000, "2026-08-15 00:00:00");

update propietarios
set nombreCompleto = "Marcos Cepeda Rico"
where idPropietario = 1;

update casa
set estrato = 3
where idCasa > 0;

select c.direccion, c.estrato, a.valorDelArrendo
from casa c
inner join arriendos a
on c.idCasa = a.idCasa;

update arriendos
set fechaInicioArrendo = "2026-09-01 00:00:00"
where idArrendo = 1;

insert into arriendos(valorDelArrendo, fechaInicioArrendo, idCasa, idArrendatario)
values
(800000, "2025-01-01 00:00:00", 1, 1),
(850000, "2025-02-15 00:00:00", 2, 2),
(900000, "2025-03-10 00:00:00", 3, 3),
(950000, "2025-04-20 00:00:00", 1, 1),
(1000000, "2025-05-05 00:00:00", 2, 2),
(1050000, "2025-06-15 00:00:00", 3, 3),
(1100000, "2025-07-01 00:00:00", 1, 1),
(1150000, "2025-08-10 00:00:00", 2, 2),
(1200000, "2025-09-25 00:00:00", 3, 3),
(1250000, "2025-10-15 00:00:00", 1, 1),
(1300000, "2026-01-10 00:00:00", 2, 2),
(1350000, "2026-03-05 00:00:00", 3, 3),
(1400000, "2026-05-20 00:00:00", 1, 1),
(1450000, "2026-07-15 00:00:00", 2, 2),
(1500000, "2026-09-01 00:00:00", 3, 3);
select * from arriendos
where year(fechaInicioArrendo) = 2025;

select *
from arriendos
where year(fechaInicioArrendo) = 2025;

delete a
from arriendos a
inner join casa c
on a.idCasa = c.idCasa
where c.estrato = 5;

select p.nombreCompleto as propietario,
       ar.nombreCompleto as arrendatario
from arriendos a
inner join casa c
on a.idCasa = c.idCasa
inner join propietarios p
on c.idDelPropietario = p.idPropietario
inner join arrendatarios ar
on a.idArrendatario = ar.idarrendatario;


