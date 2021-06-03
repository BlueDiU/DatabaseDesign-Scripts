
/* PROVEEDOR */
CREATE TABLE Proveedor (
  IdProveedor INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Telefono VARCHAR(12) NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  Web VARCHAR(100) DEFAULT NULL,

  PRIMARY KEY (IdProveedor)
);



/* PRODUCTO */
CREATE TABLE Producto (
  CodigoBarra INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  Peso float NOT NULL,
  ValorUnit float NOT NULL,

  PRIMARY KEY (CodigoBarra),
);



***MARCAPRODUCTO***

CREATE TABLE `marcaproducto` (
  `idMarca` int(11) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarca`)
);




***SOLICITUD***

CREATE TABLE `solicitud` (
  `idSolic` int(11) NOT NULL,
  `idProducto` varchar(45) NOT NULL,
  `idUsuario` varchar(45) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idSolic`)
);



***CATEGORIA***

CREATE TABLE `categoria` (
  `idCateg` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripción` varchar(100) NOT NULL,
  PRIMARY KEY (`idCateg`)
);

