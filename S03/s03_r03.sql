/*
 * BEDU - Data Science 2020
 * Sesion 03 - Reto 03
 * Luis Castillo
 */

-- 01 - nombre de puestos por empleado
CREATE VIEW puestos AS
	SELECT p.nombre AS nombre_puesto,
		CONCAT(e.nombre, ' ',e.apellido_paterno) AS nombre_empleado
	FROM empleado AS e
	JOIN puesto AS p
	ON e.id_puesto = p.id_puesto;

SELECT * FROM puestos;

-- 02 - articulos vendidos por empleado
CREATE VIEW articulos_vendidos AS
	SELECT 
		CONCAT(e.nombre,' ',e.apellido_paterno) AS nombre_empleado,
		a.nombre AS nombre_articulo,
		v.clave AS clave_venta
	FROM venta AS v
	JOIN empleado AS e
	ON v.id_empleado = e.id_empleado
	JOIN articulo AS a
	ON v.id_articulo = a.id_articulo;

SELECT * FROM articulos_vendidos;

-- 03 - puesto con mas ventas
-- Aqui utilizo venta.id_venta en vez de venta.clave
--  por que una venta puede tener varias transacciones
--  realizadas por diferentes empleados con dif. puestos
--  y estas trasacciones estan definidas de manera unica por id_venta
CREATE VIEW ventas_puesto AS
	SELECT 
		p.nombre AS puesto, 
		COUNT(v.id_venta) AS ventas_por_puesto 
	FROM venta AS v
	JOIN empleado AS e
	ON v.id_empleado = e.id_empleado
	JOIN puesto AS p
	ON e.id_puesto = p.id_puesto
	GROUP BY p.nombre
	ORDER BY ventas_por_puesto DESC;

SELECT * FROM ventas_puesto;
