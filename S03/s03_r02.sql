/*
 * BEDU - Data Science 2020
 * Sesion 03 - Reto 02
 * Luis Castillo
 */

-- 01 - nombre de empleados de cada venta
-- Aqui seria la venta de cada articulo
--  por que cada venta (venta.clave) puder ser realizada
--  por mas de un emplado
SELECT v.id_venta, v.id_empleado, e.nombre, e.apellido_paterno 
FROM venta AS v
JOIN empleado AS e
ON e.id_empleado = v.id_empleado
ORDER BY v.id_venta;

-- 02 - nombre de articulos que se han vendido
SELECT v.id_venta, a.nombre
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo = a.id_articulo
ORDER BY v.id_venta;

-- 03 - total de cada venta
SELECT v.clave, ROUND(SUM(a.precio),2) as total_venta 
FROM venta AS v
JOIN articulo AS a
ON v.id_articulo =  a.id_articulo
GROUP BY v.clave
ORDER BY v.clave;
