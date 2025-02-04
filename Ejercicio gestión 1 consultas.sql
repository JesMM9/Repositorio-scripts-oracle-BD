

--1. Código, fecha y doble del descuento de las facturas con iva cero.

SELECT codfac,fecha,dto*2 FROM facturas
WHERE iva=0;

--2. Código de las facturas con iva nulo.

SELECT codfac FROM facturas
WHERE iva IS NULL;

--3. Código y fecha de las facturas sin iva (iva cero o nulo).

SELECT codfac,fecha FROM facturas
WHERE NVL(iva,0)=0;

--4. Código de factura y de artículo de las líneas de factura en las que la cantidad solicitada es menor de 5 unidades y además se ha aplicado un descuento del 25% o mayor.

SELECT codfac,codart FROM LINEAS_FAC
WHERE cant<5 AND dto>=25;

--5. Obtener la descripción de los artículos cuyo stock está por debajo del stock mínimo, dado también la cantidad en unidades necesaria para alcanzar dicho mínimo.

SELECT descrip, stock_min-stock diferencias FROM articulos
WHERE stock<stock_min;

--6. Ivas distintos aplicados a las facturas.

SELECT DISTINCT iva FROM facturas;

--7. Código, descripción y stock mínimo de los artículos de los que se desconoce la cantidad de stock. Cuando se desconoce la cantidad de stock de un artículo, el stock es nulo.

SELECT codart,descrip,stock_min FROM articulos
WHERE stock IS NULL;

--8. Obtener la descripción de los artículos cuyo stock es más de tres veces su stock mínimo y cuyo precio supera los 6 euros.

SELECT descrip FROM articulos
WHERE stock>(stock_min*3) AND precio>6;

--9. Código de los artículos (sin que salgan repetidos) comprados en aquellas facturas cuyo código está entre 8 y 10.

SELECT DISTINCT codart FROM articulos,facturas
WHERE codfac BETWEEN 8 AND 10;

--10. Mostrar el nombre y la dirección de todos los clientes.

SELECT nombre,direccion FROM clientes;

--11. Mostrar los distintos códigos de pueblos en donde tenemos clientes.

SELECT C.codpue FROM clientes C;

--12. Obtener los códigos de los pueblos en donde hay clientes con código de cliente menor que el código 25. No deben salir códigos repetidos.

SELECT DISTINCT P.codpue FROM pueblos P,clientes C
WHERE C.codcli<25;

--13. Nombre de las provincias cuya segunda letra es una 'O' (bien mayúscula o minúscula).

SELECT nombre FROM provincias
WHERE LOWER(nombre) LIKE '_o%';

--14. Código y fecha de las facturas del año pasado para aquellos clientes cuyo código se encuentra entre 50 y 100.

SELECT codfac,fecha FROM facturas
WHERE codcli BETWEEN 50 AND 100 AND EXTRACT(YEAR FROM fecha)=EXTRACT(YEAR FROM SYSDATE)-1;

--15. Nombre y dirección de aquellos clientes cuyo código postal empieza por “12”. 

SELECT nombre,direccion FROM clientes
WHERE codpostal LIKE '12%';

--16. Mostrar las distintas fechas, sin que salgan repetidas, de las factura existentes de clientes cuyos códigos son menores que 50.

SELECT DISTINCT fecha FROM facturas
WHERE codcli<50;

--17. Código y fecha de las facturas que se han realizado durante el mes de junio del año 2004

SELECT codfac,fecha FROM facturas
WHERE EXTRACT(YEAR FROM fecha)=2004 AND EXTRACT(MONTH FROM fecha)=06;

--18. Código y fecha de las facturas que se han realizado durante el mes de junio del año 2004 para aquellos clientes cuyo código se encuentra entre 100 y 250.

SELECT F.codfac,F.fecha FROM facturas F,clientes C
WHERE EXTRACT(YEAR FROM F.fecha)=2004
AND EXTRACT(MONTH FROM F.fecha)=06
AND C.codcli BETWEEN 100 AND 250;

--19. Código y fecha de las facturas para los clientes cuyos códigos están entre 90 y 100 y no tienen iva. NOTA: una factura no tiene iva cuando éste es cero o nulo.

SELECT F.codfac,F.fecha FROM facturas F,clientes C
WHERE C.codcli BETWEEN 90 AND 100
AND NVL(F.iva,0)=0;

--20. Nombre de las provincias que terminan con la letra 's' (bien mayúscula o minúscula).

SELECT nombre FROM provincias
WHERE LOWER(nombre) LIKE '%s';

--21. Nombre de los clientes cuyo código postal empieza por “02”, “11” ó “21”.

SELECT nombre FROM clientes
WHERE codpostal LIKE '02%' OR codpostal LIKE '11%' OR codpostal LIKE '21';





