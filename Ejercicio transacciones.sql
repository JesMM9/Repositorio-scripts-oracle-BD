/*Suponiendo que tenemos el AUTOCOMMIT desactivado, ¿Qué pasaría en las siguientes situaciones?

a)Si creo una nueva tabla llamada FACTURA en la base de datos y
  posteriormente inserto datos sobre ella. ¿Podrá ver esos datos otro
  programador/a que trabaje en tu equipo de desarrollo y que tenga acceso
  a la misma base de datos?. Justifica la respuesta.*/
  
CREATE TABLE FACTURA
(
	CODIGO NUMBER(9),
	NOMBRE VARCHAR2(100),
	CONSTRAINT PK_FACTURA PRIMARY KEY (CODIGO)
);

INSERT INTO FACTURA
VALUES(1, 'FACTURA1');

/*OTROS PROGRAMADORES PODRÁN VER LA TABLA CREADO PERO NO LOS DATOS INTRODUCIDOS, PORQUE
  LAS INSTRUCCIONES DDL LLEVAN UN COMMIT IMPLÍCITO MIENTRAS QUE LAS INSTRUCCIONES DML LO
  DEBES INDICAR EXPLÍCITAMENTE
*/

/*
b)Si posteriormente creo una nueva tabla CLIENTE en la base de datos.
  ¿Quedarán persistidos los datos en la base de datos? Indica qué ocurre
  y justifica la respuesta.*/

CREATE TABLE CLIENTE
(
	CODIGO NUMBER(9),
	NOMBRE VARCHAR2(100),
	CONSTRAINT PK_CLIENTE PRIMARY KEY (CODIGO)
);

/*SI SE CREA UNA NUEVA TABLA CLIENTE, LOS DATOS PERMANECERÁN DEBIDO
  A QUE LAS INSTRUCCIONES DDL LLEVAN UN COMMIT IMPLÍCITO*/


/*
c)Posteriormente nos damos cuenta que alguno de los datos que inserté
  en la tabla FACTURA no son correctos. ¿Puedo volver a la
  situación inicial con alguna operación? Indica cuál en caso de ser
  posible y justifica la respuesta.*/

/*NO SE PUEDE VOLVER A LA SITUACIÓN ANTES DE INTRODUCIR LOS DATOS PORQUE
  AL CREAR LA TABLA CLIENTE, SE HACE UN COMMIT IMPLÍCITO Y NO SE PUEDE VOLVER
  A ANTES DE UN COMMIT*/

/*
d)Inserto datos en la tabla CLIENTE y quiero que los datos queden persistidos
  en la base de datos. ¿Qué operación necesito realizar? Justifica la respuesta.*/

INSERT INTO CLIENTE
VALUES (1, 'CLIENTE1');

COMMIT;

/*SI QUIERO QUE UNA OPERACIÓN HECHA CON UNA INSTRUCCIÓN DML PERSISTA,
  DEBO INTRODUCIR LA INSTRUCCIÓN COMMIT*/

/*
e)Posteriormente quiero borrar solo algunos datos de la tabla CLIENTE pero
  por error he borrado todos los datos de la tabla.
  ¿Puedo realizar algo para recuperar los datos que borré?.
  Justifícalo y en caso de ser posible indica cómo actuarías.*/

ROLLBACK;

/*SI SE HA INTRODUCIDO INSTRUCCIONES DML ERRÓNEAS Y NO HEMOS HECHO UN COMMIT,
  SE PUEDE VOLVER AL ÚLTIMO COMMIT CON LA INSTRUCCIÓN ROLLBACK*/

/*
f)¿En qué consiste el SAVEPOINT? Explícalo detalladamente e indica
  a modo de ejemplo las instrucciones necesarias donde se vea que
  has utilizado varios INSERT y SAVEPOINT de forma que quede bien
  explicado su funcionamiento.*/

CREATE TABLE ALUMNO
(
	CODIGO NUMBER(9),
	NOMBRE VARCHAR2(100),
	CONSTRAINT PK_ALUMNO PRIMARY KEY (CODIGO)
);

INSERT INTO ALUMNO
VALUES (1, 'JESÚS');

INSERT INTO ALUMNO
VALUES (3, 'FRANCISCO');

SAVEPOINT INSERTS_EN_ALUMNO_CORRECTOS;

DELETE FROM ALUMNO;

ROLLBACK TO INSERTS_EN_ALUMNO_CORRECTOS;

DELETE FROM ALUMNO
WHERE NOMBRE LIKE 'FRAN%';

/*EN ESTE EJEMPLO, SE CREA UNA TABLA ALUMNO, COMO ES UNA INSTRUCCIÓN DDL LLEVA UN
  COMMIT IMPLÍCITO, DESPUÉS SE INTRODUCEN DATOS CON INSTRUCCIONES DML Y SE COLOCA UN
  SAVEPOINT. MÁS TARDE NOS DAMOS CUENTA DE QUE UN DATO ESTÁ MAL INTRODUCIDO Y LO QUEREMOS
  BORRAR, PERO SIN QUERER BORRAMOS TODA LA TABLA ENTERA, PARA EVITAR ESTO, SE INTRODUCE
  LA INSTRUCCIÓN ROLLBACK TO Y EL NOMBRE DEL SAVEPOINT PARA VOLVER A ANTES DE HACER EL
  DELETE FROM Y A CONTINUACIÓN SE HACE EL DELETE FROM CON EL WHERE CORRESPONDIENTE*/




