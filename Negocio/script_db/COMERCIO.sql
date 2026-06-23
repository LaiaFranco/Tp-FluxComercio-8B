-- ============================================================
-- 1. CREACIÓN DE BASE DE DATOS
-- ============================================================
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'COMERCIO_DB')
BEGIN
    CREATE DATABASE COMERCIO_DB;
END
GO

USE COMERCIO_DB;
GO

-- ============================================================
-- 2. CREACIÓN DE TABLAS (con las modificaciones solicitadas)
-- ============================================================

-- MARCAS
CREATE TABLE [dbo].[MARCAS](
    [id_marca] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_MARCAS_activo] DEFAULT (1),
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED ([id_marca] ASC)
)
GO

-- CATEGORIAS
CREATE TABLE [dbo].[CATEGORIAS](
    [id_categoria] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_CATEGORIAS_activo] DEFAULT (1),
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED ([id_categoria] ASC)
)
GO

-- ROLES
CREATE TABLE [dbo].[ROLES](
    [id_rol] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED ([id_rol] ASC),
 CONSTRAINT [UQ_ROLES_nombre] UNIQUE ([nombre])
)
GO

-- USUARIOS
CREATE TABLE [dbo].[USUARIOS](
    [id_usuario] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [email] [varchar](255) NOT NULL,
    [password_u] [varchar](255) NOT NULL,
    [id_rol] [int] NOT NULL,
    [activo] [bit] NULL CONSTRAINT [DF_USUARIOS_activo] DEFAULT (1),
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED ([id_usuario] ASC),
 CONSTRAINT [UQ_USUARIOS_email] UNIQUE ([email])
)
GO

-- PROVEEDORES
CREATE TABLE [dbo].[PROVEEDORES](
    [id_proveedor] [int] IDENTITY(1,1) NOT NULL,
    [cuil] [varchar](20) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [email] [varchar](255) NULL,
    [telefono] [varchar](255) NULL,
    [direccion] [varchar](255) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_PROVEEDORES_activo] DEFAULT (1),
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED ([id_proveedor] ASC),
 CONSTRAINT [UQ_PROVEEDORES_cuil] UNIQUE ([cuil])
)
GO

-- PRODUCTOS (se agrega id_proveedor y se cambia precisión de precio)
CREATE TABLE [dbo].[PRODUCTOS](
    [id_producto] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [id_marca] [int] NOT NULL,
    [id_categoria] [int] NOT NULL,
    [id_proveedor] [int] NOT NULL,                          -- NUEVA COLUMNA
    [stock_actual] [int] NOT NULL CONSTRAINT [DF_PRODUCTOS_stock_actual] DEFAULT (0),
    [stock_minimo] [int] NOT NULL CONSTRAINT [DF_PRODUCTOS_stock_minimo] DEFAULT (0),
    [precio] [decimal](10,2) NOT NULL,                      -- PRECISIÓN CAMBIADA
    [porcentaje_ganancia] [decimal](5,2) NOT NULL,
    [activo] [bit] NULL CONSTRAINT [DF_PRODUCTOS_activo] DEFAULT (1),
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED ([id_producto] ASC)
)
GO

-- PRODUCTO_PROVEEDOR
CREATE TABLE [dbo].[PRODUCTO_PROVEEDOR](
    [id_producto] [int] NOT NULL,
    [id_proveedor] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTO_PROVEEDOR] PRIMARY KEY CLUSTERED ([id_producto] ASC, [id_proveedor] ASC)
)
GO

-- COMPRAS
CREATE TABLE [dbo].[COMPRAS](
    [id_compra] [int] IDENTITY(1,1) NOT NULL,
    [fecha] [datetime] NOT NULL CONSTRAINT [DF_COMPRAS_fecha] DEFAULT (GETDATE()),
    [id_proveedor] [int] NOT NULL,
    [id_usuario] [int] NOT NULL,
    [total] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_COMPRAS] PRIMARY KEY CLUSTERED ([id_compra] ASC)
)
GO

-- COMPRA_DETALLES
CREATE TABLE [dbo].[COMPRA_DETALLES](
    [id_detalle] [int] IDENTITY(1,1) NOT NULL,
    [id_compra] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
    [cantidad] [int] NOT NULL,
    [precio_unitario] [decimal](10,2) NOT NULL,
    [subtotal] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_COMPRA_DETALLES] PRIMARY KEY CLUSTERED ([id_detalle] ASC)
)
GO

-- CLIENTES
CREATE TABLE [dbo].[CLIENTES](
    [id_cliente] [int] IDENTITY(1,1) NOT NULL,
    [dni] [varchar](20) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [apellido] [varchar](255) NULL,
    [email] [varchar](255) NULL,
    [telefono] [varchar](255) NULL,
    [direccion] [varchar](255) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_CLIENTES_activo] DEFAULT (1),
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED ([id_cliente] ASC),
 CONSTRAINT [UQ_CLIENTES_dni] UNIQUE ([dni])
)
GO

-- VENTAS
CREATE TABLE [dbo].[VENTAS](
    [id_venta] [int] IDENTITY(1,1) NOT NULL,
    [fecha] [datetime] NOT NULL CONSTRAINT [DF_VENTAS_fecha] DEFAULT (GETDATE()),
    [id_cliente] [int] NOT NULL,
    [id_usuario] [int] NOT NULL,
    [total] [decimal](10,2) NOT NULL,
    [numero_factura] [varchar](255) NOT NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED ([id_venta] ASC),
 CONSTRAINT [UQ_VENTAS_numero_factura] UNIQUE ([numero_factura])
)
GO

-- VENTA_DETALLES
CREATE TABLE [dbo].[VENTA_DETALLES](
    [id_detalle] [int] IDENTITY(1,1) NOT NULL,
    [id_venta] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
    [cantidad] [int] NOT NULL,
    [precio_unitario] [decimal](10,2) NOT NULL,
    [subtotal] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_VENTA_DETALLES] PRIMARY KEY CLUSTERED ([id_detalle] ASC)
)
GO

-- IMAGENES
CREATE TABLE [dbo].[IMAGENES] (
    id_imagen INT IDENTITY(1,1) NOT NULL,
    url VARCHAR(500) NOT NULL,
    activo BIT DEFAULT 1,
    tipo_entidad VARCHAR(20) NOT NULL,
    id_entidad INT NOT NULL,
    CONSTRAINT PK_imagenes PRIMARY KEY (id_imagen)
)
GO

-- ============================================================
-- 3. CLAVES FORÁNEAS
-- ============================================================

ALTER TABLE [dbo].[USUARIOS] WITH CHECK ADD CONSTRAINT [FK_USUARIOS_ROLES] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO

ALTER TABLE [dbo].[PRODUCTOS] WITH CHECK ADD CONSTRAINT [FK_PRODUCTOS_MARCAS] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCAS] ([id_marca])
GO

ALTER TABLE [dbo].[PRODUCTOS] WITH CHECK ADD CONSTRAINT [FK_PRODUCTOS_CATEGORIAS] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[CATEGORIAS] ([id_categoria])
GO

ALTER TABLE [dbo].[PRODUCTOS] WITH CHECK ADD CONSTRAINT [FK_PRODUCTOS_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO

ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR] WITH CHECK ADD CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO

ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR] WITH CHECK ADD CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO

ALTER TABLE [dbo].[COMPRAS] WITH CHECK ADD CONSTRAINT [FK_COMPRAS_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO

ALTER TABLE [dbo].[COMPRAS] WITH CHECK ADD CONSTRAINT [FK_COMPRAS_USUARIOS] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO

ALTER TABLE [dbo].[COMPRA_DETALLES] WITH CHECK ADD CONSTRAINT [FK_COMPRA_DETALLES_COMPRAS] FOREIGN KEY([id_compra])
REFERENCES [dbo].[COMPRAS] ([id_compra])
GO

ALTER TABLE [dbo].[COMPRA_DETALLES] WITH CHECK ADD CONSTRAINT [FK_COMPRA_DETALLES_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO

ALTER TABLE [dbo].[VENTAS] WITH CHECK ADD CONSTRAINT [FK_VENTAS_CLIENTES] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO

ALTER TABLE [dbo].[VENTAS] WITH CHECK ADD CONSTRAINT [FK_VENTAS_USUARIOS] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO

ALTER TABLE [dbo].[VENTA_DETALLES] WITH CHECK ADD CONSTRAINT [FK_VENTA_DETALLES_VENTAS] FOREIGN KEY([id_venta])
REFERENCES [dbo].[VENTAS] ([id_venta])
GO

ALTER TABLE [dbo].[VENTA_DETALLES] WITH CHECK ADD CONSTRAINT [FK_VENTA_DETALLES_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO

-- ============================================================
-- 4. DATOS INICIALES (maestros y 10 productos nuevos)
-- ============================================================

USE COMERCIO_DB
GO

-- Roles
INSERT INTO ROLES (nombre) VALUES ('Administrador');
INSERT INTO ROLES (nombre) VALUES ('Vendedor');
GO

-- Usuarios
DECLARE @idRolAdmin INT = (SELECT id_rol FROM ROLES WHERE nombre = 'Administrador');
DECLARE @idRolVendedor INT = (SELECT id_rol FROM ROLES WHERE nombre = 'Vendedor');

INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo)
VALUES ('Admin Sistema', 'admin@comercio.com', '123456', @idRolAdmin, 1);

INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo)
VALUES ('Juan Vendedor', 'juan@comercio.com', '123456', @idRolVendedor, 1);
GO

-- Marcas
INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES ('Samsung', 'Marca de tecnologia y electronica', 1);

INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES ('Apple', 'Marca de celulares, notebooks y accesorios', 1);

INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES ('Logitech', 'Marca de accesorios para computacion', 1);
GO

-- Categorías
INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES ('Celulares', 'Telefonos moviles y smartphones', 1);

INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES ('Notebooks', 'Computadoras portatiles', 1);

INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES ('Accesorios', 'Perifericos y accesorios tecnologicos', 1);
GO

-- Proveedores
INSERT INTO PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
VALUES ('20-12345678-9', 'Tecnologia Mayorista SA', 'ventas@tecno-mayorista.com', '1122334455', 'Av. Siempre Viva 123', 1);

INSERT INTO PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
VALUES ('27-87654321-4', 'Insumos Digitales SRL', 'contacto@insumosdigitales.com', '1166778899', 'San Martin 456', 1);
GO

-- 10 productos nuevos (reemplaza los anteriores)
DECLARE @idProducto int;
DECLARE @idProveedor int;

-- Producto 1
SET @idProveedor = 1;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Mouse Logitech M90', 'Mouse optico USB para uso diario', 1, 1, @idProveedor, 25, 5, 8.50, 30.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 2
SET @idProveedor = 2;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Teclado Redragon Kumara', 'Teclado mecanico compacto con cable USB', 1, 1, @idProveedor, 15, 3, 45.99, 35.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 3
SET @idProveedor = 1;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Auriculares HyperX Cloud Stinger', 'Auriculares gamer con microfono', 1, 1, @idProveedor, 12, 4, 59.90, 32.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 4
SET @idProveedor = 2;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Monitor Samsung 24 pulgadas', 'Monitor LED Full HD 24 pulgadas', 1, 1, @idProveedor, 8, 2, 189.99, 28.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 5
SET @idProveedor = 1;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Disco SSD Kingston 480GB', 'Unidad de estado solido SATA 480GB', 1, 1, @idProveedor, 20, 5, 42.75, 30.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 6
SET @idProveedor = 2;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Memoria RAM Kingston 8GB DDR4', 'Modulo de memoria RAM DDR4 8GB 2666MHz', 1, 1, @idProveedor, 30, 6, 24.99, 40.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 7
SET @idProveedor = 1;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Webcam Logitech C270', 'Camara web HD 720p con microfono integrado', 1, 1, @idProveedor, 10, 2, 29.50, 35.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 8
SET @idProveedor = 2;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Router TP-Link Archer C6', 'Router WiFi doble banda AC1200', 1, 1, @idProveedor, 14, 3, 54.25, 30.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 9
SET @idProveedor = 1;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Parlantes Genius SP-HF180', 'Parlantes estereo USB compactos', 1, 1, @idProveedor, 18, 4, 16.80, 38.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);

-- Producto 10
SET @idProveedor = 2;
INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Notebook Lenovo IdeaPad 3', 'Notebook 15 pulgadas con procesador Ryzen y SSD', 1, 1, @idProveedor, 5, 1, 899.99, 25.00, 1);
SET @idProducto = SCOPE_IDENTITY();
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES (@idProducto, @idProveedor);
GO

-- Clientes
INSERT INTO CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
VALUES ('40111222', 'Lucia', 'Perez', 'lucia.perez@gmail.com', '1133445566', 'Belgrano 1200', 1);

INSERT INTO CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
VALUES ('35999888', 'Martin', 'Gomez', 'martin.gomez@gmail.com', '1177889900', 'Rivadavia 2400', 1);
GO

-- Imágenes (para algunos productos)
INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad)
VALUES ('https://example.com/img/mouse-logitech-m90.jpg', 1, 'PRODUCTO', 1);

INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad)
VALUES ('https://example.com/img/teclado-redragon-kumara.jpg', 1, 'PRODUCTO', 2);
GO

-- (Opcional: se pueden agregar compras y ventas de ejemplo, pero se omiten para mantener coherencia)

-- ============================================================
-- 5. PROCEDIMIENTOS ALMACENADOS
-- ============================================================

USE COMERCIO_DB;
GO

-- ========== MARCAS ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarMarcas]
AS
SELECT id_marca, nombre, descripcion, activo
FROM MARCAS;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaMarca]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarMarca]
    @id_marca INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
UPDATE MARCAS 
SET nombre = @nombre, descripcion = @descripcion, activo = @activo
WHERE id_marca = @id_marca;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedCambiarEstadoMarca]
    @id_marca INT,
    @activo BIT
AS
UPDATE MARCAS
SET activo = @activo
WHERE id_marca = @id_marca;
GO

-- ========== CATEGORIAS ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarCategorias]
AS
SELECT id_categoria, nombre, descripcion, activo
FROM CATEGORIAS;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaCategoria]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarCategoria]
    @id_categoria INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
UPDATE CATEGORIAS 
SET nombre = @nombre, descripcion = @descripcion, activo = @activo
WHERE id_categoria = @id_categoria;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedCambiarEstadoCategoria]
    @id_categoria INT,
    @activo BIT
AS
UPDATE CATEGORIAS
SET activo = @activo
WHERE id_categoria = @id_categoria;
GO

-- ========== ROLES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarRoles]
AS
SELECT id_rol, nombre
FROM ROLES;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaRol]
    @nombre VARCHAR(255)
AS
INSERT INTO ROLES (nombre)
VALUES (@nombre);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarRol]
    @id_rol INT,
    @nombre VARCHAR(255)
AS
UPDATE ROLES 
SET nombre = @nombre
WHERE id_rol = @id_rol;
GO

-- ========== USUARIOS ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarUsuarios]
AS
SELECT 
    u.id_usuario, 
    u.nombre, 
    u.email, 
    u.password_u, 
    u.id_rol, 
    r.nombre AS nombre_rol,  
    u.activo
FROM USUARIOS u
INNER JOIN ROLES r ON u.id_rol = r.id_rol
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaUsuario]
    @nombre VARCHAR(255),
    @email VARCHAR(255),
    @password_u VARCHAR(255),
    @id_rol INT,
    @activo BIT
AS
INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo)
VALUES (@nombre, @email, @password_u, @id_rol, @activo);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarUsuario]
    @id_usuario INT,
    @nombre VARCHAR(255),
    @email VARCHAR(255),
    @password_u VARCHAR(255),
    @id_rol INT,
    @activo BIT
AS
UPDATE USUARIOS 
SET nombre = @nombre, email = @email, password_u = @password_u, id_rol = @id_rol, activo = @activo
WHERE id_usuario = @id_usuario;
GO

-- ========== PRODUCTOS (con el nuevo storedAltaProducto) ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarProductos]
AS
BEGIN
    SELECT
        P.id_producto,
        P.nombre,
        P.descripcion,
        P.stock_actual,
        P.stock_minimo,
        P.precio,
        P.porcentaje_ganancia,
        P.activo,
        M.id_marca,
        M.nombre AS nombre_marca,
        C.id_categoria,
        C.nombre AS nombre_categoria,
        PR.id_proveedor,
        PR.nombre AS nombre_proveedor,
        PR.cuil,
        I.id_imagen,
        I.url AS url_imagen
    FROM PRODUCTOS P
        INNER JOIN MARCAS M ON P.id_marca = M.id_marca
        INNER JOIN CATEGORIAS C ON P.id_categoria = C.id_categoria
        INNER JOIN PROVEEDORES PR ON P.id_proveedor = PR.id_proveedor
        LEFT JOIN IMAGENES I ON I.id_entidad = P.id_producto
           AND I.tipo_entidad = 'PRODUCTO'
           AND I.activo = 1;
END
GO

-- NUEVO storedAltaProducto (con id_proveedor y url_imagen)
CREATE OR ALTER PROCEDURE [dbo].[storedAltaProducto]
    @nombre varchar(255),
    @descripcion varchar(300),
    @id_marca int,
    @id_categoria int,
    @id_proveedor int,
    @precio decimal(10,2),
    @stock_actual int,
    @stock_minimo int,
    @porcentaje_ganancia decimal(5,2),
    @url_imagen varchar(500)
AS
BEGIN
    DECLARE @id_producto int

    INSERT INTO PRODUCTOS
    (
        nombre,
        descripcion,
        id_marca,
        id_categoria,
        id_proveedor,
        stock_actual,
        stock_minimo,
        precio,
        porcentaje_ganancia,
        activo
    )
    VALUES
    (
        @nombre,
        @descripcion,
        @id_marca,
        @id_categoria,
        @id_proveedor,
        @stock_actual,
        @stock_minimo,
        @precio,
        @porcentaje_ganancia,
        1
    )

    SET @id_producto = SCOPE_IDENTITY()

    INSERT INTO PRODUCTO_PROVEEDOR
    (
        id_producto,
        id_proveedor
    )
    VALUES
    (
        @id_producto,
        @id_proveedor
    )

    INSERT INTO IMAGENES
    (
        url,
        activo,
        tipo_entidad,
        id_entidad
    )
    VALUES
    (
        @url_imagen,
        1,
        'PRODUCTO',
        @id_producto
    )

    SELECT @id_producto AS id_producto
END
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarProducto]
    @id_producto INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @id_marca INT,
    @id_categoria INT,
    @stock_actual INT,
    @stock_minimo INT,
    @precio DECIMAL(5,2),
    @porcentaje_ganancia DECIMAL(5,2),
    @activo BIT
AS
UPDATE PRODUCTOS 
SET nombre = @nombre, descripcion = @descripcion, id_marca = @id_marca, id_categoria = @id_categoria,
    stock_actual = @stock_actual, stock_minimo = @stock_minimo, precio = @precio, 
    porcentaje_ganancia = @porcentaje_ganancia, activo = @activo
WHERE id_producto = @id_producto;
GO

-- ========== PROVEEDORES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarProveedores]
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE activo = 1;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedListarProveedorPorId]
    @id_proveedor INT
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE id_proveedor = @id_proveedor;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaProveedor]
    @cuil VARCHAR(20),
    @nombre VARCHAR(255),
    @email VARCHAR(255),
    @telefono VARCHAR(255),
    @direccion VARCHAR(255),
    @activo BIT
AS
INSERT INTO PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
VALUES (@cuil, @nombre, @email, @telefono, @direccion, @activo);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarProveedor]
    @id_proveedor INT,
    @cuil VARCHAR(20),
    @nombre VARCHAR(255),
    @email VARCHAR(255),
    @telefono VARCHAR(255),
    @direccion VARCHAR(255),
    @activo BIT
AS
UPDATE PROVEEDORES 
SET cuil = @cuil, nombre = @nombre, email = @email, telefono = @telefono, 
    direccion = @direccion, activo = @activo
WHERE id_proveedor = @id_proveedor;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedEliminarProveedor]
    @id_proveedor INT
AS
UPDATE PROVEEDORES
SET activo = 0
WHERE id_proveedor = @id_proveedor;
GO

-- ========== PRODUCTO_PROVEEDOR ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarProductoProveedor]
AS
SELECT id_producto, id_proveedor
FROM PRODUCTO_PROVEEDOR;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaProductoProveedor]
    @id_producto INT,
    @id_proveedor INT
AS
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@id_producto, @id_proveedor);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarProductoProveedor]
    @id_producto_anterior INT,
    @id_proveedor_anterior INT,
    @id_producto INT,
    @id_proveedor INT
AS
UPDATE PRODUCTO_PROVEEDOR 
SET id_producto = @id_producto, id_proveedor = @id_proveedor
WHERE id_producto = @id_producto_anterior AND id_proveedor = @id_proveedor_anterior;
GO

-- ========== COMPRAS ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarCompras]
AS
SELECT 
    C.id_compra,
    C.fecha,
    C.total,
    P.id_proveedor,
    P.cuil,
    P.nombre AS nombre_proveedor,
    U.id_usuario,
    U.nombre AS nombre_usuario,
    R.id_rol,
    R.nombre AS nombre_rol
FROM COMPRAS C
INNER JOIN PROVEEDORES P ON P.id_proveedor = C.id_proveedor
INNER JOIN USUARIOS U ON U.id_usuario = C.id_usuario
INNER JOIN ROLES R ON R.id_rol = U.id_rol;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaCompra]
    @id_proveedor INT,
    @id_usuario INT,
    @total DECIMAL(10,2)
AS
INSERT INTO COMPRAS (id_proveedor, id_usuario, total)
VALUES (@id_proveedor, @id_usuario, @total);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarCompra]
    @id_compra INT,
    @fecha DATETIME,
    @id_proveedor INT,
    @id_usuario INT,
    @total DECIMAL(10,2)
AS
UPDATE COMPRAS 
SET fecha = @fecha, id_proveedor = @id_proveedor, id_usuario = @id_usuario, total = @total
WHERE id_compra = @id_compra;
GO

-- ========== COMPRA_DETALLES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarCompraDetalles]
AS
SELECT id_detalle, id_compra, id_producto, cantidad, precio_unitario, subtotal
FROM COMPRA_DETALLES;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaCompraDetalle]
    @id_compra INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2),
    @subtotal DECIMAL(10,2)
AS
INSERT INTO COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
VALUES (@id_compra, @id_producto, @cantidad, @precio_unitario, @subtotal);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarCompraDetalle]
    @id_detalle INT,
    @id_compra INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2),
    @subtotal DECIMAL(10,2)
AS
UPDATE COMPRA_DETALLES 
SET id_compra = @id_compra, id_producto = @id_producto, cantidad = @cantidad,
    precio_unitario = @precio_unitario, subtotal = @subtotal
WHERE id_detalle = @id_detalle;
GO

-- ========== CLIENTES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarClientes]
AS
SELECT id_cliente, dni, nombre, apellido, email, telefono, direccion, activo
FROM CLIENTES;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaCliente]
    @dni VARCHAR(20),
    @nombre VARCHAR(255),
    @apellido VARCHAR(255),
    @email VARCHAR(255),
    @telefono VARCHAR(255),
    @direccion VARCHAR(255),
    @activo BIT
AS
INSERT INTO CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
VALUES (@dni, @nombre, @apellido, @email, @telefono, @direccion, @activo);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarCliente]
    @id_cliente INT,
    @nombre VARCHAR(255),
    @apellido VARCHAR(255),
    @email VARCHAR(255),
    @telefono VARCHAR(255),
    @direccion VARCHAR(255)
AS
UPDATE CLIENTES 
SET nombre = @nombre, apellido = @apellido, email = @email,
    telefono = @telefono, direccion = @direccion
WHERE id_cliente = @id_cliente;
GO

-- ========== VENTAS (reemplazado por los nuevos procedimientos) ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarVentas]
AS
BEGIN
    SELECT 
        v.id_venta,
        v.fecha,
        v.id_cliente,
        c.nombre AS nombre_cliente,
        c.apellido AS apellido_cliente,
        v.total,
        v.numero_factura
    FROM VENTAS v
    INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
    ORDER BY v.id_venta DESC;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaVentaConUnDetalle]
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT,
    @DetallesJSON NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @Detalles TABLE (
            id_producto INT,
            cantidad INT,
            precio_unitario DECIMAL(18,2)
        );

        INSERT INTO @Detalles (id_producto, cantidad, precio_unitario)
        SELECT ProductoId, Cantidad, PrecioUnitario
        FROM OPENJSON(@DetallesJSON)
        WITH (
            ProductoId INT '$.ProductoId',
            Cantidad INT '$.Cantidad',
            PrecioUnitario DECIMAL(18,2) '$.PrecioUnitario'
        );

        IF EXISTS (
            SELECT 1
            FROM @Detalles d
            INNER JOIN PRODUCTOS p ON d.id_producto = p.id_producto
            WHERE p.stock_actual < d.cantidad
        )
        BEGIN
            RAISERROR('Stock insuficiente para uno o más productos.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        DECLARE @Total DECIMAL(18,2);
        SELECT @Total = SUM(cantidad * precio_unitario) FROM @Detalles;

        DECLARE @YY CHAR(2) = RIGHT(YEAR(@fecha), 2);
        DECLARE @MM CHAR(2) = RIGHT('0' + CAST(MONTH(@fecha) AS VARCHAR), 2);
        DECLARE @UltimoNumero INT;

        SELECT @UltimoNumero = MAX(CAST(RIGHT(numero_factura, 4) AS INT))
        FROM VENTAS
        WHERE numero_factura LIKE 'A-' + @YY + '-' + @MM + '-%';

        IF @UltimoNumero IS NULL SET @UltimoNumero = 0;

        DECLARE @NuevoNumero INT = @UltimoNumero + 1;
        DECLARE @NumeroFactura NVARCHAR(50) = 'A-' + @YY + '-' + @MM + '-' + RIGHT('0000' + CAST(@NuevoNumero AS VARCHAR), 4);

        INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura)
        VALUES (@fecha, @id_cliente, @id_usuario, @Total, @NumeroFactura);

        DECLARE @VentaId INT = SCOPE_IDENTITY();

        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        SELECT @VentaId, id_producto, cantidad, precio_unitario, cantidad * precio_unitario
        FROM @Detalles;

        UPDATE p
        SET stock_actual = p.stock_actual - d.cantidad
        FROM PRODUCTOS p
        INNER JOIN @Detalles d ON p.id_producto = d.id_producto;

        COMMIT TRANSACTION;

        SELECT @VentaId AS Id, @NumeroFactura AS NumeroFactura;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarVentaConUnDetalle]
    @id_venta INT,
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT,
    @DetallesJSON NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @OldDetails TABLE (
            id_producto INT,
            cantidad INT
        );

        INSERT INTO @OldDetails (id_producto, cantidad)
        SELECT id_producto, cantidad
        FROM VENTA_DETALLES
        WHERE id_venta = @id_venta;

        UPDATE p
        SET stock_actual = p.stock_actual + od.cantidad
        FROM PRODUCTOS p
        INNER JOIN @OldDetails od ON p.id_producto = od.id_producto;

        DECLARE @NewDetails TABLE (
            id_producto INT,
            cantidad INT,
            precio_unitario DECIMAL(18,2)
        );

        INSERT INTO @NewDetails (id_producto, cantidad, precio_unitario)
        SELECT ProductoId, Cantidad, PrecioUnitario
        FROM OPENJSON(@DetallesJSON)
        WITH (
            ProductoId INT '$.ProductoId',
            Cantidad INT '$.Cantidad',
            PrecioUnitario DECIMAL(18,2) '$.PrecioUnitario'
        );

        IF EXISTS (
            SELECT 1
            FROM @NewDetails nd
            INNER JOIN PRODUCTOS p ON nd.id_producto = p.id_producto
            WHERE p.stock_actual < nd.cantidad
        )
        BEGIN
            RAISERROR('Stock insuficiente para uno o más productos.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        DECLARE @Total DECIMAL(18,2);
        SELECT @Total = SUM(cantidad * precio_unitario) FROM @NewDetails;

        UPDATE VENTAS
        SET fecha = @fecha,
            id_cliente = @id_cliente,
            id_usuario = @id_usuario,
            total = @Total
        WHERE id_venta = @id_venta;

        DELETE FROM VENTA_DETALLES WHERE id_venta = @id_venta;

        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        SELECT @id_venta, id_producto, cantidad, precio_unitario, cantidad * precio_unitario
        FROM @NewDetails;

        UPDATE p
        SET stock_actual = p.stock_actual - nd.cantidad
        FROM PRODUCTOS p
        INNER JOIN @NewDetails nd ON p.id_producto = nd.id_producto;

        COMMIT TRANSACTION;

        SELECT @id_venta AS Id;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- ========== IMAGENES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarImagenes]
AS
SELECT id_imagen, url, activo, tipo_entidad, id_entidad
FROM IMAGENES;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaImagen]
    @url VARCHAR(500),
    @activo BIT,
    @tipo_entidad VARCHAR(20),
    @id_entidad INT
AS
INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad)
VALUES (@url, @activo, @tipo_entidad, @id_entidad);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarImagen]
    @id_imagen INT,
    @url VARCHAR(500),
    @activo BIT,
    @tipo_entidad VARCHAR(20),
    @id_entidad INT
AS
UPDATE IMAGENES 
SET url = @url, activo = @activo, tipo_entidad = @tipo_entidad, id_entidad = @id_entidad
WHERE id_imagen = @id_imagen;
GO

-- ============================================================
-- 6. AJUSTE ADICIONAL: cambio de precisión en PRODUCTOS (por si acaso)
-- ============================================================
ALTER TABLE PRODUCTOS ALTER COLUMN precio decimal(10,2) NOT NULL;
GO

-- ============================================================
-- 7. EJECUCIÓN DE PROCEDIMIENTOS DE LISTADO (reemplaza los SELECT * )
-- ============================================================
EXEC storedListarMarcas;
EXEC storedListarCategorias;
EXEC storedListarProductos;
EXEC storedListarProveedores;
EXEC storedListarClientes;
EXEC storedListarCompras;
EXEC storedListarVentas;
EXEC storedListarUsuarios;
EXEC storedListarRoles;
EXEC storedListarImagenes;
GO