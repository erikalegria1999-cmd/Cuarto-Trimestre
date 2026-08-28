#1 Devuelve el nombre del cliente con mayor límite de crédito.
select nombre_cliente, limite_credito
from cliente
order by limite_credito desc
limit 1;
#2 Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre, precio_venta
from producto
order by precio_venta desc
limit 1;
#3 Devuelve el nombre del producto del que se han vendido más unidades. 
# (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que 
# se han vendido de cada producto a partir 
# de los datos de la tabla detalle_pedido)
select 
    p.nombre,
    sum(dp.cantidad) as unidades_vendidas
from producto p
inner join detalle_pedido dp
    on p.codigo_producto = dp.codigo_producto
group by p.codigo_producto, p.nombre
order by unidades_vendidas desc
limit 1;
#4 Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. 
# (Sin utilizar INNER JOIN).
select 
    c.nombre_cliente,
    c.limite_credito
from cliente c
where c.limite_credito > (
    select sum(p.total)
    from pago p
    where p.codigo_cliente = c.codigo_cliente
);
#5 Devuelve el producto que más unidades tiene en stock.
select nombre_cliente, limite_credito
from cliente c1
where not exists (
    select 1 
    from cliente c2 
    where c2.limite_credito < c1.limite_credito
);
#6 Devuelve los nombres de los departamentos que tienen empleados asociados.
# (Utilizando ALL o ANY).
select ciudad
from oficina
where codigo_oficina = any (
    select codigo_oficina 
    from empleado
);
#7 Devuelve los nombres de los departamentos que 
# no tienen empleados asociados. (Utilizando ALL o ANY).
select ciudad
from oficina
where codigo_oficina <> all (
    select codigo_oficina 
    from empleado 
    where codigo_oficina is not null
);
#8 Devuelve los nombres de los departamentos que tienen empleados asociados. 
# (Utilizando IN o NOT IN).
select ciudad
from oficina
where codigo_oficina in (
    select codigo_oficina 
    from empleado
);
#9 Devuelve los nombres de los departamentos que no tienen empleados asociados.
 # (Utilizando IN o NOT IN).
 select ciudad
from oficina
where codigo_oficina not in (
    select codigo_oficina 
    from empleado 
    where codigo_oficina is not null
);
# 10 Devuelve los nombres de los departamentos que tienen empleados asociados. 
# (Utilizando EXISTS o NOT EXISTS)
select ciudad
from oficina o
where exists (
    select 1 
    from empleado e 
    where e.codigo_oficina = o.codigo_oficina
);
# 11 Devuelve los nombres de los departamentos que tienen empleados asociados.
# (Utilizando EXISTS o NOT EXISTS).
select ciudad
from oficina o
where exists (
    select 1 
    from empleado e 
    where e.codigo_oficina = o.codigo_oficina
);


 
