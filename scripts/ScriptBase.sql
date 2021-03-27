
/*
Modelo Fisico

DDL

DROP
CREATE
ALTER
TRUNCATE != DELETE

USE = 'utilizar la base de datos que se desea'
DML

C = INSERT INTO TABLE "campos" values ('PK No es autoincrenent','','','','','')
R = SELECT * FROM TABLA;
U = UPDATE (alterar FK sin eliminar la llave
D = DELETE


*/
/*
1- delimitar nuestra base de datos
2- Definicion de Tablas
3- Definicion de Llaves Primarias
4- Definicio  de Llaves Foraneas
5- Llenado de Datos
*/
/***************************/
/* Raul Hernandez HP100310 */ 
/***************************/

/*
AUTO INCREMENT
Configuracion para desabilitar la opcion de PK
*/

DROP DATABASE IF EXISTS ProEdu;
CREATE DATABASE ProEdu;
USE  ProEdu;

/* TABLE = AREA*/
DROP TABLE IF EXISTS Area;
CREATE TABLE Area(
IdArea INT NOT NULL auto_increment,
Nombre VARCHAR(45) NOT NULL,
Descripcion VARCHAR(45),
CONSTRAINT pk_idarea Primary key (IdArea) 
);

DROP TABLE IF EXISTS Cargo;
CREATE TABLE Cargo(
IdCargo INT NOT NULL auto_increment,
Nombre VARCHAR(45) NOT NULL,
Activo Bool NOT NULL,
CONSTRAINT pk_idcargo Primary key (IdCargo) 
);

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado(
Cedula INT NOT NULL,
IdArea INT NOT NULL,
IdCargo INT NOT NULL, 
Apellido VARCHAR(45),
FechaNacimiento DATE
);

/********************
ALTER ***************
*********************/

ALTER TABLE Empleado 
ADD PRIMARY KEY (Cedula);

ALTER TABLE Empleado
ADD FOREIGN KEY (IdArea) REFERENCES Area (IdArea);

ALTER TABLE Empleado
ADD FOREIGN KEY (IdCargo) REFERENCES Cargo (IdCargo);


/********************
TRUNCATE ***************
truncate table Cargo;
*********************/


/*
DML
Insert Into Table "Campos" values (0,'texto');
*/

/*
5 Cargos
*/
INSERT INTO Cargo values (NULL,'CFO',TRUE);
INSERT INTO Cargo (Nombre,Activo) values ('CTO',TRUE);
INSERT INTO Cargo values (NULL,'CFO',TRUE);
INSERT INTO Cargo values (NULL,'Gerente',TRUE);
INSERT INTO Cargo values (NULL,'Tecnico',TRUE);

/*
2 Areas
*/
INSERT INTO Area (Nombre, Descripcion) values ('Informatica','el mejor departamento del mundo');
INSERT INTO Area  values (NULL, 'Diseno Grafico','Ubicado en el segundo nivel');

/* 
Empleados, combinando todas las combinaciones Posibles 
*/

INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439991',1,1,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439992',2,1,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439993',3,1,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439994',4,1,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439995',5,1,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439996',1,2,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439997',2,2,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439998',3,2,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439999',4,2,'Hernandez','2012-12-12');
INSERT INTO Empleado (cedula, idcargo, idarea, apellido, FechaNacimiento) values ('048439990',5,2,'Hernandez','2012-12-12');







