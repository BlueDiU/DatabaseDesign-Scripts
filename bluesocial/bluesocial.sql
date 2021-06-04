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
  IdCargo INT NOT NULL,
  IdAlmacen INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL, 
  Apellido VARCHAR(45) NOT NULL,
  Latitud DOUBLE,
  Longitud DOUBLE,
  Telefono VARCHAR(12),
  Foto VARCHAR(100) NOT NULL,
  FechaNac DATE,

  PRIMARY KEY (DUI)
);

ALTER TABLE Empleado ADD FOREIGN KEY (IdCargo)
REFERENCES Cargo(IdCargo);
ALTER TABLE Empleado ADD FOREIGN KEY (IdAlmacen) 
REFERENCES Almacen(IdAlmacen);

/* CATEGORIA_PRODUCTO */
DROP TABLE IF EXISTS CategoriaProducto;
CREATE TABLE CategoriaProducto (
  IdCategoriaProducto INT NOT NULL AUTO_INCREMENT,
  NombreCategoria VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(50) NOT NULL,

  PRIMARY KEY(IdCategoriaProducto)
);

/* MARCA */
DROP TABLE IF EXISTS Marca;
CREATE TABLE Marca (
  IdMarca INT NOT NULL AUTO_INCREMENT,
  NombreMarca VARCHAR(45) NOT NULL,

  PRIMARY KEY(IdMarca)
);

/* SOLICITUD */
DROP TABLE IF EXISTS Solicitud;
CREATE TABLE Solicitud (
  IdSolicitud INT NOT NULL AUTO_INCREMENT,
  Cantidad INT NOT NULL,
  Estado CHAR(1) DEFAULT 'A',

  PRIMARY KEY (IdSolicitud)
);

/* METODO_PAGO */
DROP TABLE IF EXISTS MetodoPago;
CREATE TABLE MetodoPago (
  IdMetPago INT NOT NULL AUTO_INCREMENT,
  TipoPago INT NOT NULL,

  PRIMARY KEY(IdMetPago)
);

/* FACTURA */
DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
  IdFactura INT NOT NULL AUTO_INCREMENT,
  IdMetPago INT NOT NULL,

  FechaPago DATETIME NOT NULL,
  PagoTotal DOUBLE NOT NULL,

  PRIMARY KEY (IdFactura)
);

ALTER TABLE Factura ADD FOREIGN KEY (IdMetPago) 
REFERENCES MetodoPago(IdMetPago);

/* FACTURA_DETALLE */
DROP TABLE IF EXISTS FacturaDetalle;
CREATE TABLE FacturaDetalle (
  IdFacturaDetalle INT NOT NULL AUTO_INCREMENT,
  IdSolicitud INT NOT NULL,
  IdFactura INT NOT NULL,
  
  PRIMARY KEY (IdFacturaDetalle)
);

ALTER TABLE FacturaDetalle ADD FOREIGN KEY (IdSolicitud) 
REFERENCES Solicitud(IdSolicitud);
ALTER TABLE FacturaDetalle ADD FOREIGN KEY (IdFactura) 
REFERENCES Factura(IdFactura);

/* PRODUCTO */
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
  CodigoBarra INT NOT NULL AUTO_INCREMENT,
  IdCategoriaProducto INT NOT NULL,
  IdMarca INT NOT NULL,
  IdSolicitud INT NOT NULL,
  IdCarrito INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL,
  Peso float NOT NULL,
  ValorUnit float NOT NULL,
  FechaVencimiento DATE,

  PRIMARY KEY (CodigoBarra)
);

ALTER TABLE Producto ADD FOREIGN KEY (IdCategoriaProducto)
REFERENCES CategoriaProducto(IdCategoriaProducto);
ALTER TABLE Producto ADD FOREIGN KEY (IdMarca) 
REFERENCES Marca(IdMarca);
ALTER TABLE Producto ADD FOREIGN KEY (IdSolicitud) 
REFERENCES Solicitud(IdSolicitud);

/* Clasificacion_Usuario */
DROP TABLE IF EXISTS ClasificacionUsuario;
CREATE TABLE ClasificacionUsuario (
  IdClasUsuario INT NOT NULL AUTO_INCREMENT,
  NombreClas VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(45) NOT NULL,

  PRIMARY KEY (IdClasUsuario)
);

/* Usuario */
DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario (
  IdUsuario INT NOT NULL AUTO_INCREMENT,
  IdClasUsuario INT NOT NULL,
  CodigoPais INT NOT NULL,
  
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Clave VARCHAR(45) NOT NULL,
  FechaNac DATE,

  PRIMARY KEY(IdUsuario)
);

ALTER TABLE Usuario ADD FOREIGN KEY (IdClasUsuario) 
REFERENCES ClasificacionUsuario(IdClasUsuario);

ALTER TABLE Usuario ADD FOREIGN KEY (CodigoPais) 
REFERENCES Pais(CodigoPais);

/* Domicilio */
DROP TABLE IF EXISTS Domicilio;
CREATE TABLE Domicilio (
  IdDomicilio INT NOT NULL AUTO_INCREMENT,
  IdUsuario INT NOT NULL,

  Latitud DOUBLE NOT NULL,
  Longitud DOUBLE NOT NULL,

  PRIMARY KEY(IdDomicilio)
);

ALTER TABLE Domicilio ADD FOREIGN KEY (IdUsuario) 
REFERENCES Usuario(IdUsuario);

/* Geocerca */
DROP TABLE IF EXISTS Geocerca;
CREATE TABLE Geocerca (
 IdGeocerca INT NOT NULL AUTO_INCREMENT,
 -- aun por ver que va :V
 
 PRIMARY KEY(IdGeocerca)
);

/* DomicilioDetalle*/
DROP TABLE IF EXISTS DomicilioDetalle;
CREATE TABLE DomicilioDetalle (
  IdDomDetalle INT NOT NULL AUTO_INCREMENT,
  IdDomicilio INT NOT NULL,
  IdGeocerca INT NOT NULL,

  PRIMARY KEY (IdDomDetalle)
);

ALTER TABLE DomicilioDetalle ADD FOREIGN KEY (IdDomicilio) 
REFERENCES Domicilio(IdDomicilio);
ALTER TABLE DomicilioDetalle ADD FOREIGN KEY (IdGeocerca) 
REFERENCES Geocerca(IdGeocerca);

/* CARRITO */
DROP TABLE IF EXISTS Carrito;
CREATE TABLE Carrito (
  IdCarrito INT NOT NULL AUTO_INCREMENT,
  CodigoBarra INT NOT NULL,
  IdUsuario INT NOT NULL,

  PRIMARY KEY (IdCarrito)
);

ALTER TABLE Carrito ADD FOREIGN KEY (CodigoBarra) 
REFERENCES Producto(CodigoBarra);

ALTER TABLE Carrito ADD FOREIGN KEY (IdUsuario) 
REFERENCES Usuario(IdUsuario);
