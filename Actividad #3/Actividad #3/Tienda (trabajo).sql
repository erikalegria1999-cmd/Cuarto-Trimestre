CREATE DATABASE tienda CHARACTER SET utf8mb4;
use tienda;
CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

# 1 Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
# 2 Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre , precio from producto;
# 3 Lista todas las columnas de la tabla producto.
describe producto;
# 4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, concat(precio,"US") as precioDolar, concat(precio, "EU") as precioEuro
from producto;
# 5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las 
#columnas: nombre de producto, euros, dólares.
select nombre as "nombre de producto", concat(precio, " dolares") as dolares,
concat(precio, " euros") as euros
from producto;
#6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select upper(nombre), precio
from producto;
#7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select lower(nombre), precio
from producto;
#8 Lista el nombre de todos los fabricantes en una columna, y en otra columna 
# obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, upper(left(nombre,2)) 
from fabricante;
#9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio)
from producto;
#10 Lista los nombres y los precios de todos los productos de la tabla producto,
# truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, truncate(precio,0)
from producto;
#11 Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select id_fabricante
from producto;
#12 Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando 
#los identificadores que aparecen repetidos.
select distinct (id_fabricante) from producto;
#13 Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre
from producto
order by nombre asc;
#14 Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from producto order by nombre desc;
#16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;

#19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)

select nombre, precio
from producto
order by precio desc
limit 1;
# 24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select *
from producto
where (precio >=80) and (precio<=300);
#27 Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from producto
where (id_fabricante =1 or  id_fabricante =2 or id_fabricante =3);
#28 Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select *
from producto
where id_fabricante in (1,2,3);

#31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select *
from fabricante
where nombre like "%e";

#35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor 
# en el nombre y tienen un precio inferior a 215 €.
select nombre
from producto
where nombre like "%monitor%" and precio < 215 ;

