--TEMA 1 Top clientes con más facturas

select c.nombre, f.cliente_id, COUNT(*) AS num_facturas
FROM cliente c join factura f
on c.id = f.cliente_id
GROUP BY c.nombre, f.cliente_id
ORDER BY num_facturas DESC
LIMIT 10;

--TEMA 2 Top clientes que más gastaron

select c.nombre, sum(fd.cantidad * p.precio) as total_gastado
from cliente c join factura f 
on c.id = f.cliente_id
join factura_detalle fd 
on f.id = fd.factura_id 
join producto p
on fd.producto_id = p.id
group by c.nombre
order by total_gastado DESC;

--TEMA 3 Top monedas más utilizadas

select m.nombre, count(f.moneda_id) as cantidad
from moneda m join factura f
on m.id = f.moneda_id 
group by m.nombre 
order by cantidad DESC

--TEMA 4 Top proveedor de productos

select prov.nombre, count(prod.proveedor_id) as cantidad
from proveedor prov join producto prod
on prov.id = prod.proveedor_id
group by prov.nombre 
order by cantidad DESC;

--TEMA 5 Productos más vendidos

select p.nombre as nombre_producto, count(fd.producto_id) as cantidad
from producto p join factura_detalle fd 
on p.id = fd.factura_id 
group by p.nombre 
order by cantidad DESC;

-- TEMA 7 Productos menos vendidos

select p.nombre as nombre_producto, count(fd.producto_id) as cantidad
from producto p join factura_detalle fd 
on p.id = fd.factura_id 
group by p.nombre 
order by cantidad;

--TEMA 7 Consulta que muestre fecha de emisión de 
--factura, nombre y apellido del cliente, 
--nombres de productos de esa factura, cantidades compradas, 
--nombre de tipo de factura de una factura específica

select f.fecha_emision, c.nombre, c.apellido, prod.nombre,
fd.cantidad, ft.nombre
from cliente c join factura f 
on c.id = f.cliente_id 
join factura_detalle fd 
on f.id = fd.factura_id
join producto prod
on fd.factura_id = prod.id
join factura_tipo ft 
on f.factura_tipo_id = ft.id
order by fd.cantidad desc;

--TEMA 8 Montos de facturas ordenadas según totales

select f.id as numero_factura, sum(fd.cantidad * p.precio) as cantidad_total
from factura f join factura_detalle fd
on f.id = fd.factura_id 
join producto p
on fd.factura_id = p.id
group by numero_factura
order by cantidad_total desc;

--TEMA 9 Mostrar el iva 10% de los montos totales de
--facturas (suponer que todos los productos 
--tienen IVA 10%)

select f.id as numero_factura, sum(fd.cantidad * p.precio) as cantidad_total,
sum(fd.cantidad * p.precio)*0.1 as monto_iva
from factura f join factura_detalle fd
on f.id = fd.factura_id 
join producto p
on fd.factura_id = p.id
group by numero_factura
order by cantidad_total desc;
