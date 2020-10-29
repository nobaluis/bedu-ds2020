/*
 * BEDU - Data Science 2020
 * Sesion 02 - Reto 02
 * Luis Castillo
 */

-- 1. ¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto;

-- 2. ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%pasta%';

-- 3. ¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario), MAX(salario) FROM puesto;

-- 4. ¿Cuál es la suma del salario de los últimos cinco puestos agregados?

--   Opcion A: Obtener el max id en una subquery, asumiendo id autoincrementable sin huecos
SELECT SUM(salario) FROM puesto WHERE id_puesto > ((SELECT MAX(id_puesto) FROM puesto) - 5);

--   Opcion B: Obtener los ultimos id's con una subquery sin asumir nada
SELECT SUM(salario) FROM puesto WHERE id_puesto IN (
	SELECT * FROM (
		SELECT id_puesto FROM puesto ORDER BY id_puesto DESC LIMIT 5
	) AS subquery
);
