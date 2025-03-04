--1. Cuantos costes básicos hay.

SELECT COUNT(COSTEBASICO)
FROM ASIGNATURA;

--2. Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.

SELECT COUNT(A.IDASIGNATURA), T.NOMBRE
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
GROUP BY T.NOMBRE;

--3. Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.

SELECT T.NOMBRE, SUM(A.COSTEBASICO*A.CREDITOS) "PRECIO TOTAL"
FROM TITULACION T JOIN ASIGNATURA A
ON T.IDTITULACION=A.IDTITULACION
GROUP BY T.NOMBRE;

--4. Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%.

SELECT SUM(A.COSTEBASICO*A.CREDITOS*1.07) "COSTE GLOBAL"
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
WHERE UPPER(T.NOMBRE) LIKE 'MATEMATICAS';

--5. Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura.

SELECT COUNT(ALA.IDALUMNO), ALA.IDASIGNATURA
FROM ALUMNO_ASIGNATURA ALA
GROUP BY ALA.IDASIGNATURA;

--6. Igual que el anterior pero mostrando el nombre de la asignatura.

SELECT COUNT(ALA.IDALUMNO), ALA.IDASIGNATURA, A.NOMBRE
FROM ALUMNO_ASIGNATURA ALA JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
GROUP BY ALA.IDASIGNATURA, A.NOMBRE;

--7. Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar por el total de todas las asignaturas en las que está matriculada. Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado.

SELECT P.NOMBRE, SUM(A.COSTEBASICO*A.CREDITOS*ALA.NUMEROMATRICULA*1.1) "PRECIO TOTAL"
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
GROUP BY P.NOMBRE;

--8. Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el coste total de la 1ª matrícula sea mayor que 60 euros.

SELECT AVG(A.COSTEBASICO*A.CREDITOS)
FROM TITULACION T JOIN ASIGNATURA A
ON T.IDTITULACION=A.IDTITULACION
JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
WHERE ALA.NUMEROMATRICULA=1
AND A.COSTEBASICO*A.CREDITOS >60;

--9. Nombre de las titulaciones que tengan más de tres alumnos.

SELECT T.NOMBRE
FROM TITULACION T JOIN ASIGNATURA A
ON T.IDTITULACION=A.IDTITULACION
JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
GROUP BY T.NOMBRE
HAVING COUNT(ALA.IDALUMNO)>3;

--10. Nombre de cada ciudad junto con el número de personas que viven en ella.

SELECT CIUDAD, COUNT(DNI)
FROM PERSONA
GROUP BY CIUDAD;

--11. Nombre de cada profesor junto con el número de asignaturas que imparte.

SELECT P.NOMBRE, COUNT(A.IDASIGNATURA)
FROM PERSONA P JOIN PROFESOR PRO
ON P.DNI=PRO.DNI
JOIN ASIGNATURA A
ON PRO.IDPROFESOR=A.IDPROFESOR
GROUP BY P.NOMBRE;

--12. Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos.

SELECT P.NOMBRE, COUNT(ALA.IDALUMNO)
FROM PERSONA P JOIN PROFESOR PRO
ON P.DNI=PRO.DNI
JOIN ASIGNATURA A
ON PRO.IDPROFESOR=A.IDPROFESOR
JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
GROUP BY P.NOMBRE
HAVING COUNT(ALA.IDALUMNO)>=2;

--13. Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre.

SELECT MAX(SUM(COSTEBASICO))
FROM ASIGNATURA
GROUP BY CUATRIMESTRE;

--14. Suma del coste de las asignaturas.

SELECT SUM(COSTEBASICO*CREDITOS)
FROM ASIGNATURA;

--15. ¿Cuántas asignaturas hay?

SELECT COUNT(IDASIGNATURA)
FROM ASIGNATURA;

--16. Coste de la asignatura más cara y de la más barata.

SELECT MAX(COSTEBASICO*CREDITOS), MIN(COSTEBASICO*CREDITOS)
FROM ASIGNATURA;

--17. ¿Cuántas posibilidades de créditos de asignatura hay?

SELECT COUNT(CREDITOS)
FROM ASIGNATURA;

--18. ¿Cuántos cursos hay?

SELECT COUNT(NUMEROMATRICULA)
FROM ALUMNO_ASIGNATURA;

--19. ¿Cuántas ciudades hay?

SELECT COUNT(CIUDAD)
FROM PERSONA;

--20. Nombre y número de horas de todas las asignaturas.

SELECT NOMBRE, CREDITOS*10 "NUM HORAS"
FROM ASIGNATURA;

--21. Mostrar las asignaturas que no pertenecen a ninguna titulación.

SELECT IDASIGNATURA
FROM ASIGNATURA
WHERE NVL(IDTITULACION,0)=0;

--22. Listado del nombre completo de las personas, sus teléfonos y sus direcciones, llamando a la columna del nombre "NombreCompleto" y a la de direcciones "Direccion".

SELECT NOMBRE "NOMBRE COMPLETO", TELEFONO, DIRECCIONCALLE "DIRECCION"
FROM PERSONA;

--23. Cual es el día siguiente al día en que nacieron las personas de la B.D.

SELECT EXTRACT(DAY FROM FECHA_NACIMIENTO)+1
FROM PERSONA;

--24. Años de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento.

SELECT EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM FECHA_NACIMIENTO)
FROM PERSONA;

--25. Listado de personas mayores de 25 años ordenadas por apellidos y nombre, esta consulta tiene que valor para cualquier momento.

SELECT NOMBRE, APELLIDO
FROM PERSONA
WHERE EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM FECHA_NACIMIENTO)>25;


--26. Nombres completos de los profesores que además son alumnos.

SELECT P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN PROFESOR PRO
ON P.DNI=PRO.DNI
JOIN ASIGNATURA A
ON PRO.IDPROFESOR=A.IDPROFESOR
JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
JOIN ALUMNO AL
ON ALA.IDALUMNO=AL.IDALUMNO
WHERE AL.DNI=P.DNI;

--27. Suma de los créditos de las asignaturas de la titulación de Matemáticas.

SELECT SUM(A.CREDITOS)
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
WHERE UPPER(T.NOMBRE) LIKE 'MATEMATICAS';

--28. Número de asignaturas de la titulación de Matemáticas.

SELECT COUNT(A.IDASIGNATURA)
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
WHERE UPPER(T.NOMBRE) LIKE 'MATEMATICAS';

--29. ¿Cuánto paga cada alumno por su matrícula?

SELECT COUNT(A.COSTEBASICO*A.CREDITOS*ALA.NUMEROMATRICULA*1.1)
FROM ASIGNATURA A JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
GROUP BY ALA.IDALUMNO;

--30. ¿Cuántos alumnos hay matriculados en cada asignatura?

SELECT COUNT(ALA.IDALUMNO)
FROM ALUMNO_ASIGNATURA ALA JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
GROUP BY A.IDASIGNATURA;





