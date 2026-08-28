#1 Mostrar el nombre y el precio de todos los productos cuyo precio sea menor 
#que el promedio de todos los precios de los productos. 
select 
    productname as producto,
    price as precio
from products
where price < (
    select avg(price) 
    from products
)
order by price desc;
#2 Mostrar el nombre del producto, nombre de categoría y precio del producto 
#con el precio más bajo 
select 
    p.productname as producto,
    c.categoryname as categoria,
    p.price as precio
from products p
inner join categories c on p.categoryid = c.categoryid
where p.price = (
    select min(price) 
    from products
);
#3  Mostrar todos los datos de los productos cuyo precio sea mayor que el máximo 
#de los precios de los productos cuyo id sea 3, 6, 9 y 10
select *
from products
where price > (
    select max(price)
    from products
    where productid in (3, 6, 9, 10)
);
 #4 Listar todos los clientes (Customers), que estén en ciudades de los proveedores 
 #(Suppliers). El resultado debe mostrar el nombre del cliente en una columna 
 #con el alias Cliente y el nombre de la ciudad con una columna de alias Ciudad 
 select distinct
    c.customername as cliente,
    c.city as ciudad
from customers c
inner join suppliers s on c.city = s.city;
#5 . Listar las ordenes cuyo año sea mayor a las ordenes realizadas en el menor año.
select *
from orders
where year(orderdate) > (
    select min(year(orderdate))
    from orders
);
#6 Muestre el nombre, apellido de los empleados que vendieron en diciembre de 1996
# y el promedio total de ventas, tenga en cuenta que el promedio de las ventas 
#es sin rango de fecha.
select distinct
    e.firstname as nombre,
    e.lastname as apellido,
    (
        select avg(sub.total_orden)
        from (
            select sum(od.quantity * p.price) as total_orden
            from orderdetails od
            inner join products p on od.productid = p.productid
            group by od.orderid
        ) sub
    ) as promedio_total_ventas
from employees e
inner join orders o on e.employeeid = o.employeeid
where month(o.orderdate) = 12 
  and year(o.orderdate) = 1996;
  #7 Obtener los nombres de los productos que no han sido ordenados por ningún cliente
select productname as producto
from products
where productid not in (
    select distinct productid 
    from orderdetails
);
#8  Obtener el nombre de la categoría y el número de productos asociados a cada 
# categoría
select 
    c.categoryname as categoria,
    count(p.productid) as cantidad_productos
from categories c
left join products p on c.categoryid = p.categoryid
group by c.categoryid, c.categoryname
order by cantidad_productos desc;
