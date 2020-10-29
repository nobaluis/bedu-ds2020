/*
 * BEDU - Data Science 2020
 * Sesion 02 - Reto 03
 * Luis Castillo
 */

-- 1. ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, COUNT(*) AS registros FROM puesto GROUP BY nombre;

-- 2. ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, SUM(salario) AS salario_por_puesto FROM puesto GROUP BY nombre;

-- 3. ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(*) AS ventas FROM venta GROUP BY id_empleado;

-- 4. ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) AS ventas FROM venta GROUP BY id_articulo;