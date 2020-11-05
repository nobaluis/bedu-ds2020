/*
 * BEDU - Data Science 2020
 * Sesion 03 - Reto 01
 * Luis Castillo
 */

-- 01 - nombre de empleados con sueldo menor a $10k
SELECT e.nombre, e.apellido_paterno , e.apellido_materno 
FROM empleado e 
WHERE e.id_puesto IN (
	SELECT p.id_puesto 
	FROM puesto AS p 
	WHERE p.salario < 10000
);
	
-- 02 - cantidad min y max de ventas de cada empleado
SELECT ss.id_empleado, MIN(ss.ventas), MAX(ss.ventas) 
FROM (
	SELECT v.clave, v.id_empleado, COUNT(*) AS ventas 
	FROM venta AS v 
	GROUP BY v.clave, v.id_empleado) AS ss 
GROUP BY ss.id_empleado;

-- 03 - calves de venta de articulos con precios > $5k;
SELECT DISTINCT v.clave
FROM venta AS v
WHERE v.id_articulo IN (
	SELECT a.id_articulo 
	FROM articulo AS a 
	WHERE a.precio > 5000
);