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





