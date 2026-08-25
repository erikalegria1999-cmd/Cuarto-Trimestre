# 1Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select cliente.nombre_cliente
from cliente
left join pago
on cliente.codigo_cliente = pago.codigo_cliente
where pago.codigo_cliente is null;
# 2 Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select cliente.nombre_cliente
from cliente
left join pedido
on cliente.codigo_cliente = pedido.codigo_cliente
where pedido.codigo_cliente is null;
#3 Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select cliente.nombre_cliente
from cliente
left join pago
on cliente.codigo_cliente = pago.codigo_cliente
left join pedido
on cliente.codigo_cliente = pedido.codigo_cliente
where pago.codigo_cliente is null
and pedido.codigo_cliente is null;
#4Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as empleado
from empleado
left join oficina
on empleado.codigo_oficina = oficina.codigo_oficina
where oficina.codigo_oficina is null;
#5 Devuelve un listado que muestre solamente los empleados que no tienen un 
#cliente asociado.
select concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as empleado
from empleado
left join cliente
on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
where cliente.codigo_empleado_rep_ventas is null;
#6 Devuelve un listado que muestre solamente los empleados que no tienen un cliente 
#asociado junto con los datos de la oficina donde trabajan.
select concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as empleado,
       oficina.*
from empleado
left join cliente
on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
inner join oficina
on empleado.codigo_oficina = oficina.codigo_oficina
where cliente.codigo_empleado_rep_ventas is null;
#7 Devuelve un listado que muestre los empleados que no tienen una oficina asociada 
#y los que no tienen un cliente asociado.
select concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as empleado
from empleado
left join oficina
on empleado.codigo_oficina = oficina.codigo_oficina
left join cliente
on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
where oficina.codigo_oficina is null
or cliente.codigo_empleado_rep_ventas is null;
#8 Devuelve un listado de los productos que nunca han aparecido en un pedido.
select producto.nombre
from producto
left join detalle_pedido
on producto.codigo_producto = detalle_pedido.codigo_producto
where detalle_pedido.codigo_producto is null;
#9 Devuelve un listado de los productos que nunca han aparecido en un pedido. 
#El resultado debe mostrar el nombre,la descripción y la imagen del producto.
select producto.nombre,
       producto.descripcion
from producto
left join detalle_pedido
on producto.codigo_producto = detalle_pedido.codigo_producto
where detalle_pedido.codigo_producto is null;
#10 Devuelve las oficinas donde no trabajan ninguno de los empleados 
#que hayan sido los representantes de ventas de algún cliente que haya realizado
#la compra de algún producto de la gama Frutales.
select oficina.*
from oficina
where not exists (
    select 1
    from empleado
    inner join cliente
    on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
    inner join pedido
    on cliente.codigo_cliente = pedido.codigo_cliente
    inner join detalle_pedido
    on pedido.codigo_pedido = detalle_pedido.codigo_pedido
    inner join producto
    on detalle_pedido.codigo_producto = producto.codigo_producto
    where empleado.codigo_oficina = oficina.codigo_oficina
    and producto.gama = 'Frutales'
);
#11 Devuelve un listado con los clientes que han realizado algún pedido 
#pero no han realizado ningún pago.
select distinct cliente.nombre_cliente
from cliente
inner join pedido
on cliente.codigo_cliente = pedido.codigo_cliente
left join pago
on cliente.codigo_cliente = pago.codigo_cliente
where pago.codigo_cliente is null;
#12 Devuelve un listado con los datos de los empleados que 
# no tienen clientes asociados y el nombre de su jefe asociado.
select concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) as empleado,
       concat_ws(" ", jefe.nombre, jefe.apellido1, jefe.apellido2) as jefe
from empleado
left join cliente
on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
left join empleado jefe
on empleado.codigo_jefe = jefe.codigo_empleado
where cliente.codigo_empleado_rep_ventas is null;
