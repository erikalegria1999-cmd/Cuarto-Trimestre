CREATE DATABASE  Pizzeria_erik_alegria CHARACTER SET utf8mb4;
USE Pizzeria_erik_alegria;

create table Pizzas_erik_alegria (
idpizza int auto_increment primary key ,
pizNombre varchar(100) not null,
 pizIngredientes varchar (100) not null,
 pizValor int not null
);
create table cliente_erik_alegria (
idcliente int auto_increment primary key,
 cliNombre varchar (100) not null,
  cliCorreo varchar (250) unique not null 
);
create table pedidos_erik_alegria (
    idpedido int auto_increment primary key,
    idcliente int not null,
    idpizza int not null,
    pedCantidad int not null,
    pedDireccion varchar(100) not null,
    petFechaHora datetime not null,    
    foreign key (idcliente) references cliente_erik_alegria(idcliente),
    foreign key (idpizza) references pizzas_erik_alegria(idpizza)
);
describe pedidos_erik_alegria;
create table facturas_erik_alegria (
idfactura int auto_increment primary key,
facValor int not null,
idpedido int not null,
foreign key (idpedido) references pedidos_erik_alegria(idpedido)
);
describe facturas_erik_alegria;

alter table cliente_erik_alegria
add cliTelefono varchar(15) not null
after cliNombre;
describe cliente_erik_alegria;

alter table facturas_erik_alegria
rename column facValor to  facValorFactura ;
describe facturas_erik_alegria;

alter table facturas_erik_alegria
 add facFormaPago enum("Efectivo", "nequi","Transferencia") not null;
describe facturas_erik_alegria;





