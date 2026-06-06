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
activo bit default(1),
Id_rol int NOT NULL,
FOREIGN KEY(Id_rol) references Rol(Id_rol) 
)

create table Marca(
id_marca int PRIMARY KEY identity(1,1),
Nombre varchar(100) NOT NULL, 
Descripcion varchar(300), 
activo bit default(1)
)

create table Categoria(
id_categoria int PRIMARY KEY identity(1,1), 
Nombre varchar(100) NOT NULL, 
Descripcion varchar(300), 
activo bit default(1)
)