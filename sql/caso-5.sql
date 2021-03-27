DROP DATABASE IF EXISTS Caso5;
CREATE DATABASE Caso5;
USE  Caso5;

/* Table - Almacen */
DROP TABLE IF EXISTS Almacen;
CREATE TABLE Almacen (
    IdAlmacen INT NOT NULL AUTO_INCREMENT,
    Direccion VARCHAR(45),
    Telefono INT,
    Ubicacion VARCHAR(60) NOT NULL,
    CONSTRAINT PK_IdAlmacen PRIMARY KEY (IdAlmacen)
);

/* Table - Marca*/
DROP TABLE IF EXISTS Marca;
CREATE TABLE Marca (
    IdMarca INT NOT NULL AUTO_INCREMENT,
    NombreMarca VARCHAR(45) NOT NULL,
    FechaIngreso DATE NOT NULL,
    FechaSalida DATE NOT NULL,
    CONSTRAINT PK_IdMarca PRIMARY KEY (IdMarca)
);

/* Table - Automovil*/
DROP TABLE IF EXISTS Automovil;
CREATE TABLE Automovil (
    IdAutomovil INT NOT NULL,
    IdMarca INT NOT NULL,

    FechaIngreso DATE NOT NULL,
    NombreAutoMovil VARCHAR(45) NOT NULL,
    NombreModelo VARCHAR(45) NOT NULL
);

ALTER TABLE Automovil ADD PRIMARY KEY (IdAutomovil);

ALTER TABLE Automovil ADD FOREIGN KEY (IdMarca)
REFERENCES Marca(IdMarca);

/* Table - Repuesto*/
DROP TABLE IF EXISTS Repuesto;
CREATE TABLE Repuesto (
    IdRepuesto INT NOT NULL AUTO_INCREMENT,
    IdAutomovil INT NOT NULL,

    NombreRepuesto VARCHAR(50),
    CodigoLetra VARCHAR(3),
    CONSTRAINT PK_IdRepuesto PRIMARY KEY (IdRepuesto)
);

ALTER TABLE Repuesto ADD FOREIGN KEY (IdAutomovil)
REFERENCES Automovil(IdAutomovil);

/* Table - AlmacenRepuesto*/
DROP TABLE IF EXISTS AlmacenRepuesto;
CREATE TABLE AlmacenRepuesto (
    IdRepuesto INT NOT NULL,
    IdAlmacen INT NOT NULL,
    IdAlmacenRepuesto INT NOT NULL,

    PrecioRepuesto DECIMAL(3) NOT NULL,
    CANTIDAD INT NOT NULL
);

ALTER TABLE AlmacenRepuesto ADD PRIMARY KEY (IdAlmacenRepuesto);

ALTER TABLE AlmacenRepuesto ADD FOREIGN KEY (IdRepuesto)
REFERENCES Repuesto(IdRepuesto);

ALTER TABLE AlmacenRepuesto ADD FOREIGN KEY (IdAlmacen)
REFERENCES Almacen(IdAlmacen);

DROP TABLE IF EXISTS Contacto;
CREATE TABLE Contacto (
    IdContacto INT NOT NULL AUTO_INCREMENT,

    Nombre VARCHAR(45) NOT NULL,
    FechaNacimiento DATE,
    Email VARCHAR(80) NOT NULL,
    Telefono INT NOT NULL,
    Cargo VARCHAR(45) NOT NULL,
    CONSTRAINT PK_IdContacto PRIMARY KEY (IdContacto)
);

DROP TABLE IF EXISTS Distribuidor;
CREATE TABLE Distribuidor (
    IdDistribuidor INT NOT NULL,
    IdContacto INT NOT NULL,

    Nombre VARCHAR(45) NOT NULL,
    Telefono INT NOT NULL,
    Pais VARCHAR(50),
    FechaInicio DATE NOT NULL,
    CONSTRAINT PK_IdDistribuidor PRIMARY KEY (IdDistribuidor)
);

ALTER TABLE Distribuidor ADD FOREIGN KEY (IdContacto)
REFERENCES Contacto(IdContacto);