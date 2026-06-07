IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'FLUXCOMMERCE')
BEGIN
    CREATE DATABASE FLUXCOMMERCE;
END
GO

CREATE DATABASE FLUXCOMMERCE 
GO

CREATE TABLE Rol(
Id_rol int PRIMARY KEY identity(1,1),
Nombre varchar(50) NOT NULL unique 
)

create table Usuario(
Id_usuario int PRIMARY KEY identity(1,1), 
Dni varchar(10) NOT NULL,
Nombre varchar(100) NOT NULL,
Email varchar(100) NOT NULL unique,
Password_user varchar(255) NOT NULL,
Activo bit default(1),
Id_rol int NOT NULL,
FOREIGN KEY(Id_rol) references Rol(Id_rol) 
)

create table Marca(
Id_marca int PRIMARY KEY identity(1,1),
Nombre varchar(100) NOT NULL, 
Descripcion varchar(300), 
Activo bit default(1)
)

create table Categoria(
Id_categoria int PRIMARY KEY identity(1,1), 
Nombre varchar(100) NOT NULL, 
Descripcion varchar(300), 
Activo bit default(1)
)

create table Ventas(
Id_venta int PRIMARY KEY identity(1,1),
Fecha datetime default GETDATE(),
Id_cliente int NOT NULL,
Id_Usuario int NOT NULL,
Total decimal(10,2) ,
Numero_factura int  identity(1,1)

FOREIGN KEY(Id_Usuario) references Usuario(Id_Usuario) 

/*FOREIGN KEY(Id_cliente) references Usuario(Id_cliente) */


)