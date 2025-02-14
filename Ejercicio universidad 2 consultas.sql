

--1. Para cada titulación ordenar por coste mostrando primero las asignaturas más caras y para las asignaturas del mismo coste mostrar por orden alfabético de nombre de asignatura.

SELECT A.COSTEBASICO, A.NOMBRE
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
ORDER BY A.COSTEBASICO ASC, A.NOMBRE DESC;

--2. Mostrar el nombre y los apellidos de los profesores.

SELECT P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN PROFESOR PR
ON P.DNI=PR.DNI;

--3. Mostrar el nombre de las asignaturas impartidas por profesores de Sevilla.

SELECT A.NOMBRE
FROM ASIGNATURA A JOIN PROFESOR PR
ON A.IDPROFESOR=PR.IDPROFESOR
JOIN PERSONA P
ON PR.DNI=P.DNI
WHERE UPPER(P.CIUDAD) LIKE '%SEVILLA%';

--4. Mostrar el nombre y los apellidos de los alumnos.

SELECT P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI;

--5. Mostrar el DNI, nombre y apellidos de los alumnos que viven en Sevilla.

SELECT P.DNI, P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
WHERE UPPER(P.CIUDAD) LIKE '%SEVILLA%';

--6. Mostrar el DNI, nombre y apellidos de los alumnos matriculados en la asignatura "Seguridad Vial".

SELECT P.DNI, P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
WHERE UPPER(A.NOMBRE) LIKE '%SEGURIDAD VIAL%';

--7. Mostrar el Id de las titulaciones en las que está matriculado el alumno con DNI 20202020A. Un alumno está matriculado en una titulación si está matriculado en una asignatura de la titulación.

SELECT A.IDTITULACION
FROM ASIGNATURA A JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
JOIN ALUMNO AL
ON ALA.IDALUMNO=A.IDALUMNO
WHERE UPPER(A.DNI) LIKE '20202020A';

--8. Obtener el nombre de las asignaturas en las que está matriculada Rosa Garcia.

SELECT A.NOMBRE
FROM ASIGNATURA A JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
JOIN ALUMNO AL
ON ALA.IDALUMNO=AL.IDALUMNO
JOIN PERSONA P
ON AL.DNI=P.DNI
WHERE UPPER(P.NOMBRE) LIKE 'ROSA'
AND UPPER(P.APELLIDO) LIKE 'GARCIA';

--9. Obtener el DNI de los alumnos a los que le imparte clase el profesor Jorge Saenz.

SELECT AL.DNI
FROM ALUMNO AL JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
JOIN PROFESOR PR
ON A.IDPROFESOR=PR.IDPROFESOR
JOIN PERSONA P
ON PR.DNI=P.DNI
WHERE UPPER(P.NOMBRE) LIKE 'JORGE'
AND UPPER(P.APELLIDO) LIKE 'SAENZ';

--10. Obtener el DNI, nombre y apellido de los alumnos a los que imparte clase el profesor Jorge Sáenz.

SELECT P.DNI, P.NOMBRE, P.APELLIDO
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
JOIN ASIGNATURA A
ON ALA.IDASIGNATURA=A.IDASIGNATURA
JOIN PROFESOR PR
ON A.IDPROFESOR=PR.IDPROFESOR
JOIN PERSONA P
ON PR.DNI=P.DNI
WHERE UPPER(P.NOMBRE) LIKE 'JORGE'
AND UPPER(P.APELLIDO) LIKE 'SAENZ';

--11. Mostrar el nombre de las titulaciones que tengan al menos una asignatura de 4 créditos.

SELECT T.NOMBRE
FROM TITULACION T JOIN ASIGNATURA A
ON T.IDTITULACION=A.IDTITULACION
WHERE A.CREDITOS>=4;

--12. Mostrar el nombre y los créditos de las asignaturas del primer cuatrimestre junto con el nombre de la titulación a la que pertenecen.

SELECT A.NOMBRE, A.CREDITOS, T.NOMBRE
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
WHERE A.CUATRIMESTRE=1;

--13. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos junto con el nombre de las personas matriculadas.

SELECT A.NOMBRE, A.COSTEBASICO, P.NOMBRE
FROM ASIGNATURA A JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
JOIN ALUMNO AL
ON ALA.IDALUMNO=AL.IDALUMNO
JOIN PERSONA P
ON AL.DNI=P.DNI
WHERE A.CREDITOS>4.5;

--14. Mostrar el nombre de los profesores que imparten asignaturas con coste entre 25 y 35 euros, ambos incluidos

SELECT P.NOMBRE
FROM PERSONA P JOIN PROFESOR PR
ON P.DNI=PR.DNI
JOIN ASIGNATURA A
ON PR.IDPROFESOR=A.IDPROFESOR
WHERE A.COSTEBASICO BETWEEN 25 AND 35;

--15. Mostrar el nombre de los alumnos matriculados en la asignatura '150212' ó en la '130113' ó en ambas.

SELECT P.NOMBRE
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
WHERE ALA.IDASIGNATURA LIKE '150212'
OR ALA.IDASIGNATUR LIKE '130113';

--16. Mostrar el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos, junto con el nombre de la titulación a la que pertenece.

SELECT A.NOMBRE, T.NOMBRE
FROM ASIGNATURA A JOIN TITULACION T
ON A.IDTITULACION=T.IDTITULACION
WHERE CUATRIMESTRE=2
AND (CREDITOS<6 OR CREDITOS>6);

--17. Mostrar el nombre y el número de horas de todas las asignaturas. (1cred.=10 horas) junto con el dni de los alumnos que están matriculados.

SELECT A.NOMBRE, A.CREDITOS*10 NUM_HORAS, AL.DNI
FROM ASIGNATURA A JOIN ALUMNO_ASIGNATURA ALA
ON A.IDASIGNATURA=ALA.IDASIGNATURA
JOIN ALUMNO AL
ON ALA.IDALUMNO=AL.IDALUMNO;

--18. Mostrar el nombre de todas las mujeres que viven en “Sevilla” y que estén matriculados de alguna asignatura.

SELECT P.NOMBRE
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
WHERE P.VARON=0
AND UPPER(P.CIUDAD) LIKE '%SEVILLA%';

--19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor con identificador p101.

SELECT A.NOMBRE
FROM ASIGNATURA A
WHERE A.CURSO=1
AND UPPER(A.IDPROFESOR) LIKE 'P101';

--20. Mostrar el nombre de los alumnos que se ha matriculado tres o más veces en alguna asignatura.

SELECT P.NOMBRE
FROM PERSONA P JOIN ALUMNO AL
ON P.DNI=AL.DNI
JOIN ALUMNO_ASIGNATURA ALA
ON AL.IDALUMNO=ALA.IDALUMNO
WHERE NUMEROMATRICULA>=3;





