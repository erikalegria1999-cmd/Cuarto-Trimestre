#1 Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select ciudad from oficina;
#2 Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad , telefono from oficina where pais = "españa" ;
#3 Devuelve un listado con el nombre, apellidos y email de los empleados 
#cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido1, apellido2 ,email from empleado where codigo_jefe = "7";
#4 Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto , nombre ,apellido1, apellido2, email from empleado where puesto = "Director general" ;
#5 Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select nombre, apellido1,apellido2, puesto from empleado where puesto != "representante ventas";
#6 Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_contacto from cliente where pais = "spain";
#7 Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct(estado) from pedido;
#8 Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008.
# Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
# Utilizando la función YEAR de MySQL.
select distinct codigo_cliente
from pago
where year(fecha_pago) = 2008;
# Utilizando la función DATE_FORMAT de MySQL.
select  distinct codigo_cliente
from pago
where date_format(fecha_pago, '%Y') = '2008';
# Sin utilizar ninguna de las funciones anteriores.
select distinct(codigo_cliente) from pago where fecha_pago between "2008-01-01" and "2008-12-31";
#9 Devuelve un listado con el código de pedido, código de cliente, 
# fecha esperada y fecha de entrega de los 
# pedidos que no han sido entregados a tiempo.
select codigo_pedido,codigo_cliente,fecha_esperada,fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;
#10 Devuelve un listado con el código de pedido, código de cliente, fecha 
# esperada y fecha de entrega de los pedidos cuya 
# fecha de entrega ha sido al menos dos días antes de la fecha esperada.
# Utilizando la función ADDDATE de MySQL.
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where ADDDATE(fecha_entrega, 2) <= fecha_esperada;
# Utilizando la función DATEDIFF de MySQL.
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where DATEDIFF(fecha_esperada, fecha_entrega) >= 2;
# ¿Sería posible resolver esta consulta utilizando 
# el operador de suma + o resta - ?
# respuesta
# no funciona por que de esa manera para sumar dias a una fecha en MYSQL
# se utlizan las funciones ADDDATE() DATE_ADD() DATEDIFF()
#11 Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select estado, fecha_pedido from pedido
where  estado= "rechazado" and year(fecha_pedido) = 2009;
#12 Devuelve un listado de todos los pedidos que han sido entregados en el mes
# de enero de cualquier año.
select estado, fecha_pedido from pedido
where estado = "entregado" and month(fecha_pedido)= 01;
#13 Devuelve un listado con todos los pagos que se realizaron en el año 2008 
# mediante Paypal. Ordene el resultado de mayor a menor.
select forma_pago, fecha_pago from pago
where forma_pago = "Paypal" and  year(fecha_pago) = 2008
order by fecha_pago desc;
#14 Devuelve un listado con todas las formas de pago que aparecen en la 
#tabla pago.Tenga en cuenta que no deben aparecer formas de pago repetidas.
select distinct forma_pago from pago;
# 15 Devuelve un listado con todos los productos que pertenecen a 
#la gama Ornamentales y que tienen más de 100 unidades en stock.
# El listado deberá estar ordenado por su precio de venta,
# mostrando en primer lugar los de mayor precio.
select gama, cantidad_en_stock, precio_venta from producto
where gama = "ornamentales" and cantidad_en_stock >"100"
order by precio_venta desc;
#16 Devuelve un listado con todos los clientes que sean de la 
# ciudad de Madrid y cuyo representante 
# de ventas tenga el código de empleado 11 o 30.
select ciudad, codigo_empleado_rep_ventas as rep_ventas from cliente
where ciudad ="Madrid" and (codigo_empleado_rep_ventas = 11 
or codigo_empleado_rep_ventas =30); 




