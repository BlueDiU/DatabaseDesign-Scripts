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

/* PRODUCTO */
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
  IdProducto INT NOT NULL AUTO_INCREMENT,
  IdCategoriaProducto INT NOT NULL,
  IdMarca INT NOT NULL,

  Nombre VARCHAR(45) NOT NULL,
  Peso float NOT NULL,
  ValorUnit float NOT NULL,
  FechaVencimiento DATE,

  PRIMARY KEY (IdProducto)
);

ALTER TABLE Producto ADD FOREIGN KEY (IdCategoriaProducto)
REFERENCES CategoriaProducto(IdCategoriaProducto);
ALTER TABLE Producto ADD FOREIGN KEY (IdMarca) 
REFERENCES Marca(IdMarca);

/* SOLICITUD */
DROP TABLE IF EXISTS Solicitud;
CREATE TABLE Solicitud (
  IdSolicitud INT NOT NULL AUTO_INCREMENT,
  IdProducto INT NOT NULL,
  Cantidad INT NOT NULL,
  Estado CHAR(1) DEFAULT 'A',

  PRIMARY KEY (IdSolicitud)
);

ALTER TABLE Solicitud ADD FOREIGN KEY (IdProducto) 
REFERENCES Producto(IdProducto);

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
 Coodernadas VARCHAR(200) DEFAULT NULL,
 
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
  IdProducto INT NOT NULL,
  IdUsuario INT NOT NULL,

  PRIMARY KEY (IdCarrito)
);

ALTER TABLE Carrito ADD FOREIGN KEY (IdProducto) 
REFERENCES Producto(IdProducto);

ALTER TABLE Carrito ADD FOREIGN KEY (IdUsuario) 
REFERENCES Usuario(IdUsuario);

-- Datos ClasificacionUsuario - 5 registros
INSERT INTO ClasificacionUsuario (NombreClas, Descripcion)
VALUES ('Desempleado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO ClasificacionUsuario (NombreClas, Descripcion)
VALUES ('Jubilado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO ClasificacionUsuario (NombreClas, Descripcion)
VALUES ('inmigrante', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO ClasificacionUsuario (NombreClas, Descripcion)
VALUES ('persona sin trabajo estable', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO ClasificacionUsuario (NombreClas, Descripcion)
VALUES ('personas de bajos ingreso', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');

--  Datos CategoriaColaborador - 5 registros
INSERT INTO CategoriaColaborador (NombreCategoria)
VALUES ('empresa');
INSERT INTO CategoriaColaborador (NombreCategoria)
VALUES ('entidad');
INSERT INTO CategoriaColaborador (NombreCategoria)
VALUES ('fundacion');
INSERT INTO CategoriaColaborador (NombreCategoria)
VALUES ('escuela');
INSERT INTO CategoriaColaborador (NombreCategoria)
VALUES ('productores');

-- Datos ClasificacionUsuario - 4 registros
INSERT INTO CategoriaProducto (NombreCategoria, Descripcion)
VALUES ('lácteos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO CategoriaProducto (NombreCategoria, Descripcion)
VALUES ('vegetales', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO CategoriaProducto (NombreCategoria, Descripcion)
VALUES ('bebidas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
INSERT INTO CategoriaProducto (NombreCategoria, Descripcion)
VALUES ('granos basicos', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit');

-- Datos - 7 registros
INSERT INTO Cargo (NombreCargo)
VALUES ('programador');
INSERT INTO Cargo (NombreCargo)
VALUES ('repartidor');
INSERT INTO Cargo (NombreCargo)
VALUES ('cajero');
INSERT INTO Cargo (NombreCargo)
VALUES ('gerente');
INSERT INTO Cargo (NombreCargo)
VALUES ('supervisores');
INSERT INTO Cargo (NombreCargo)
VALUES ('ordenansa');
INSERT INTO Cargo (NombreCargo)
VALUES ('vigilante');

-- Datos - Pais
INSERT INTO Pais (CodigoPais, NombrePais)
VALUES (502, 'Guatemala');
INSERT INTO Pais (CodigoPais, NombrePais)
VALUES (504, 'Honduras');
INSERT INTO Pais (CodigoPais, NombrePais)
VALUES (503, 'El Salvador');
INSERT INTO Pais (CodigoPais, NombrePais)
VALUES (506, 'Costa Rica');
INSERT INTO Pais (CodigoPais, NombrePais)
VALUES (505, 'Nicaragua');

-- Datos - Marca
INSERT INTO Marca VALUES (1, 'BIMBO');
INSERT INTO Marca VALUES (2, 'RITZ');
INSERT INTO Marca VALUES (3, 'NESQUIK');
INSERT INTO Marca VALUES (4, 'ORISOL');
INSERT INTO Marca VALUES (5, 'DEL MONTE');
INSERT INTO Marca VALUES (6, 'DEL VALLE');
INSERT INTO Marca VALUES (7, 'AL-DÍA');
INSERT INTO Marca VALUES (8, 'DAN');
INSERT INTO Marca VALUES (9, 'SKITTLES');
INSERT INTO Marca VALUES (10, 'DEL MONTE');
INSERT INTO Marca VALUES (11, 'MAIZENA');
INSERT INTO Marca VALUES (12, 'GIRASOL');
INSERT INTO Marca VALUES (13, 'PATRONA');
INSERT INTO Marca VALUES (14, 'NUTRIOLI');
INSERT INTO Marca VALUES (15, 'PICNIC');
INSERT INTO Marca VALUES (16, 'MERCAR');
INSERT INTO Marca VALUES (17, 'DON PEDRO');
INSERT INTO Marca VALUES (18, 'MATUTANO');
INSERT INTO Marca VALUES (19, 'ORIENTAL');
INSERT INTO Marca VALUES (20, 'KELLOWS');

-- Datos Colaborador
INSERT INTO Colaborador (CodigoPais, IdCategoriaCol, Nombre, Correo)
VALUES (503, 1, 'Eusoj Vasri', 'eosoj@gmail.com');
INSERT INTO Colaborador (CodigoPais, IdCategoriaCol, Nombre, Correo)
VALUES (504, 2, 'Servi Viajes', 'serviviajes@gmail.com');
INSERT INTO Colaborador (CodigoPais, IdCategoriaCol, Nombre, Correo)
VALUES (502, 4, 'Sonrisas SV', 'risassv@gmail.com');

-- Datos Almacen
INSERT INTO Almacen (Longitud, Latitud) VALUES (290, 345);
INSERT INTO Almacen (Longitud, Latitud) VALUES (290.34, 345);
INSERT INTO Almacen (Longitud, Latitud) VALUES (902.34, 123.45);

-- Datos Proveedor
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 1, "Juan", "Romero", "www.juan.com", 12345678, 234.45, 345.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Manuel", "Menjivar", "www.manuel.com", 52345678, 345.45, 984.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 3, "Jose", "Tobar", "www.jose.com", 12675678, 145.35, 884.47);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 3, "Alexander", "Sanchez", "www.alexander.com", 12337678, 325.95, 910.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 1, "Carlos", "Martinez", "www.carlos.com", 89345678, 245.45, 784.62);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 1, "Jose", "moran", "www.moran.com", 15675678, 385.45, 884.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Maria", "Mendez", "www.maria.com", 18745678, 355.65, 884.87);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 2, "Rosa", "Ramirez", "www.rosa.com", 12345699, 445.45, 994.77);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 1, "Karla", "Menjivar", "www.karla.com", 12345657, 355.45, 944.47);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 3, "Carlos", "Ramirez", "www.carlos.com", 15845678, 445.45, 884.88);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 2, "Rodrigo", "Castro", "www.rodrigo.com", 12395678, 344.65, 914.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 1, "Cesar", "Martinez", "www.cesar.com", 82345678, 348.25, 914.17);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Manuel", "Ramos", "www.manuel2.com", 12344578, 335.45, 784.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Jose", "Castro", "www.castro.com", 22385678, 345.40, 904.37);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 1, "Alejandro", "Herrera", "www.alejandro.com", 89346678, 395.45, 884.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 1, "Alfredo", "Campos", "www.alfredo.com", 12615678, 305.45, 904.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 2, "Gabriela", "Perez", "www.gabriela.com", 12345678, 385.45, 888.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Carlos", "Melendez", "www.melendez.com", 02345678, 315.45, 914.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 2, "Ernesto", "Vasquez", "www.ernesto.com", 92349677, 304.45, 904.60);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 3, "Andres", "Ramirez", "www.andres.com", 52345678, 345.55, 984.57);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 3, "Helen", "Sanchez", "www.helen.com", 72745658, 345.46, 984.37);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 1, "Mauricio", "Lopez", "www.mauricio.com", 12334678, 395.45, 884.17);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 3, "Diego", "Velasquez", "www.diego.com", 12300678, 345.05, 984.07);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Roberto", "Ramirez", "www.roberto.com", 22345678, 345.05, 984.60);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 1, "Karen", "Lopez", "www.karen.com", 12666678, 335.45, 934.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 3, "Marcos", "Flores", "www.marcos.com", 99345678, 395.45, 984.69);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 3, "Humberto", "Ortiz", "www.humberto.com", 11145678, 345.15, 984.17);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 2, "Armando", "Castro", "www.armando.com", 12345008, 340.05, 904.67);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (503, 2, "Edwin", "Salazar", "www.edwin.com", 12345048, 305.45, 904.17);
INSERT INTO Proveedor(CodigoPais, IdAlmacen, Nombre, Apellido, Web, Telefono, Latitud, Longitud)
VALUES (502, 1, "Ariel", "Martinez", "www.ariel.com", 99345678, 349.45, 984.69);

-- Datos Empleado
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (98234473-6, 1, 1, 'Maximiliano', 'Rodríguez', 456, 987.09, 65647893, '1999-07-25');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (97434739-0, 1, 2, 'Claudia', 'Cerón', 0975, 0964, 76363226, '1978-11-19');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (09264537-8, 1, 3, 'Anthony', 'Vasquez', 4935, 8235.09, 76853439, '1982-08-09');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (02744883-6, 3, 1, 'Nicole', 'Vega', 975, 3456, 68986534, '1998-08-08');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (34567897-1, 2, 1, 'Alexander', 'Perez', 356, 83564.964, 76534529, '1985-02-15');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (93645428-4, 2, 1, 'Kevin', 'Hernandez', 7346, 7356.043, 63642429, '1997-07-05');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (58643257-2, 2, 1, 'Daniel', 'Deras', 6354, 987.09, 72444839, '2000-01-02');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (93636745-3, 3, 1, 'Paola', 'Carías', 754, 88348, 63894713, '2000-03-12');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (97837434-7, 4, 1, 'Diana', 'Ponce', 874, 345876, 76543452, '1979-04-03');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (86348862-2, 5, 1, 'Juan', 'Ayala', 975, 7834.934, 67324879, '1980-10-20');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (54728378-0, 6, 1, 'María', 'Martínez', 77665, 7657, 78234632, '1982-12-30');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (62346238-1, 7, 1, 'Luis', 'Flores', 7234.834, 635, 66534842, '1980-05-20');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (74398358-5, 2, 2, 'Pedro', 'Fuentes', 93257.35, 7834.934, 67886377, '1986-11-28');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (07432896-2, 2, 2, 'Joaquin', 'Mejía', 3894.35, 3647, 70374092, '1998-07-27');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (78325865-5, 2, 2, 'Alexander', 'Ortíz', 356, 984.435, 76538745, '1981-02-25');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (82375987-4, 3, 2, 'Lucas', 'Aleman', 4567, 776.043, 67325865, '1992-02-22');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (94877458-2, 4, 2, 'Dolores', 'Araniva', 4938, 8725.09, 73928574, '1995-01-02');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (94884979-3, 5, 2, 'Alejandro', 'Caravantes', 9487, 883, 79497908, '1994-08-12');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (49870238-7, 6, 2, 'Andy', 'Rodríguez', 43827, 345876, 79327834, '1979-10-14');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (74893638-2, 6, 2, 'Danilo', 'Ramos', 9547, 7834.4987, 69285684, '1981-11-13');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (49872857-0, 7, 2, 'Marina', 'Palacios', 3478, 294, 79847598, '1986-03-11');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (37859958-1, 7, 2, 'Romeo', 'Marinero', 983.834, 982, 60948565, '1980-07-20');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (90248888-6, 2, 3, 'Ester', 'Bernabé', 3498, 436, 63474569, '1996-03-08');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (35897054-1, 2, 3, 'Enrique', 'Raymundo', 983275, 536, 76894587, '1985-08-05');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (98357776-4, 3, 3, 'Andres', 'Rosales', 4897, 6546, 78437535, '1997-10-03');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (29387583-2, 4, 3, 'Cesia', 'Viera', 4908, 6454, 60895345, '2000-07-14');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (49872785-3, 5, 3, 'Victor', 'Soto', 43897, 456, 63347890, '2000-10-12');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (38297584-7, 5, 3, 'Jonathan', 'Guardado', 847, 5876, 75891298, '1979-05-23');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (98273435-2, 6, 3, 'Manuel', 'Oviedo', 8974, 859, 67769423, '1980-10-21');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (42666575-0, 6, 3, 'Eduardo', 'Guzman', 9845, 5467, 78403733, '1982-12-31');
INSERT INTO Empleado (DUI, IdCargo, IdAlmacen, Nombre, Apellido, Latitud, Longitud, Telefono, FechaNac) VALUES (02398754-1, 7, 3, 'Cristina', 'Cristales', 098, 65845, 69847397, '1980-01-01');
	
-- Datos Productos
INSERT INTO Producto (IdCategoriaProducto, IdMarca, Nombre, Peso, ValorUnit)
VALUES (1, 2, "Botella", 1, 1.50);
INSERT INTO Producto (IdCategoriaProducto, IdMarca, Nombre, Peso, ValorUnit)
VALUES (2, 2, "Camisa Azul", 1, 4.50);

-- Datos Usuario
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (1, 503, "Juan", "Rosales", "12334xdsf", '1995-2-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (2, 503, "Maria", "Perez", "1hsvdhvh23", '1996-6-13');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (1, 502, "Claudia", "Morazan", "hola123", '1998-7-23');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Jose", "Rivas", "kernellinux123", '1995-4-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (5, 503, "Mario", "Duran", "asjkdbsabd", '2000-6-19');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (5, 503, "Kevin", "Aurobindo", "asjkdbsabd", '2000-7-13');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 502, "Agnija", "Đạt", "hello11234", '2000-2-1');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (1, 503, "Kevin", "Armando", "soyunalien", '2001-11-28');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Sulma", "Ayala", "soyunalien", '1998-5-28');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Fernando", "Herrera", "fer123", '1994-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (4, 506, "Fernanda", "Herrera", "heodnj123", '1997-4-11');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (1, 506, "Alicia", "Martinez", "advavdva", '1998-5-23');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (1, 506, "Alicia", "Martinez", "advavdva", '1998-5-23');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Francisco", "Martinez", "adadad", '1999-7-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (2, 503, "Juana", "Rosales", "lololo123", '1999-2-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (5, 505, "Kelvin", "Marlones", "lalala123", '1999-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (5, 503, "Zorana", "Braelynn", "lalala123", '2001-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Terese", "Duri", "lalala123", '2001-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Felipe", "Marcel", "rororo123", '2000-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Carlo", "Marcel", "rarara123", '2000-6-12');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Carlos", "Folos", "pepepe123", '1998-4-14');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Fabio", "Castillo", "fafafa123", '1997-6-17');
INSERT INTO Usuario (IdClasUsuario, CodigoPais, Nombre, Apellido, Clave, FechaNac)
VALUES (3, 503, "Marta", "Castillo", "mamamamam1234", '1998-6-17');

-- Datos Geocerca
INSERT INTO Geocerca (Coodernadas)
VALUES (
'
  [
    [-67.13734, 45.13745],
    [-66.96466, 44.8097],
    [-68.03252, 44.3252],
    [-69.06, 43.98],
    [-70.11617, 43.68405],
    [-70.64573, 43.09008],
    [-70.75102, 43.08003],
    [-70.79761, 43.21973],
    [-70.98176, 43.36789],
    [-70.94416, 43.46633],
    [-71.08482, 45.30524],
    [-70.66002, 45.46022],
    [-70.30495, 45.91479],
    [-70.00014, 46.69317],
    [-69.23708, 47.44777],
    [-68.90478, 47.18479],
    [-68.2343, 47.35462],
    [-67.79035, 47.06624],
    [-67.79141, 45.70258],
    [-67.13734, 45.13745],
  ]
'
);

-- Datos Domicilio
INSERT INTO Domicilio (Latitud, Longitud, IdUsuario)
VALUES (122.34, -245.67, 1);
-- Datos Domicilio
INSERT INTO Domicilio (Latitud, Longitud, IdUsuario)
VALUES (134.24, -245.67, 2);
-- Datos Domicilio
INSERT INTO Domicilio (Latitud, Longitud, IdUsuario)
VALUES (823.34, -235.67, 3);

-- Datos DomicilioDetalle
INSERT INTO DomicilioDetalle (IdGeocerca, IdDomicilio)
VALUES (1, 1);
INSERT INTO DomicilioDetalle (IdGeocerca, IdDomicilio)
VALUES (1, 2);