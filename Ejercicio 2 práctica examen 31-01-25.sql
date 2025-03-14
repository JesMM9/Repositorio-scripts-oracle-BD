CREATE TABLE CAMIONERO
(
	DNI VARCHAR2(9),
	Nombre VARCHAR2(10) NOT NULL,
	Telefono VARCHAR2(9) NOT NULL,
	Direccion VARCHAR2(50),
	Salario DECIMAL(5,2),
	Poblacion VARCHAR2(50),
	CONSTRAINT PK_CAMIONERO PRIMARY KEY (DNI),
	CONSTRAINT CHK1_CAMIONERO CHECK (REGEX_LIKE(DNI,'^[0-9]{8}[A-Z]'))
);

CREATE TABLE CAMION
(
	Matricula VARCHAR2(7),
	Modelo VARCHAR2(10),
	Tipo VARCHAR2(10),
	Potencia NUMBER(6),
	CONSTRAINT PK_CAMION PRIMARY KEY (Matricula),
	CONSTRAINT CHK1_CAMION CHECK (REGEX_LIKE(Matricula,'^[0-9]{4}[A-Z]{3}'))
);

CREATE TABLE CONDUCE
(
	DNI_Camionero VARCHAR2(9),
	Matricula_Camion VARCHAR2(7),
	Fecha DATE,
	CONSTRAINT PK_CONDUCE PRIMARY KEY (DNI_Camionero,Matricula_Camion,Fecha),
	CONSTRAINT FK1_CONDUCE FOREIGN KEY (DNI_Camionero) REFERENCES CAMIONERO(DNI),
	CONSTRAINT FK2_CONDUCE FOREIGN KEY (Matricula_Camion) REFERENCES CAMION(Matricula)
);

CREATE TABLE PROVINCIA
(
	Codigo NUMBER(4),
	Nombre VARCHAR2(20) NOT NULL,
	CONSTRAINT PK_PROVINCIA PRIMARY KEY (Codigo)
);

CREATE TABLE PAQUETE
(
	Codigo NUMBER(4),
	Descripcion VARCHAR2(50),
	Destinatario VARCHAR2(40),
	Direcc_dest VARCHAR2(50),
	DNI_Camionero VARCHAR2(9),
	Codigo_Provincia NUMBER(4),
	CONSTRAINT PK_PAQUETE PRIMARY KEY (Codigo),
	CONSTRAINT FK1_PAQUETE FOREIGN KEY (DNI_Camionero) REFERENCES CAMIONERO(DNI),
	CONSTRAINT FK2_PAQUETE FOREIGN KEY (Codigo_Provincia) REFERENCES PROVINCIA(Codigo)
);

CREATE SEQUENCE SEQ_CODIGO_PROVINCIA
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE SEQ_CODIGO_PAQUETE
START WITH 1
INCREMENT BY 1;

CREATE INDEX INX_CAMIONERO
ON CAMIONERO(Nombre);

INSERT INTO CAMIONERO
VALUES ('12345678A','JUAN','123456789',NULL,2000.75,NULL);

INSERT INTO CAMIONERO
VALUES ('12345678B','JUAN2','987654321',NULL,500.01,NULL);

INSERT INTO CAMION
VALUES ('1234AAA',NULL,NULL,300);

INSERT INTO CONDUCE
VALUES ('12345678A','1234AAA',TO_DATE('30/01/25','DD/MM/YY'));

INSERT INTO PROVINCIA
VALUES (SEQ_CODIGO_PROVINCIA.NEXTVAL,'SEVILLA');

INSERT INTO PAQUETE
VALUES (SEQ_CODIGO_PAQUETE.NEXTVAL,NULL,NULL,NULL,'12345678A',SEQ_CODIGO_PROVINCIA.CURRVAL);

UPDATE CAMIONERO
SET Salario=Salario*1.70
WHERE Nombre LIKE 'JUAN';

DELETE FROM CAMIONERO
WHERE Salario<1000;


