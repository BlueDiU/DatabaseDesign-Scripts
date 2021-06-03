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
);

/* CATEGORIA_COLABORADOR */
DROP TABLE IF EXISTS CategoriaColaborador;
CREATE TABLE CategoriaColaborador (
  IdCategoriaCol INT NOT NULL AUTO_INCREMENT,
  NombreCategoria VARCHAR(45) NOT NULL,
);

/* COLABORADOR */
DROP TABLE IF EXISTS Colaborador;
CREATE TABLE Colaborador (
  IdColaborador INT NOT NULL AUTO_INCREMENT,
  CodigoPais INT NOT NULL,
  IdCategoriaCol INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL,
  Correo VARCHAR(50) NOT NULL,
);

ALTER TABLE Colaborador ADD FOREIGN KEY (CodigoPais)
REFERENCES Pais(CodigoPais);

ALTER TABLE Colaborador ADD FOREIGN KEY (IdCategoriaCol)
REFERENCES CategoriaColaborador(IdCategoriaCol);

/* PROVEEDOR */
DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
  IdProveedor INT NOT NULL AUTO_INCREMENT,
  CodigoPais INT NOT NULL, 

  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Web VARCHAR(100) DEFAULT NULL,
  Telefono VARCHAR(12) NOT NULL,
  Latitud DOUBLE NOT NULL,
  Longitud DOUBLE NOT NULL,

  PRIMARY KEY (IdProveedor),
);

/* PRODUCTO */
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
  CodigoBarra INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Peso float NOT NULL,
  ValorUnit float NOT NULL,

  PRIMARY KEY (CodigoBarra)
);