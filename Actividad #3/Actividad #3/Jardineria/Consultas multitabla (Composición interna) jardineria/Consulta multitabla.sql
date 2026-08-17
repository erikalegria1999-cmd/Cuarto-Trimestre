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