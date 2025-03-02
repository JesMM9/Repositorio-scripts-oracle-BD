--1. Lista el nombre de todos los productos que hay en la tabla producto.

SELECT NOMBRE
FROM PRODUCTO;

--2. Lista los nombres y los precios de todos los productos de la tabla producto.

SELECT NOMBRE, PRECIO
FROM PRODUCTO;

--3. Lista todas las columnas de la tabla producto.

SELECT *
FROM PRODUCTO;

--4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).

SELECT NOMBRE, PRECIO "PRECIO EN €", PRECIO*1.04 "PRECIO EN USD"
FROM PRODUCTO;

--5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.

SELECT NOMBRE "nombre de producto", PRECIO "euros", PRECIO*1.04 "dólares"
FROM PRODUCTO;

--6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.

SELECT UPPER(NOMBRE), PRECIO
FROM PRODUCTO;

--7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.

SELECT LOWER(NOMBRE), PRECIO
FROM PRODUCTO;

--8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.

SELECT NOMBRE, UPPER(NOMBRE)
FROM FABRICANTE;

--9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.

SELECT NOMBRE, PRECIO
FROM PRODUCTO;

--10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.

SELECT NOMBRE, PRECIO
FROM PRODUCTO;



