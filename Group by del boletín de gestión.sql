--1. Descuento medio aplicado en las facturas.

SELECT AVG(DTO)
FROM FACTURAS;

--2. Descuento medio aplicado en las facturas sin considerar los valores nulos.

SELECT AVG(DTO)
FROM FACTURAS;

--3. Descuento medio aplicado en las facturas considerando los valores nulos como cero.

SELECT AVG(NVL(DTO, 0))
FROM FACTURAS;

--4. Número de facturas.

SELECT COUNT(CODFAC)
FROM FACTURAS;

--5. Número de pueblos de la Comunidad de Valencia.

SELECT COUNT(P.CODPUE)
FROM PUEBLOS P JOIN PROVINCIAS PRO
ON P.CODPRO=PRO.CODPRO
WHERE UPPER(PRO.NOMBRE) IN ('VALENCIA','ALICANTE','CASTELLON');

--6. Importe total de los artículos que tenemos en el almacén. Este importe se calcula sumando el producto de las unidades en stock por el precio de cada unidad

SELECT SUM(A.PRECIO*A.STOCK)
FROM ARTICULOS A;

--7. Número de pueblos en los que residen clientes cuyo código postal empieza por ‘12’.

SELECT COUNT(DISTINCT P.CODPUE)
FROM CLIENTES C JOIN PUEBLOS P
ON C.CODPUE=P.CODPUE
WHERE C.CODPOSTAL LIKE '12%';

--8. Valores máximo y mínimo del stock de los artículos cuyo precio oscila entre 9 y 12 € y diferencia entre ambos valores

SELECT MIN(A.STOCK), MAX(A.STOCK), MIN(A.STOCK)-MAX(A.STOCK)
FROM ARTICULOS A
WHERE A.PRECIO BETWEEN 9 AND 12;

--9. Precio medio de los artículos cuyo stock supera las 10 unidades.

SELECT AVG(NVL(A.PRECIO, 0))
FROM ARTICULOS A
WHERE A.STOCK>10;

--10. Fecha de la primera y la última factura del cliente con código 210.

SELECT MIN(FECHA), MAX(FECHA)
FROM FACTURAS F
WHERE CODCLI=210;

--11. Número de artículos cuyo stock es nulo.

SELECT COUNT(CODART)
FROM ARTICULOS
WHERE STOCK IS NULL;

--12. Número de líneas cuyo descuento es nulo (con un decimal)

SELECT COUNT(LINEA)
FROM LINEAS_FAC
WHERE DTO IS NULL;

--13. Obtener cuántas facturas tiene cada cliente.

SELECT COUNT(F.CODFAC)
FROM FACTURAS F JOIN CLIENTE C
ON F.CODCLI=C.CODCLI;

--14. Obtener cuántas facturas tiene cada cliente, pero sólo si tiene dos o más  facturas.

SELECT COUNT(F.CODFAC)
FROM FACTURAS F JOIN CLIENTE C
ON F.CODCLI=C.CODCLI
HAVING COUNT(F.CODFAC)>=2;

--15. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de factura) de los  artículos.

SELECT SUM(CANT*PRECIO)
FROM LINEAS_FAC;

--16. Importe de la facturación (suma del producto de la cantidad por el precio de las líneas de factura) de aquellos artículos cuyo código contiene la letra “A” (bien mayúscula o minúscula).

SELECT SUM(CANT*PRECIO)
FROM LINEAS_FAC LF JOIN FACTURAS F
ON LF.CODFAC=F.CODFAC
WHERE UPPER(F.CODCLI) LIKE '%A%';

--17. Número de facturas para cada fecha, junto con la fecha.

SELECT CODFAC, FECHA
FROM FACTURAS
GROUP BY FECHA;

--18. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los pueblos que más clientes tengan.

SELECT COUNT(CODCLI), NOMBRE
FROM PUEBLOS
ORDER BY COUNT(CODCLI);

--19. Obtener el número de clientes del pueblo junto con el nombre del pueblo mostrando primero los pueblos que más clientes tengan, siempre y cuando tengan más de dos clientes.

SELECT COUNT(CODCLI), NOMBRE
FROM PUEBLOS
HAVING COUNT(CODCLI)>=2
ORDER BY COUNT(CODCLI);

--20. Cantidades totales vendidas para cada artículo cuyo código empieza por “P", mostrando también la descripción de dicho artículo.

SELECT LF.CANT, A.DESCRIP
FROM LINEAS_FAC LF JOIN ARTICULOS A
ON LF.CODART=A.CODART
WHERE UPPER(A.CODART) LIKE 'P%';

--21. Precio máximo y precio mínimo de venta (en líneas de facturas) para cada artículo cuyo código empieza por “c”.

SELECT MAX(PRECIO), MIN(PRECIO)
FROM LINEAS_FAC
WHERE UPPER(CODART) LIKE 'C%';

--22. Igual que el anterior pero mostrando también la diferencia entre el precio máximo y mínimo.

SELECT MAX(PRECIO), MIN(PRECIO), MAX(PRECIO)-MIN(PRECIO) DIFERENCIA
FROM LINEAS_FAC
WHERE UPPER(CODART) LIKE 'C%';

--23. Nombre de aquellos artículos de los que se ha facturado más de 10000 euros.

SELECT A.NOMBRE
FROM ARTICULOS A JOIN LINEAS_FAC LF
ON A.CODART=LF.CODART
WHERE LF.PRECIO>10000;

--24. Número de facturas de cada uno de los clientes cuyo código está entre 150 y 300 (se debe mostrar este código), con cada IVA distinto que se les ha aplicado.

SELECT DISTINCT IVA, CODFAC, CODCLI
FROM FACTURAS
WHERE CODCLI BETWEEN 150 AND 300;

--25. Media del importe de las facturas, sin tener en cuenta impuestos ni descuentos.

SELECT AVG(LF.PRECIO-F.IVA+F.DTO)
FROM FACTURAS F JOIN LINEAS_FAC LF
ON F.CODFAC=LF.CODFAC;








