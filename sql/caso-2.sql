DROP DATABASE IF EXISTS cineCV;
CREATE DATABASE cineCV;
USE cineCV;

/* Table - promocion */
drop table if exists promocion;
create table promocion(
    idPromocion int not null unique,
    descripcionPromo varchar(250) not null,
    descuento DOUBLE not null,
    primary key (idPromocion)
);

/* Table - cine */
drop table if exists cine;
create table cine(
    idCine int not null unique,
    nombreCine varchar(60) not null,
    direccion varchar(100) not null,
    telefono varchar(40) not null,
    primary key (idCine)
);

/* Table - funcion */
drop table if exists funcion;
create table funcion(
    idFuncion int not null unique,
    fechaInicio datetime not null,
    fechaFin datetime not null,
    primary key (idFuncion)
);

/* Table - sala */
drop table if exists sala;
create table sala(
    idSala int not null unique,
    nombre varchar(50),
    butacas int,
    salacol varchar(50),
    primary key (idSala)
);

/* Table - paisOrigen */
drop table if exists paisOrigen;
create table paisOrigen (
    idPais int not null unique auto_increment,
    nombre varchar(45) not null,
    primary key (idPais)
);

/* Table - genero */
drop table if exists genero;
create table genero (
    idGenero int not null unique,
    nombre varchar(45) not null,
    primary key (idGenero)
);

/* Table - opinion */
drop table if exists opinion;
create table opinion (
    idOpinion int not null unique,
    nombrePersona varchar(45) not null,
    fechaNacimiento datetime,
    fechaOpinion datetime,
    califacacion varchar(12) not null,
    primary key (idOpinion)
);

/* Table - reparto */
drop table if exists reparto;
create table reparto (
    idReparto int not null unique,
);

/* Table - pelicula */
drop table if exists sala;
create table sala(
    idPelicula int not null unique,
    tituloDistribucion varchar(45) not null,
    tituloOriginal varchar(45) not null,
    idiomaOriginal varchar(20) not null,
    calificacion varchar(3) not null,
    fechaEstreno date not null,
    resumen varchar(100),
    fechaProduccion datetime not null,
    primary key (idPelicula)
);

/* Table - personaje */
drop table if exists personaje;
create table personaje (
    idPersonaje int not null unique,
    nombre varchar(45) not null
);

/* Table - actor */
drop table if exists actor;
create table actor (
    idActor int not null unique,
    nombre varchar(45) not null
    apellido varchar(45) not null
    fechaNacimiento date not null,
);

/* Table - rol */
drop table if exists rol;
create table rol (
    idRol int not null unique,
    nombre varchar(45) not null
);