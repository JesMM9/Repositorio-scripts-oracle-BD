

--1. Mostrar el nombre de los clientes junto al nombre de su pueblo.

SELECT C.NOMBRE NOMBRE_CLIENTE,P.NOMBRE NOMBRE_PUEBLO FROM CLIENTES C,PUEBLOS P
WHERE C.CODPUE=P.CODPUE;

SELECT C.NOMBRE NOMBRE_CLIENTE,P.NOMBRE NOMBRE_PUEBLO FROM CLIENTES C JOIN PUEBLOS P
ON C.CODPUE=P.CODPUE;

--2. Mostrar el nombre de los pueblos junto con el nombre de la provincia correspondiente.

SELECT P.NOMBRE NOMBRE_PEUBLO, P2.NOMBRE NOMBRE_PROVINCIA FROM PUEBLOS P,PROVINCIAS P2
WHERE P.CODPRO=P2.CODPRO;

SELECT P.NOMBRE NOMBRE_PEUBLO, P2.NOMBRE NOMBRE_PROVINCIA FROM PUEBLOS P JOIN PROVINCIAS P2
ON P.CODPRO=P2.CODPRO;

--3. Mostrar el nombre de los clientes junto al nombre de su pueblo y el de su provincia.

SELECT C.NOMBRE,P.NOMBRE NOMBRE_PUEBLO,P2.NOMBRE NOMBRE_PROVINCIA FROM CLIENTES C,PUEBLOS P,PROVINCIAS P2
WHERE C.CODPUE=P.CODPUE AND P.CODPRO=P2.CODPRO;

SELECT C.NOMBRE , P.NOMBRE NOMBRE_PUEBLO , P2.NOMBRE NOMBRE_PROVINCIA FROM CLIENTES c JOIN PUEBLOS p 
ON C.CODPUE =P.CODPUE 
JOIN PROVINCIAS P2 
ON P.CODPRO =P2.CODPRO;

--4. Nombre de las provincias donde residen clientes sin que salgan valores repetidos.

SELECT DISTINCT P2.NOMBRE FROM PROVINCIAS P2, CLIENTES C, PUEBLOS P
WHERE C.CODPUE=P.CODPUE AND P.CODPRO=P2.CODPRO;

SELECT DISTINCT P2.NOMBRE FROM PUEBLOS P JOIN CLIENTES C
ON C.CODPUE=P.CODPUE
JOIN PROVINCIAS P2
ON P.CODPRO=P2.CODPRO;

--5. Mostrar la descripción de los artículos que se han vendido en una cantidad superior a 10 unidades. Si un artículo se ha vendido más de una vez en una cantidad superior a 10 sólo debe salir una vez.

SELECT DISTINCT A.DESCRIP FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART=LF.CODART AND LF.CANT >10;

SELECT DISTINCT A.DESCRIP FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
WHERE LF.CANT >10;

--6. Mostrar la fecha de factura junto con el código del artículo y la cantidad vendida por cada artículo vendido en alguna factura. Los datos deben salir ordenado por fecha, primero las más reciente, luego por el código del artículos, y si el mismo artículo se ha vendido varias veces en la misma fecha los más vendidos primero.

SELECT F.FECHA,LF.CODART,LF.CANT FROM FACTURAS F, LINEAS_FAC LF
WHERE F.CODFAC=LF.CODFAC
ORDER BY F.FECHA DESC, LF.CODART ASC, LF.CANT DESC;

SELECT F.FECHA,LF.CODART,LF.CANT FROM FACTURAS F JOIN LINEAS_FAC LF
ON F.CODFAC=LF.CODFAC
ORDER BY F.FECHA DESC, LF.CODART ASC, LF.CANT DESC;

--7. Mostrar el código de factura y la fecha de las mismas de las facturas que se han facturado a un cliente que tenga en su código postal un 7.

SELECT F.CODFAC, F.FECHA FROM FACTURAS F, CLIENTES C
WHERE F.CODCLI=C.CODCLI AND C.CODPOSTAL LIKE '%7%';

SELECT F.CODFAC, F.FECHA FROM FACTURAS F JOIN CLIENTES C
ON F.CODCLI=C.CODCLI
WHERE C.CODPOSTAL LIKE '%7%';

--8. Mostrar el código de factura, la fecha y el nombre del cliente de todas las facturas existentes en la base de datos.

SELECT F.CODFAC,F.FECHA,C.NOMBRE FROM FACTURAS F, CLIENTES C
WHERE F.CODCLI=C.CODCLI;

SELECT F.CODFAC,F.FECHA,C.NOMBRE FROM FACTURAS F JOIN CLIENTES C
ON F.CODCLI=C.CODCLI;

--9. Mostrar un listado con el código de la factura, la fecha, el iva, el dto y el nombre del cliente para aquellas facturas que o bien no se le ha cobrado iva (no se ha cobrado iva si el iva es nulo o cero), o bien el descuento es nulo.

SELECT F.CODFAC, F.FECHA, F.IVA, F.DTO, C.NOMBRE FROM FACTURAS F, CLIENTES C
WHERE F.CODCLI=C.CODCLI AND (NVL(IVA,0)=0 OR F.DTO IS NULL);

SELECT F.CODFAC, F.FECHA, F.IVA, F.DTO, C.NOMBRE FROM FACTURAS F JOIN CLIENTES C
ON F.CODCLI=C.CODCLI
WHERE (NVL(IVA,0)=0 OR F.DTO IS NULL)

--10. Se quiere saber que artículos se han vendido más baratos que el precio que actualmente tenemos almacenados en la tabla de artículos, para ello se necesita mostrar la descripción de los artículos junto con el precio actual. Además deberá aparecer el precio en que se vendió si este precio es inferior al precio original.

SELECT A.DESCRIP, A.PRECIO, LF.PRECIO PRECIO_VENDIDO FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART=LF.CODART AND LF.PRECIO<A.PRECIO;

SELECT A.DESCRIP, A.PRECIO, LF.PRECIO PRECIO_VENDIDO FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
WHERE LF.PRECIO<A.PRECIO;

--11. Mostrar el código de las facturas, junto a la fecha, iva y descuento. También debe aparecer la descripción de los artículos vendido junto al precio de venta, la cantidad y el descuento de ese artículo, para todos los artículos que se han vendido.

SELECT F.CODFAC, F.FECHA, F.IVA, F.DTO, A.DESCRIP, A.PRECIO, LF.CANT, LF.DTO
FROM FACTURAS F, ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART=LF.CODART AND LF.CODFAC=F.CODFAC;

SELECT F.CODFAC, F.FECHA, F.IVA, F.DTO, A.DESCRIP, A.PRECIO, LF.CANT, LF.DTO
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
JOIN FACTURAS F
ON F.CODFAC=LF.CODFAC;

--12. Igual que el anterior, pero mostrando también el nombre del cliente al que se le ha vendido el artículo.

SELECT F.CODFAC, F.FECHA, F.IVA, F.DTO, A.DESCRIP, A.PRECIO, LF.CANT, LF.DTO, C.NOMBRE
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
JOIN FACTURAS F
ON F.CODFAC=LF.CODFAC
JOIN CLIENTES C
ON F.CODCLI=C.CODCLI;

--13. Mostrar los nombres de los clientes que viven en una provincia que contenga la letra ma.

SELECT C.NOMBRE
FROM CLIENTES C
JOIN PUEBLOS P
ON C.CODPUE=P.CODPUE
JOIN PROVINCIAS P2
ON P.CODPRO=P2.CODPRO
WHERE LOWER(P2.NOMBRE) LIKE '%ma%';

--14. Mostrar el código del cliente al que se le ha vendido un artículo que tienen un stock menor al stock mínimo.

SELECT C.CODCLI
FROM CLIENTES C JOIN FACTURAS F
ON C.CODCLI=F.CODCLI
JOIN LINEAS_FAC LF
ON F.CODFAC=LF.CODFAC
JOIN ARTICULOS A
ON LF.CODART=A.CODART
WHERE A.STOCK<A.STOCK_MIN;

--15. Mostrar el nombre de todos los artículos que se han vendido alguna vez. (no deben salir valores repetidos)

SELECT DISTINCT A.DESCRIP
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART;

--16. Se quiere saber el precio real al que se ha vendido cada vez los artículos. Para ello es necesario mostrar el nombre del artículo, junto con el precio de venta (no el que está almacenado en la tabla de artículos) menos el descuento aplicado en la línea de descuento.

SELECT A.DESCRIP, LF.PRECIO-LF.DTO PRECIO_VENDIDO_CON_DESCUENTO
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART;

--17. Mostrar el nombre de los artículos que se han vendido a clientes que vivan en una provincia cuyo nombre termina  por a.

SELECT A.DESCRIP
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
JOIN FACTURAS F
ON LF.CODFAC=F.CODFAC
JOIN CLIENTES C
ON F.CODCLI=C.CODCLI
JOIN PUEBLOS P
ON C.CODPUE=P.CODPUE
JOIN PROVINCIAS P2
ON P.CODPRO=P2.CODPRO
WHERE LOWER(P2.NOMBRE) LIKE '%a';

--18. Mostrar el nombre de los clientes sin que salgan repetidos a los que se les ha hecho un descuento superior al 10% en alguna de sus facturas.

SELECT DISTINCT C.NOMBRE
FROM CLIENTES C JOIN FACTURAS F
ON C.CODCLI=F.CODCLI
WHERE F.DTO>10;

--19. Mostrar el nombre de los clientes sin que salgan repetidos a los que se les ha hecho un descuento superior al 10% en alguna de sus facturas o en alguna de las líneas que componen la factura o en ambas.

SELECT DISTINCT C.NOMBRE
FROM CLIENTES C JOIN FACTURAS F
ON C.CODCLI=F.CODCLI
JOIN LINEAS_FAC LF
ON F.CODFAC=LF.CODFAC
WHERE F.DTO>10 OR LF.DTO>10;

--20. Mostrar la descripción, la cantidad y el precio de venta de los artículos vendidos al cliente con nombre MARIA MERCEDES

SELECT A.DESCRIP, LF.CANT, LF.PRECIO
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
JOIN FACTURAS F
ON LF.CODFAC=F.CODFAC
JOIN CLIENTES C
ON F.CODCLI=C.CODCLI
WHERE UPPER(C.NOMBRE) LIKE 'MARIA MERCEDES';







