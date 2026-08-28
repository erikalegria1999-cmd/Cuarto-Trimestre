# 1Mostrar el nombre de la categoría y el número de productos 
# que hay por cada categoría. 
select c.categoryname, count(p.productid) as numerodeproductos
from categories c 
inner join products p on p.categoryid = c.categoryid
group by c.categoryname;
#2 Mostrar la cantidad de productos por cada proveedor(suppliers)
# El resultado debe mostrar el nombre del proveedor y la cantidad de productos.
select s.suppliername as "nombre del proveedor", count(p.productid) as "cantidad productos"
from suppliers s
inner join products p on s.supplierid = p.supplierid
group by s.suppliername;
#3 Mostrar el nombre y precio de los 5 productos más vendidos.
select p.productname, p.price, sum(od.quantity) as total_vendido
from products p
inner join orderdetails od on p.productid = od.productid
group by p.productid, p.productname, p.price
order by total_vendido desc
limit 5;
#4 Mostrar el promedio de ventas por mes. El resultado debe mostrar una columna 
#con el alias de Mes y otra columna con el alias de “PromedioVentas”, ordenado de 
# forma descendente por el promedio 
select month(o.orderdate) as mes, avg(od.quantity * p.price) as promedio_ventas
from orders o
inner join orderdetails od on o.orderid = od.orderid
inner join products p on od.productid = p.productid
group by month(o.orderdate)
order by promedio_ventas desc;
#5 Mostrar la cantidad de ordenes por mes. El resultado debe mostrar una columna 
# con el alias de Mes y otra columna con el alias de “Cantidad”, ordenado 
# de forma descendente por la  cantidad. 
select 
    month(o.orderid) as mes, 
    count(distinct o.orderid) as cantidad
from orders o
group by month(o.orderid)
order by cantidad desc;
#6 Mostrar el numero de ordenes de cada uno de los clientes por año,luego ordenar 
# codigo del cliente y el año. El resultado debe mostrar el nombre y
# país del cliente, número de ordenes por año. 
select 
    c.customername as cliente,
    c.country as pais,
    year(o.orderdate) as año,
    count(o.orderid) as cantidad_ordenes
from customers c
inner join orders o on c.customerid = o.customerid
group by c.customerid, c.customername, c.country, year(o.orderdate)
order by c.customerid asc, año asc;
#7 Mostrar la cantidad de ordenes atendidas por año para cada uno de los empleados.
# La consulta debe mostrar el nombre del empleado en una sola columna con 
#el alias de empleado y la cantidad de ordenes. Ordenar el resultado por la cantidad
# de ordenes en forma descendente.
select 
    concat(e.firstname, ' ', e.lastname) as empleado,
    year(o.orderdate) as anio,
    count(o.orderid) as cantidad_ordenes
from employees e
inner join orders o on e.employeeid = o.employeeid
group by e.employeeid, e.firstname, e.lastname, year(o.orderdate)
order by cantidad_ordenes desc;
#8 Listar código de producto, cantidad mínima, cantidad máxima, y cantidad total de
# productos vendidos de todas las órdenes en la tabla Order Details. 
#Muestre solo los productos cuya cantidad mínima sea 5 o más. Ordénelos 
#por cantidad total en forma descendente 
select 
    productid,
    min(quantity) as cantidad_minima,
    max(quantity) as cantidad_maxima,
    sum(quantity) as cantidad_total
from orderdetails
group by productid
having min(quantity) >= 5
order by cantidad_total desc;
#9Listar la cantidad de clientes por ciudad. El resultado debe mostrar una columna 
# con la ciudad y otra columna con la cantidad de clientes por ciudad. Colocar alias
# a cada columna para identificar su contenido. 



