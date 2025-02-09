
--1. Mostrar los nombres y los créditos de cada una de las asignaturas.

SELECT NOMBRE, CREDITOS
FROM ASIGNATURA;

--2. Obtener los posibles distintos créditos de las asignaturas que hay en la base de datos.

SELECT DISTINCT CREDITOS
FROM ASIGNATURA;

--3. Mostrar todos los datos de todas de las personas

SELECT *
FROM PERSONA;

--4. Mostrar el nombre y créditos de las asignaturas del primer cuatrimestre.

SELECT NOMBRE, CREDITOS
FROM ASIGNATURA
WHERE CUATRIMESTRE=1;

--5. Mostrar el nombre y el apellido de las personas nacidas antes del 1 de enero de 1975.

SELECT NOMBRE, APELLIDO
FROM PERSONA
WHERE EXTRACT(YEAR FROM FECHA_NACIMIENTO)<1975;

--6. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos.

SELECT NOMBRE, COSTEBASICO
FROM ASIGNATURA
WHERE CREDITOS>4.5;

--7. Mostrar el nombre de las asignaturas cuyo coste básico está entre 25 y 35 euros.

SELECT NOMBRE
FROM ASIGNATURA
WHERE COSTEBASICO BETWEEN 25 AND 35;

--8. Mostrar el identificador de los alumnos matriculados en la asignatura '150212' o en la '130113' o en ambas.

SELECT IDALUMNO
FROM ALUMNO_ASIGNATURA
WHERE IDASIGNATURA LIKE '150212'
OR IDASIGNATURA LIKE '130113';

--9. Obtener el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos.

SELECT NOMBRE
FROM ASIGNATURA
WHERE CUATRIMESTRE=2
AND CREDITOS>6 OR CREDITOS<6;

--10. Mostrar el nombre y el apellido de las personas cuyo apellido comience por 'G'.

SELECT NOMBRE, APELLIDO
FROM PERSONA
WHERE UPPER(APELLIDO) LIKE 'G%';



