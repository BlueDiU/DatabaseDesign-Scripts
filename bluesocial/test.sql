***PROVEEDOR***

CREATE TABLE `proveedor` (
  `IdProv` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Dirección` varchar(45) NOT NULL,
  `Sitio Web` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdProv`)
);



***PRODUCTO***

CREATE TABLE `producto` (
  `CodigoBa` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Peso` float NOT NULL,
  `ValorUnit` float NOT NULL,
  PRIMARY KEY (`CodigoBa`)
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

