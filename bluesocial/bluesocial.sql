/****************************/
/*     BlueSocialMarket     */ 
/****************************/
 
DROP DATABASE IF EXISTS BlueSocial;
CREATE DATABASE BlueSocial;
USE BlueSocial;

/* PAIS */
DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais (
  CodigoPais INT NOT NULL,
  NombrePais VARCHAR(45) NOT NULL,

  PRIMARY KEY (CodigoPais)
);

/* CATEGORIA_COLABORADOR */
DROP TABLE IF EXISTS CategoriaColaborador;
CREATE TABLE CategoriaColaborador (
  IdCategoriaCol INT NOT NULL AUTO_INCREMENT,
  NombreCategoria VARCHAR(45) NOT NULL,

  PRIMARY KEY (IdCategoriaCol)
);

/* COLABORADOR */
DROP TABLE IF EXISTS Colaborador;
CREATE TABLE Colaborador (
  IdColaborador INT NOT NULL AUTO_INCREMENT,
  CodigoPais INT NOT NULL,
  IdCategoriaCol INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL,
  Correo VARCHAR(50) NOT NULL,

  PRIMARY KEY (IdColaborador)
);

ALTER TABLE Colaborador ADD FOREIGN KEY (CodigoPais)
REFERENCES Pais(CodigoPais);

ALTER TABLE Colaborador ADD FOREIGN KEY (IdCategoriaCol)
REFERENCES CategoriaColaborador(IdCategoriaCol);


/* ALMACEN */
DROP TABLE IF EXISTS Almacen;
CREATE TABLE Almacen (
  IdAlmacen INT NOT NULL AUTO_INCREMENT,
  Longitud DOUBLE NOT NULL,
  Latitud DOUBLE NOT NULL,

  PRIMARY KEY(IdAlmacen)
);

/* PROVEEDOR */
DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
  IdProveedor INT NOT NULL AUTO_INCREMENT,
  CodigoPais INT NOT NULL, 
  IdAlmacen INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Web VARCHAR(100) DEFAULT NULL,
  Telefono VARCHAR(12) NOT NULL,
  Latitud DOUBLE NOT NULL,
  Longitud DOUBLE NOT NULL,

  PRIMARY KEY (IdProveedor)
);

ALTER TABLE Proveedor ADD FOREIGN KEY (IdAlmacen)
REFERENCES Almacen(IdAlmacen);

/* CARGO */
DROP TABLE IF EXISTS Cargo;
CREATE TABLE Cargo (
 IdCargo INT NOT NULL AUTO_INCREMENT,

 NombreCargo VARCHAR(45) NOT NULL,
 Estado CHAR DEFAULT 'A',

 PRIMARY KEY (IdCargo)
);

/* EMPLEADO */
DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
  DUI INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL, 
  Apellido VARCHAR(45) NOT NULL,
  Latitud DOUBLE,
  Longitud DOUBLE,
  Telefono VARCHAR(12),
  Foto VARCHAR(100) NOT NULL
  FechaNac DATE,

  PRIMARY KEY(DUI)
);

// TODO: ARREGLAR LA RELACION
/* ALTER TABLE Empleado ADD FOREIGN KEY (IdAlmacen)
REFERENCES Almacen(IdAlmacen); */


/* PRODUCTO */
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
  CodigoBarra INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Peso float NOT NULL,
  ValorUnit float NOT NULL,

  PRIMARY KEY (CodigoBarra)
);

/* DOMICILIO */
DROP TABLE IF EXISTS Domicilio;
CREATE TABLE Domicilio(
  
)