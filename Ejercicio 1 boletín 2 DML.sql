CREATE TABLE FABRICANTE
(
	CODIGO NUMBER(10);
	NOMBRE VARCHAR2(100);
	CONSTRAINT PK_FABRICANTE PRIMARY KEY (CODIGO)
);

CREATE TABLE PRODUCTO
(
	CODIGO NUMBER(10);
	NOMBRE VARCHAR2(100);
	PRECIO DECIMAL;
	CODIGO_FABRICANTE NUMBER(10);
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (CODIGO);
	CONSTRAINT FK1_PRODUCTO FOREIGN KEY (CODIGO_FABRICANTE) REFERENCES FABRICANTE(CODIGO)
);

INSERT INTO FABRICANTE
VALUES (1, 'Asus');

INSERT INTO FABRICANTE
VALUES (2, 'Lenovo');

INSERT INTO FABRICANTE
VALUES (3, 'Hewlett-Packard');

INSERT INTO FABRICANTE
VALUES (4, 'Samsung');

INSERT INTO FABRICANTE
VALUES (5, 'Seagate');

INSERT INTO FABRICANTE
VALUES (6, 'Crucial');

INSERT INTO FABRICANTE
VALUES (7, 'Gigabyte');

INSERT INTO FABRICANTE
VALUES (8, 'Huawei');

INSERT INTO FABRICANTE
VALUES (9, 'Xiaomi');

INSERT INTO PRODUCTO
VALUES (1, 'Disco duro SATA3 1TB', 86.99, 5);

INSERT INTO PRODUCTO
VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6);

INSERT INTO PRODUCTO
VALUES (3, 'Disco SSD 1 TB', 150.99, 4);

INSERT INTO PRODUCTO
VALUES (4, 'GeForce GTX 1050Ti', 185, 7);

INSERT INTO PRODUCTO
VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6);

INSERT INTO PRODUCTO
VALUES (6, 'Monitor 24 LED Full HD', 202, 1);

INSERT INTO PRODUCTO
VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1);

INSERT INTO PRODUCTO
VALUES (8, 'Portátil Yoga 520', 559, 2);

INSERT INTO PRODUCTO
VALUES (9, 'Portátil Ideapd 320', 444, 2);

INSERT INTO PRODUCTO
VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3);

INSERT INTO PRODUCTO
VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--1. Inserta un nuevo fabricante indicando su código y su nombre.
INSERT INTO FABRICANTE
VALUES (10, 'Apple');

--2. Inserta un nuevo fabricante indicando solamente su nombre.
INSERT INTO FABRICANTE(NOMBRE)
VALUES ('LG');/*VA A DAR UN ERROR, YA QUE NO CONTIENE CLAVE PRIMARIA*/

--3. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: código, nombre, precio y código_fabricante.
INSERT INTO PRODUCTO
VALUES (12, 'Apple 16 Pro Max', 1999.99, 10);

--4. Inserta un nuevo producto asociado a uno de los nuevos fabricantes. La sentencia de inserción debe incluir: nombre, precio y código_fabricante.
INSERT INTO PRODUCTO(NOMBRE,PRECIO,CODIGO_FABRICANTE)
VALUES ('Apple 16', 1699.99, 10);

--5. Elimina el fabricante Asus. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
DELETE FROM FABRICANTE
WHERE NOMBRE LIKE 'Asus';/*NO ES POSIBLE BORRARLO, YA QUE LA TABLA PRODUCTO TIENE UNA FOREIGN KEY CON RESPECTO A LA TABLA FABRICANTE*/
/*PARA BORRARLO CORRECTAMENTE, SE DEBE HACER LO SIGUIENTE:*/
DELETE FROM PRODUCTO
WHERE CODIGO_FABRICANTE=1;
DELETE FROM FABRICATE
WHERE NOMBRE LIKE 'Asus';

--6. Elimina el fabricante Xiaomi. ¿Es posible eliminarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese posible borrarlo?
DELETE FROM FABRICANTE
WHERE NOMBRE LIKE 'Xiaomi';

--7. Actualiza el código del fabricante Lenovo y asígnale el valor 20. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
UPDATE FABRICANTE
SET CODIGO=20
WHERE NOMBRE LIKE 'Lenovo';/*NO ES POSIBLE ACTUALIZARLO, YA QUE HAY PRODUCTOS CON EL CÓDIGO ORIGINAL DE LENOVO*/
/*PARA QUE LA ACTUALIZACIÓN FUNCIONE, SE DEBEN ACTUALIZAR LAS COLUMNAS DE CODIGO_FABRICANTE DE LA TABLA PRODUCTO A LOS CORRESPONDIENTES*/

--8. Actualiza el código del fabricante Huawei y asígnale el valor 30. ¿Es posible actualizarlo? Si no fuese posible, ¿qué cambios debería realizar para que fuese actualizarlo?
UPDATE FABRICANTE
SET CODIGO=30
WHERE NOMBRE LIKE 'Huawei';

--9. Actualiza el precio de todos los productos sumándole 5 € al precio actual.
UPDATE PRODUCTO
SET PRECIO=PRECIO+5;

--10.Elimina todas las impresoras que tienen un precio menor de 200 €.
DELETE FROM PRODUCTO
WHERE NOMBRE LIKE 'Impresora%' AND PRECIO<200;






