/* *************************************** */
/* Josue Alexander Rivas Mancia RM102219 */
/* ************************************ */

DROP DATABASE IF EXISTS agenciaViajes;
CREATE DATABASE agenciaViajes;
USE agenciaViajes;

/* Table - Aeronave */
DROP TABLE IF EXISTS Aeronave;
CREATE TABLE Aeronave(
    idAeronave INT NOT NULL UNIQUE,
    modelo varchar(45) NOT NULL,
    cantidad int NOT NULL,
    PRIMARY KEY (idAeronave)
);

/* Table - Aerolinea */
DROP TABLE IF EXISTS Aerolinea;
CREATE TABLE Aerolinea(
    idAerolinea INT NOT NULL UNIQUE,
    nombreAerolinea varchar(250) NOT NULL,
    PRIMARY KEY (idAerolinea)
);

/* Table - Aeropuerto */
DROP TABLE IF EXISTS Aeropuerto;
CREATE TABLE Aeropuerto(
    idAeropuerto INT NOT NULL UNIQUE,
    nombreAeropuerto varchar(250) NOT NULL,
    pais varchar(60) NOT NULL,
    cuidad varchar(60) NOT NULL,
    PRIMARY KEY (idAeropuerto)
);

/* Table - Vuelo */
DROP TABLE IF EXISTS Vuelo;
CREATE TABLE Vuelo(
    numeroVuelo INT NOT NULL UNIQUE,
    disponibilidad INT NOT NULL,
    PRIMARY KEY (numeroVuelo),

    idAeronave int,
    idAeropuerto int,
    idAerolinea int,
    CONSTRAINT FK_idAeronave foreign key (idAeronave) 
    references Aeronave(idAeronave),

    CONSTRAINT FK_idAeropuerto foreign key (idAeropuerto) 
    references Aeropuerto(idAeropuerto),
    
    CONSTRAINT FK_idAerolinea
    foreign key (idAerolinea) 
    references Aerolinea(idAerolinea)
);

/* Table - Itinerario */
DROP TABLE IF EXISTS Itinerario;
CREATE TABLE Itinerario(
    idItinerario INT NOT NULL UNIQUE,
    fechaItinerario DATE,
    hora TIME,
    cantidadEscalas INT,
    PRIMARY KEY (idItinerario)
);

/* Table - Pista */
DROP TABLE IF EXISTS Pista;
CREATE TABLE Pista(
    idPista INT NOT NULL UNIQUE,
    estado BOOLEAN NOT NULL,
    tipo varchar(45) NOT NULL,
    PRIMARY KEY (idPista)
);

/* Table - Pista */
DROP TABLE IF EXISTS Escala;
CREATE TABLE Escala(
    idEscala INT NOT NULL UNIQUE,
    PRIMARY KEY (idEscala)
);
