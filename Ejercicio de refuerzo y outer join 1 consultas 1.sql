-- 1. Lista el primer apellido de todos los empleados.
SELECT apellido1
FROM empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido1
FROM empleado;

-- 3. Lista todas las columnas de la tabla empleado.
SELECT *
FROM empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
SELECT nombre, apellido1, apellido2
FROM empleado;

-- 5. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT codigo_departamento
FROM empleado;

-- 6. Lista el identificador de los departamentos de los empleados eliminando los repetidos.
SELECT DISTINCT codigo_departamento
FROM empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
SELECT nombre || ' ' || apellido1 || ' ' || NVL(apellido2, '') AS nombre_completo
FROM empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna, en mayúsculas.
SELECT UPPER(nombre || ' ' || apellido1 || ' ' || NVL(apellido2, '')) AS nombre_completo
FROM empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna, en minúsculas.
SELECT LOWER(nombre || ' ' || apellido1 || ' ' || NVL(apellido2, '')) AS nombre_completo
FROM empleado;

-- 10. Lista el identificador de los empleados junto al nif, separando los dígitos y la letra.
SELECT codigo, SUBSTR(nif, 1, LENGTH(nif) - 1) AS numeros_nif, SUBSTR(nif, -1, 1) AS letra_nif
FROM empleado;

-- 11. Lista el nombre de cada departamento y el presupuesto actual.
SELECT nombre, (presupuesto - gastos) AS presupuesto_actual
FROM departamento;

-- 12. Lista el nombre de los departamentos y el presupuesto actual ordenado ascendentemente.
SELECT nombre, (presupuesto - gastos) AS presupuesto_actual
FROM departamento
ORDER BY presupuesto_actual ASC;

-- 13. Devuelve un listado con los empleados y los datos de los departamentos donde trabajan.
SELECT e.*, d.*
FROM empleado e INNER JOIN departamento d
ON e.codigo_departamento = d.codigo;

-- 14. Devuelve un listado con los empleados y sus departamentos, ordenado por departamento y apellido.
SELECT e.*, d.*
FROM empleado e 
INNER JOIN departamento d
ON e.codigo_departamento = d.codigo 
ORDER BY d.nombre, e.apellido1, e.apellido2, e.nombre;

-- 15. Devuelve un listado con los departamentos que tienen empleados.
SELECT DISTINCT d.codigo, d.nombre
FROM departamento d INNER JOIN empleado e
ON d.codigo = e.codigo_departamento;

-- 16. Devuelve un listado con los departamentos que tienen empleados y su presupuesto actual.
SELECT d.codigo, d.nombre, (d.presupuesto - d.gastos) AS presupuesto_actual 
FROM departamento d INNER JOIN empleado e
ON d.codigo = e.codigo_departamento;

-- 17. Devuelve el nombre del departamento donde trabaja el empleado con NIF 38382980M.
SELECT d.nombre
FROM departamento d INNER JOIN empleado e
ON d.codigo = e.codigo_departamento 
WHERE e.nif = '38382980M';

-- 18. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT d.nombre
FROM departamento d INNER JOIN empleado e
ON d.codigo = e.codigo_departamento 
WHERE e.nombre = 'Pepe'
AND e.apellido1 = 'Ruiz'
AND e.apellido2 = 'Santana';

-- 19. Devuelve los empleados que trabajan en el departamento de I+D, ordenados alfabéticamente.
SELECT e.*
FROM empleado e INNER JOIN departamento d
ON e.codigo_departamento = d.codigo 
WHERE d.nombre = 'I+D'
ORDER BY e.nombre, e.apellido1, e.apellido2;

-- 20. Devuelve los empleados que trabajan en Sistemas, Contabilidad o I+D, ordenados alfabéticamente.
SELECT e.*
FROM empleado e INNER JOIN departamento d ON e.codigo_departamento = d.codigo 
WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D') 
ORDER BY e.nombre, e.apellido1, e.apellido2;

-- 21. Devuelve una lista con los empleados cuyos departamentos no tienen un presupuesto entre 100,000 y 200,000 euros.
SELECT e.nombre 
FROM empleado e INNER JOIN departamento d
ON e.codigo_departamento = d.codigo 
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;

-- 22. Devuelve los nombres de los departamentos con empleados cuyo segundo apellido es NULL, sin repetir.
SELECT DISTINCT d.nombre
FROM departamento d INNER JOIN empleado e
ON d.codigo = e.codigo_departamento 
WHERE e.apellido2 IS NULL;

-- 23. Devuelve todos los empleados con los datos de sus departamentos, incluyendo empleados sin departamento.
SELECT e.*, d.*
FROM empleado e LEFT JOIN departamento d
ON e.codigo_departamento = d.codigo;

-- 24. Devuelve solo los empleados sin departamento asociado.
SELECT e.*
FROM empleado e LEFT JOIN departamento d
ON e.codigo_departamento = d.codigo 
WHERE d.codigo IS NULL;

-- 25. Devuelve solo los departamentos sin empleados asociados.
SELECT d.*
FROM departamento d LEFT JOIN empleado e
ON d.codigo = e.codigo_departamento 
WHERE e.codigo IS NULL;

-- 26. Devuelve todos los empleados y departamentos, incluyendo empleados sin departamento y departamentos sin empleados.
SELECT e.*, d.*
FROM empleado e FULL OUTER JOIN departamento d
ON e.codigo_departamento = d.codigo 
ORDER BY d.nombre;

-- 27. Devuelve los empleados sin departamento y los departamentos sin empleados, ordenados por nombre del departamento.
SELECT e.*, d.*
FROM empleado e FULL OUTER JOIN departamento d
ON e.codigo_departamento = d.codigo 
WHERE e.codigo IS NULL
OR d.codigo IS NULL 
ORDER BY d.nombre;
