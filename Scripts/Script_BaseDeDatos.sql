create database Mercadito;
use Mercadito;

create table Proveedores(
	ID int primary key not null,
	Nombre varchar(50) not null,
	Tipo_proveedor varchar(50) not null
);	

CREATE TABLE Categoria(
	ID int NOT NULL UNIQUE,
	Descripcion varchar(50) PRIMARY KEY NOT null
)

create table Clientes (
	ID int primary key not null,
	PrimerNombre varchar(50) not NULL,
	PrimerApellido varchar(50) NOT NULL
);

create table Empleados (
	ID int primary key not null,
	PrimerNombre varchar(50) not NULL,
	PrimerApellido varchar(50) NOT NULL
);

create table Impuesto_predial (
	Codigo int primary key not null,
	Tipo_impuesto varchar(50) not null,
	Gasto int not null,
	Fecha date not null
);

create table Producto (
	Codigo int primary key not null,
	Nombre varchar(50) not null ,
	Precio_unitario int not null,
	Fecha_caducidad date not NULL,
	Categoria varchar(50) NOT NULL,
	constraint fk_categoriaproducto foreign key (Categoria) references Categoria(Descripcion)
);

create table Pedido_al_proveedor(
	Codigo int primary key not null,
	ID_proveedor int not null,
	ID_producto int not null,
	Cantidad_producto int not null,
	Fecha_realizada date not null,
	Fecha_entrega date not NULL,
	constraint fk_idproveedor foreign key (ID_proveedor) references Proveedores(ID),
	constraint fk_idproducto foreign key (ID_producto) references Producto(Codigo)
)
CREATE TABLE Producto_almacenado(
	ID_producto int NOT NULL,
	Cantidad_almacenada int NOT NULL,
	Cantidad_estante int NOT NULL,
	Fecha_caducidad date NOT NULL,
	constraint fk_idproducto1 foreign key (ID_producto) references Producto(Codigo)
)

CREATE TABLE Ventas(
	Codigo int PRIMARY KEY NOT NULL,
	ID_cliente int NOT NULL,
	Ingreso_total int NOT NULL,
	Fecha date NOT NULL,
	constraint fk_idcliente1 foreign key (ID_cliente) references Clientes(ID)
)

CREATE TABLE Producto_vendido(
	Codigo int PRIMARY KEY NOT NULL,
	ID_venta int NOT NULL,
	ID_producto int NOT NULL,
	Cantidad int NOT NULL,
	constraint fk_idventa foreign key (ID_venta) references Ventas(Codigo),
	constraint fk_idproducto2 foreign key (ID_producto) references Producto(Codigo)
)

CREATE TABLE Cuentas_credito(
	Codigo int PRIMARY KEY NOT NULL,
	ID_cliente int NOT NULL,
	Total_debe int NOT NULL,
	Fecha_emitida int NOT NULL,
	constraint fk_idcliente2 foreign key (ID_cliente) references Clientes(ID)
)

CREATE TABLE Cuentas_pagadas(
	ID_credito int NOT NULL,
	Total_abonado int NOT NULL,
	Fecha_pago int NOT NULL,
	constraint fk_idcredito foreign key (ID_credito) references Cuentas_credito(Codigo)
)

CREATE TABLE Diario_venta(
	Jornada varchar(50) NOT NULL,
	Ingreso int NOT NULL,
	ID_empleado int NOT NULL,
	Fecha date NOT NULL,
	constraint fk_idempleado foreign key (ID_empleado) references Empleados(ID)
)

CREATE TABLE Gasto_casa(
	ID_producto int NOT NULL,
	Cantidad int NOT NULL,
	Fecha date NOT NULL,
	constraint fk_idproducto4 foreign key (ID_producto) references Producto(Codigo)
)
