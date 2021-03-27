/***************************/
/* Rivas Mancia Josue Alexander RM102219 */ 
/***************************/


DROP DATABASE IF EXISTS RM102219;
CREATE DATABASE RM102219;
USE  RM102219;

/* Table - AreaCompra */
DROP TABLE IF EXISTS AreaCompra;
CREATE TABLE AreaCompra (
    RMAreaCompra INT NOT NULL AUTO_INCREMENT,
    NombreArea VARCHAR(45) NOT NULL,

    CONSTRAINT RM_AreaCompra PRIMARY KEY (RMAreaCompra)
);

/* Table - Proveedor */
DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
    RMProveedor INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,

    CONSTRAINT RM_Proveedor PRIMARY KEY (RMProveedor)
);

/* Table - Ubicacion */
DROP TABLE IF EXISTS Ubicacion;
CREATE TABLE Ubicacion (
    RMbicacion INT NOT NULL AUTO_INCREMENT,
    FechaEntrega DATE,
    DireccionBien VARCHAR(45),

    CONSTRAINT RM_Ubicacion PRIMARY KEY (RMbicacion)
);

/* Table - Inventario */
DROP TABLE IF EXISTS Inventario;
CREATE TABLE Inventario (
    RMInventario INT NOT NULL,
    FechaEntrega DATE,
    DireccionBien VARCHAR(45),

    CONSTRAINT RM_Inventario PRIMARY KEY (RMInventario)
);

/* Table - Almacen */
DROP TABLE IF EXISTS Almacen;
CREATE TABLE Almacen (
    RMAlmacen INT NOT NULL,

    CONSTRAINT RM_Almacen PRIMARY KEY (RMAlmacen)
);


/* Table - SalidaAlmacen */
DROP TABLE IF EXISTS SalidaAlmacen;
CREATE TABLE SalidaAlmacen (
    RMSalidaAlmacen INT NOT NULL,
    RMAlmacen INT NOT NULL,

    EmpleadoResponsable VARCHAR(45),
    FechaSalida DATE NOT NULL,
    FechaEntrega DATE NOT NULL,
    NombreBien VARCHAR(45) NOT NULL,
    CantidadEntregada INT NOT NULL,
    
    CONSTRAINT RM_SalidaAlmacen PRIMARY KEY (RMSalidaAlmacen)
);


ALTER TABLE SalidaAlmacen ADD FOREIGN KEY (RMAlmacen)
REFERENCES Almacen(RMAlmacen);


/* Table - OrdenContractual */
DROP TABLE IF EXISTS OrdenContractual;
CREATE TABLE OrdenContractual (
    RMOrdenContractual INT NOT NULL,

    NombreProveedor VARCHAR(45),
    FechaOrden DATE NOT NULL,
    MontoTotalOrden VARCHAR(45),
    FechaEntrega DATE NOT NULL,

    CONSTRAINT RM_OrdenContractual PRIMARY KEY (RMOrdenContractual)
);

/* Table - Cotizacion */
DROP TABLE IF EXISTS Cotizacion;
CREATE TABLE Cotizacion (
    RMCotizacion INT NOT NULL,
    RMOrdenContractual INT NOT NULL,

    Item INT,
    NombreBien VARCHAR(45) NOT NULL,
    CantidadSolicitada INT NOT NULL,
    UnidadMedida VARCHAR(45),
    ValorUnitario VARCHAR(45),

    CONSTRAINT RM_Cotizacion PRIMARY KEY (RMCotizacion)
);

ALTER TABLE Cotizacion ADD FOREIGN KEY (RMOrdenContractual)
REFERENCES OrdenContractual(RMOrdenContractual);

/* Table - Item */
DROP TABLE IF EXISTS Item;
CREATE TABLE Item (
    RMItem INT NOT NULL,
    RMOrdenContractual INT NOT NULL,

    NombreBien VARCHAR(45),
    CantidadSolicitada INT,
    CantidadDespachada INT,
    UnidadMedidaBien VARCHAR(45),
    ValorUnitario VARCHAR(45),
    ValorTotal VARCHAR(45),

    CONSTRAINT RM_Item PRIMARY KEY (RMItem)
);

ALTER TABLE Item ADD FOREIGN KEY (RMOrdenContractual)
REFERENCES OrdenContractual(RMOrdenContractual);

/* Table - Factura */
DROP TABLE IF EXISTS Factura;
CREATE TABLE Factura (
    RMFactura INT NOT NULL,
    RMAlmacen INT NOT NULL,
    RMItem INT NOT NULL, 

    NumEntrada INT NOT NULL,
    Fecha DATE NOT NULL,
    Proveedor VARCHAR(45),
    TotalBienes INT,
    ValorTotal VARCHAR(45),

    CONSTRAINT RM_Factura PRIMARY KEY (RMFactura)
);


ALTER TABLE Factura ADD FOREIGN KEY (RMAlmacen)
REFERENCES Almacen(RMAlmacen);

ALTER TABLE Factura ADD FOREIGN KEY (RMItem)
REFERENCES Item(RMItem);



/* Table - Bien */
DROP TABLE IF EXISTS Bien;
CREATE TABLE Bien (
    RMBien INT NOT NULL AUTO_INCREMENT,
    RMProveedor INT NOT NULL,
    RMInventario INT NOT NULL,

    CONSTRAINT RM_Bien PRIMARY KEY (RMBien)
);

/* Table - BienTieneCotizacion */
DROP TABLE IF EXISTS BienTieneCotizacion;
CREATE TABLE BienTieneCotizacion (
    RMBienTieneCotizacion INT NOT NULL AUTO_INCREMENT,
    RMBien INT NOT NULL,
    RMCotizacion INT NOT NULL,

    CONSTRAINT RM_BienTieneCotizacion PRIMARY KEY (RMBienTieneCotizacion)
);

ALTER TABLE BienTieneCotizacion ADD FOREIGN KEY (RMBien)
REFERENCES Bien(RMBien);

ALTER TABLE BienTieneCotizacion ADD FOREIGN KEY (RMCotizacion)
REFERENCES Cotizacion(RMCotizacion);

ALTER TABLE Bien ADD FOREIGN KEY (RMProveedor)
REFERENCES Proveedor(RMProveedor);

ALTER TABLE Bien ADD FOREIGN KEY (RMInventario)
REFERENCES Inventario(RMInventario);

/* Table - Empleado */
DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    RMEmpleado INT NOT NULL,
    RMAreaCompra INT NOT NULL,
    Nombre VARCHAR(45),
    Cargo VARCHAR(45),

    RMIdAreaCompra INT NOT NULL,
    CONSTRAINT RM_Empleado PRIMARY KEY (RMEmpleado)
);

ALTER TABLE Empleado ADD FOREIGN KEY (RMAreaCompra)
REFERENCES AreaCompra(RMAreaCompra);

/* Table - Solicitud */
DROP TABLE IF EXISTS Solicitud;
CREATE TABLE Solicitud (
    RMSolicitud INT NOT NULL,
    RMProveedor INT NOT NULL,
    RMEmpleado INT NOT NULL,

    NumSolicitud INT,
    Fecha DATE,
    CentroCostos VARCHAR(45),
    RubroPresupuestal VARCHAR(45),


    CONSTRAINT RM_Solicitud PRIMARY KEY (RMSolicitud)
);

ALTER TABLE Solicitud ADD FOREIGN KEY (RMProveedor)
REFERENCES Proveedor(RMProveedor);

ALTER TABLE Solicitud ADD FOREIGN KEY (RMEmpleado)
REFERENCES Empleado(RMEmpleado);

/**************************/
/****** Registros *********/
/**************************/

INSERT INTO AreaCompra values (NULL, "Ventas");
INSERT INTO AreaCompra values (NULL, "Comercio");
INSERT INTO AreaCompra values (NULL, "Agricultura");
