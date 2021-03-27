/***************************/
/* Rivas Mancia Josue Alexander RM102219 */ 
/***************************/


DROP DATABASE IF EXISTS RM102219_8;
CREATE DATABASE RM102219_8;
USE  RM102219_8;

/* Table - Pais */
DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais (
    IdPais INT NOT NULL,
    Pais VARCHAR(45) NOT NULL,

    CONSTRAINT IdPais PRIMARY KEY (IdPais)
);

/* Table - Nacionalidad */
DROP TABLE IF EXISTS Nacionalidad;
CREATE TABLE Nacionalidad (
    IdNacionalidad INT NOT NULL,
    IdPais INT NOT NULL,

    Nacionalidad VARCHAR(45) NOT NULL,

    CONSTRAINT IdNacionalidad PRIMARY KEY (IdNacionalidad)
);

ALTER TABLE Nacionalidad ADD FOREIGN KEY (IdPais)
REFERENCES Pais(IdPais);

/* Table - Arbitro */
DROP TABLE IF EXISTS Arbitro;
CREATE TABLE Arbitro (
    IdArbitro INT NOT NULL,
    IdNacionalidad INT NOT NULL,

    Nombre VARCHAR(45) NOT NULL,
    FechaNac DATE NOT NULL,

    CONSTRAINT IdArbitro PRIMARY KEY (IdArbitro)
);

ALTER TABLE Arbitro ADD FOREIGN KEY (IdNacionalidad)
REFERENCES Nacionalidad(IdNacionalidad);

/* Table - Fase */
DROP TABLE IF EXISTS Fase;
CREATE TABLE Fase (
    IdFase INT NOT NULL,

    Fase VARCHAR(45) NOT NULL,
    PremioConsolacion FLOAT NOT NULL,

    CONSTRAINT IdFase PRIMARY KEY (IdFase)
);

/* Table - Entrenador */
DROP TABLE IF EXISTS Entrenador;
CREATE TABLE Entrenador (
    IdEntrenador INT NOT NULL,
    IdPais INT NOT NULL,

    Nombre VARCHAR(45) NOT NULL,
    FechaNacimiento DATE NOT NULL,

    CONSTRAINT IdEntrenador PRIMARY KEY (IdEntrenador)
);

ALTER TABLE Entrenador ADD FOREIGN KEY (IdPais)
REFERENCES Pais(IdPais);

/* Table - RolEntrenador */
DROP TABLE IF EXISTS RolEntrenador;
CREATE TABLE RolEntrenador (
    IdRolEntrenador INT NOT NULL,

    Rol VARCHAR(45) NOT NULL,

    CONSTRAINT IdRolEntrenador PRIMARY KEY(IdRolEntrenador)
);

/* Table - EntrenadorRolDetalle */
DROP TABLE IF EXISTS EntrenadorRolDetalle;
CREATE TABLE EntrenadorRolDetalle (
    IdEntrenadorRolDetalle INT NOT NULL AUTO_INCREMENT,
    IdEntrenador INT NOT NULL,
    IdRolEntrenador INT NOT NULL,

    CONSTRAINT IdEntrenadorRolDetalle PRIMARY KEY(IdEntrenadorRolDetalle)
);

ALTER TABLE EntrenadorRolDetalle ADD FOREIGN KEY (IdEntrenador)
REFERENCES Entrenador(IdEntrenador);

ALTER TABLE EntrenadorRolDetalle ADD FOREIGN KEY (IdRolEntrenador)
REFERENCES RolEntrenador(IdRolEntrenador);

/* Table - Jugador */
DROP TABLE IF EXISTS Jugador;
CREATE TABLE Jugador (
    IdJugador INT NOT NULL,

    Nombre VARCHAR(45) NOT NULL,
    DetalleGanancia FLOAT NOT NULL,

    CONSTRAINT IdJugador PRIMARY KEY(IdJugador)
);

/* Table - EntJugDetalle */
DROP TABLE IF EXISTS EntJugDetalle;
CREATE TABLE EntJugDetalle (
    IdEntJugDetalle INT NOT NULL AUTO_INCREMENT,
    IdEntrenadorRolDetalle INT NOT NULL,
    IdJugador INT NOT NULL,

    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL, 
    
    CONSTRAINT IdEntJugDetalle PRIMARY KEY(IdEntJugDetalle)
);

ALTER TABLE EntJugDetalle ADD FOREIGN KEY(IdEntrenadorRolDetalle)
REFERENCES EntrenadorRolDetalle(IdEntrenadorRolDetalle);

ALTER TABLE EntJugDetalle ADD FOREIGN KEY(IdJugador)
REFERENCES Jugador(IdJugador);

/* Table - Partido */
DROP TABLE IF EXISTS Partido;
CREATE TABLE Partido (
    IdPartido INT NOT NULL,

    IdFase INT NOT NULL,

    FechaIni DATETIME NOT NULL,
    FechaFin DATETIME NOT NULL,

    CONSTRAINT IdPartido PRIMARY KEY (IdPartido)
);

ALTER TABLE Partido ADD FOREIGN KEY(IdFase)
REFERENCES Fase(IdFase);

/* Table - DetallePartido */
DROP TABLE IF EXISTS DetallePartido;
CREATE TABLE DetallePartido (
    IdDetallePartido INT NOT NULL AUTO_INCREMENT,
    IdJugador INT NOT NULL,
    IdPartido INT NOT NULL,

    Puntaje INT,
    Resultado VARCHAR(25),

    CONSTRAINT IdDetallePartido PRIMARY KEY (IdDetallePartido)
);


ALTER TABLE DetallePartido ADD FOREIGN KEY(IdJugador)
REFERENCES Jugador(IdJugador);

ALTER TABLE DetallePartido ADD FOREIGN KEY(IdPartido)
REFERENCES Partido(IdPartido);

/* Table - LugarTorneo */
DROP TABLE IF EXISTS LugarTorneo;
CREATE TABLE LugarTorneo (
    IdLugarTorneo INT NOT NULL,
    IdPais INT NOT NULL,

    Pais VARCHAR(45) NOT NULL,

    CONSTRAINT IdLugarTorneo PRIMARY KEY (IdLugarTorneo)
);

ALTER TABLE LugarTorneo ADD FOREIGN KEY (IdPais)
REFERENCES Pais(IdPais);
