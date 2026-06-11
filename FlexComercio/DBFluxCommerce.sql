IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'FLUXCOMMERCE')
BEGIN
    CREATE DATABASE FLUXCOMMERCE;
END
GO

USE FLUXCOMMERCE;
GO

-- Tabla Rol
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Rol')
BEGIN
    CREATE TABLE Rol(
        Id_rol int PRIMARY KEY IDENTITY(1,1),
        Nombre varchar(50) NOT NULL UNIQUE 
    );
END
GO

-- Tabla Usuario
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Usuario')
BEGIN
    CREATE TABLE Usuario(
        Id_Usuario int PRIMARY KEY IDENTITY(1,1), 
        Dni varchar(10) NOT NULL,
        Nombre varchar(100) NOT NULL,
        Email varchar(100) NOT NULL UNIQUE,
        Password_user varchar(255) NOT NULL,
        Activo bit DEFAULT(1),
        Id_rol int NOT NULL,
        FOREIGN KEY(Id_rol) REFERENCES Rol(Id_rol) 
    );
END
GO

-- Tabla Marca
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Marca')
BEGIN
    CREATE TABLE Marca(
        Id_marca int PRIMARY KEY IDENTITY(1,1),
        Nombre varchar(100) NOT NULL, 
        Descripcion varchar(300), 
        Activo bit DEFAULT(1)
    );
END
GO

-- Tabla Categoria
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categoria')
BEGIN
    CREATE TABLE Categoria(
        Id_categoria int PRIMARY KEY IDENTITY(1,1), 
        Nombre varchar(100) NOT NULL, 
        Descripcion varchar(300), 
        Activo bit DEFAULT(1)
    );
END
GO

-- Secuencia Seq_Factura
IF NOT EXISTS (SELECT * FROM sys.sequences WHERE name = 'Seq_Factura')
BEGIN
    CREATE SEQUENCE Seq_Factura
    START WITH 1      
    INCREMENT BY 1;
END
GO

-- Tabla Venta
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Venta')
BEGIN
    CREATE TABLE Venta(
        Id_venta int PRIMARY KEY IDENTITY(1,1),
        Fecha datetime DEFAULT GETDATE(),
        Id_Cliente int NOT NULL,
        Id_Usuario int NOT NULL,
        Total decimal(10,2),  
        Numero_Factura int DEFAULT NEXT VALUE FOR Seq_Factura UNIQUE
        --FOREIGN KEY(Id_Cliente) REFERENCES Cliente(Id_cliente),
        FOREIGN KEY(Id_Usuario) REFERENCES Usuario(Id_Usuario)
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM Rol WHERE Nombre = 'Admin')
    INSERT INTO Rol (Nombre) VALUES ('Admin');

IF NOT EXISTS (SELECT 1 FROM Rol WHERE Nombre = 'User')
    INSERT INTO Rol (Nombre) VALUES ('User');

  GO

-- Insertar Roles (solo si no existen)
IF NOT EXISTS (SELECT 1 FROM Rol WHERE Nombre = 'Admin')
    INSERT INTO Rol (Nombre) VALUES ('Admin');

IF NOT EXISTS (SELECT 1 FROM Rol WHERE Nombre = 'User')
    INSERT INTO Rol (Nombre) VALUES ('User');
GO

-- Insertar Usuario (solo si no existe)
DECLARE @idRolUser INT = (SELECT Id_rol FROM Rol WHERE Nombre = 'User');
IF NOT EXISTS (SELECT 1 FROM Usuario WHERE Email = 'usuario@ejemplo.com')
BEGIN
    INSERT INTO Usuario (Dni, Nombre, Email, Password_user, Activo, Id_rol)
    VALUES ('12345678A', 'Juan Pérez', 'usuario@ejemplo.com', '123456', 1, @idRolUser);
END
GO

-- Insertar Clientes (solo si no existen por DNI)
IF NOT EXISTS (SELECT 1 FROM Cliente WHERE Dni = '11111111A')
    INSERT INTO Cliente (Nombre, Apellido, Dni, Email, Telefono)
    VALUES ('Carlos', 'García', '11111111A', 'carlos@mail.com', '600111111');

IF NOT EXISTS (SELECT 1 FROM Cliente WHERE Dni = '22222222B')
    INSERT INTO Cliente (Nombre, Apellido, Dni, Email, Telefono)
    VALUES ('Ana', 'López', '22222222B', 'ana@mail.com', '600222222');

IF NOT EXISTS (SELECT 1 FROM Cliente WHERE Dni = '33333333C')
    INSERT INTO Cliente (Nombre, Apellido, Dni, Email, Telefono)
    VALUES ('Luis', 'Martínez', '33333333C', 'luis@mail.com', '600333333');
GO

-- Insertar Ventas
DECLARE @idUsuario INT = (SELECT Id_usuario FROM Usuario WHERE Email = 'usuario@ejemplo.com');
DECLARE @idCliente1 INT = (SELECT Id_cliente FROM Cliente WHERE Dni = '11111111A');
DECLARE @idCliente2 INT = (SELECT Id_cliente FROM Cliente WHERE Dni = '22222222B');
DECLARE @idCliente3 INT = (SELECT Id_cliente FROM Cliente WHERE Dni = '33333333C');

INSERT INTO Venta (Id_Cliente, Id_Usuario, Total) VALUES (@idCliente1, @idUsuario, 150.75);
INSERT INTO Venta (Id_Cliente, Id_Usuario, Total) VALUES (@idCliente2, @idUsuario, 89.99);
INSERT INTO Venta (Id_Cliente, Id_Usuario, Total) VALUES (@idCliente3, @idUsuario, 230.50);
INSERT INTO Venta (Id_Cliente, Id_Usuario, Total) VALUES (@idCliente1, @idUsuario, 45.20);
GO

SELECT * FROM Venta;  
--v1