# 1 Obtén un listado con el nombre de cada cliente y el nombre y apellido de 
# su representante de ventas.
select cliente.nombre_cliente,
concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2)
as "Nombre Completo"
from cliente
inner join empleado 
on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
#2 Muestra el nombre de los clientes que hayan realizado pagos junto 
#con el nombre de sus representantes de ventas.
select distinct
cliente.nombre_cliente,
concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as "Nombre completo"
from cliente
inner join pago
on cliente.codigo_cliente = pago.codigo_cliente
inner join empleado
on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
#3 Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select cliente.nombre_cliente,
    concat_ws(' ', empleado.nombre, empleado.apellido1, empleado.apellido2) as nombre_representante 
from cliente
inner join pago
on cliente.codigo_cliente = pago.codigo_cliente
inner join empleado
on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
#4 Devuelve el nombre de los clientes que han hecho pagos
# y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select distinct cliente.nombre_cliente,
concat_ws(" " , empleado.nombre, empleado.apellido1, empleado.apellido2) as representante,
 oficina.ciudad
 from cliente
 inner join pago 
 on cliente.codigo_cliente = pago.codigo_cliente
 inner join empleado 
 on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
 inner join oficina 
 on empleado.codigo_oficina = oficina.codigo_oficina;
 #5 Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con
 #la ciudad de la oficina a la que pertenece el representante.
 select 
    c.nombre_cliente,
    CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) AS representante,
    o.ciudad AS ciudad_oficina
from cliente c
left join pago p
    on c.codigo_cliente = p.codigo_cliente
inner join empleado e
    on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o
    on e.codigo_oficina = o.codigo_oficina
where p.codigo_cliente is null;
 # 6 Lista la dirección de las oficinas que tengan clientes en FuenlabradaLista 
 #la dirección de las oficinas que tengan clientes en Fuenlabrada
 select distinct o.linea_direccion1, o.linea_direccion2
from cliente c
inner join empleado e
    on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join  oficina o
    on e.codigo_oficina = o.codigo_oficina
where c.ciudad = 'Fuenlabrada';
# 7 Devuelve el nombre de los clientes y el nombre de sus representantes 
#junto con la ciudad de la oficina a la que pertenece el representante.
select 
c.nombre_cliente,
    CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) AS representante,
    o.ciudad
from cliente c
inner join empleado e 
	on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o 
on e.codigo_oficina = o.codigo_oficina;
# 8 Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select
    CONCAT_WS(' ', e.nombre, e.apellido1, e.apellido2) as empleado,
    CONCAT_WS(' ', j.nombre, j.apellido1, j.apellido2) as jefe
from empleado e
inner join empleado j
    on e.codigo_jefe = j.codigo_empleado;
# 9 Devuelve un listado que muestre el nombre de cada empleados,
# el nombre de su jefe y el nombre del jefe de sus jefe.
select 
    concat_ws(' ', e.nombre, e.apellido1, e.apellido2) as empleado,
    concat_ws(' ', j.nombre, j.apellido1, j.apellido2) as jefe,
    concat_ws(' ', jj.nombre, jj.apellido1, jj.apellido2) as jefe_del_jefe
from empleado e
left join empleado j 
    on e.codigo_jefe = j.codigo_empleado
left join empleado jj 
    on j.codigo_jefe = jj.codigo_empleado;
#10 Devuelve el nombre de los clientes a los que no 
#se les ha entregado a tiempo un pedido.
select distinct c.nombre_cliente
from cliente c
inner join pedido p
    on c.codigo_cliente = p.codigo_cliente
where p.fecha_entrega > p.fecha_esperada;
#11 Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select distinct
    c.nombre_cliente,
    pr.gama
from cliente c
inner join pedido p
    on c.codigo_cliente = p.codigo_cliente
inner join detalle_pedido dp
    on p.codigo_pedido = dp.codigo_pedido
inner join producto pr
    on dp.codigo_producto = pr.codigo_producto
order by c.nombre_cliente;
	
    