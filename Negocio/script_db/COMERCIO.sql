USE [master]
GO
/****** Objeto: Database [COMERCIO_DB] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
CREATE DATABASE [COMERCIO_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'COMERCIO_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\COMERCIO_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'COMERCIO_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\COMERCIO_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [COMERCIO_DB] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COMERCIO_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COMERCIO_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [COMERCIO_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [COMERCIO_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [COMERCIO_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET RECURSIVE_TRIGGERS OFF 
GO
--ALTER DATABASE [COMERCIO_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [COMERCIO_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [COMERCIO_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [COMERCIO_DB] SET  MULTI_USER 
GO
ALTER DATABASE [COMERCIO_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [COMERCIO_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [COMERCIO_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [COMERCIO_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [COMERCIO_DB] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [COMERCIO_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [COMERCIO_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [COMERCIO_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [COMERCIO_DB]
GO
/****** Objeto: Table [dbo].[CATEGORIAS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[CLIENTES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](20) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellido] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[telefono] [varchar](255) NULL,
	[direccion] [varchar](255) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_CLIENTES_dni] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[COMPRA_DETALLES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRA_DETALLES](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[subtotal] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_COMPRA_DETALLES] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[COMPRAS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPRAS](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_COMPRAS] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[IMAGENES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGENES](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](500) NOT NULL,
	[activo] [bit] NULL,
	[tipo_entidad] [varchar](20) NOT NULL,
	[id_entidad] [int] NOT NULL,
 CONSTRAINT [PK_imagenes] PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[MARCAS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[PRODUCTO_PROVEEDOR] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO_PROVEEDOR](
	[id_producto] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTO_PROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC,
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[PRODUCTOS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[id_marca] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[stock_actual] [int] NOT NULL,
	[stock_minimo] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[porcentaje_ganancia] [decimal](5, 2) NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[PROVEEDORES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[cuil] [varchar](20) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[telefono] [varchar](255) NULL,
	[direccion] [varchar](255) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PROVEEDORES_cuil] UNIQUE NONCLUSTERED 
(
	[cuil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[ROLES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ROLES_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[USUARIOS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_u] [varchar](255) NOT NULL,
	[id_rol] [int] NOT NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_USUARIOS_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[VENTA_DETALLES] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA_DETALLES](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](10, 2) NOT NULL,
	[subtotal] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_VENTA_DETALLES] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ============================================================
-- NUEVA TABLA: ESTADO_VENTA (CREADA ANTES DE VENTAS PARA REFERENCIA)
-- ============================================================
CREATE TABLE [dbo].[ESTADO_VENTA](
	[id_estado_venta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ESTADO_VENTA] PRIMARY KEY CLUSTERED 
(
	[id_estado_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ============================================================
-- TABLA VENTAS (CON id_estado_venta DESDE SU CREACIÓN)
-- ============================================================
/****** Objeto: Table [dbo].[VENTAS] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[total] [decimal](10, 2) NOT NULL,
	[numero_factura] [varchar](255) NOT NULL,
	[activo] [bit] NOT NULL,
	[id_estado_venta] [int] NOT NULL CONSTRAINT DF_VENTAS_estado DEFAULT (1),
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_VENTAS_numero_factura] UNIQUE NONCLUSTERED 
(
	[numero_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- ============================================================
-- CONTINÚAN LAS CONSTRAINTS ORIGINALES
-- ============================================================
ALTER TABLE [dbo].[CATEGORIAS] ADD  CONSTRAINT [DF_CATEGORIAS_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[CLIENTES] ADD  CONSTRAINT [DF_CLIENTES_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[COMPRAS] ADD  CONSTRAINT [DF_COMPRAS_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[IMAGENES] ADD  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[MARCAS] ADD  CONSTRAINT [DF_MARCAS_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_stock_actual]  DEFAULT ((0)) FOR [stock_actual]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_stock_minimo]  DEFAULT ((0)) FOR [stock_minimo]
GO
ALTER TABLE [dbo].[PRODUCTOS] ADD  CONSTRAINT [DF_PRODUCTOS_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[PROVEEDORES] ADD  CONSTRAINT [DF_PROVEEDORES_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[USUARIOS] ADD  CONSTRAINT [DF_USUARIOS_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[VENTAS] ADD  CONSTRAINT [DF_VENTAS_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[VENTAS] ADD  CONSTRAINT [DF_VENTAS_activo]  DEFAULT ((1)) FOR [activo]
GO

-- ============================================================
-- FOREIGN KEYS (INCLUYENDO LA NUEVA FK PARA id_estado_venta)
-- ============================================================
ALTER TABLE [dbo].[COMPRA_DETALLES]  WITH CHECK ADD  CONSTRAINT [FK_COMPRA_DETALLES_COMPRAS] FOREIGN KEY([id_compra])
REFERENCES [dbo].[COMPRAS] ([id_compra])
GO
ALTER TABLE [dbo].[COMPRA_DETALLES] CHECK CONSTRAINT [FK_COMPRA_DETALLES_COMPRAS]
GO
ALTER TABLE [dbo].[COMPRA_DETALLES]  WITH CHECK ADD  CONSTRAINT [FK_COMPRA_DETALLES_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO
ALTER TABLE [dbo].[COMPRA_DETALLES] CHECK CONSTRAINT [FK_COMPRA_DETALLES_PRODUCTOS]
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_COMPRAS_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_COMPRAS_PROVEEDORES]
GO
ALTER TABLE [dbo].[COMPRAS]  WITH CHECK ADD  CONSTRAINT [FK_COMPRAS_USUARIOS] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO
ALTER TABLE [dbo].[COMPRAS] CHECK CONSTRAINT [FK_COMPRAS_USUARIOS]
GO
ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO
ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR] CHECK CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PRODUCTOS]
GO
ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO
ALTER TABLE [dbo].[PRODUCTO_PROVEEDOR] CHECK CONSTRAINT [FK_PRODUCTO_PROVEEDOR_PROVEEDORES]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_CATEGORIAS] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[CATEGORIAS] ([id_categoria])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_CATEGORIAS]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_MARCAS] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCAS] ([id_marca])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_MARCAS]
GO
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_PROVEEDORES] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[PROVEEDORES] ([id_proveedor])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTOS_PROVEEDORES]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_ROLES] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_ROLES]
GO
ALTER TABLE [dbo].[VENTA_DETALLES]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DETALLES_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO
ALTER TABLE [dbo].[VENTA_DETALLES] CHECK CONSTRAINT [FK_VENTA_DETALLES_PRODUCTOS]
GO
ALTER TABLE [dbo].[VENTA_DETALLES]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_DETALLES_VENTAS] FOREIGN KEY([id_venta])
REFERENCES [dbo].[VENTAS] ([id_venta])
GO
ALTER TABLE [dbo].[VENTA_DETALLES] CHECK CONSTRAINT [FK_VENTA_DETALLES_VENTAS]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_CLIENTES] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_CLIENTES]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_USUARIOS] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_USUARIOS]
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_ESTADO_VENTA] FOREIGN KEY([id_estado_venta])
REFERENCES [dbo].[ESTADO_VENTA] ([id_estado_venta])
GO
ALTER TABLE [dbo].[VENTAS] CHECK CONSTRAINT [FK_VENTAS_ESTADO_VENTA]
GO

-- ============================================================
-- PROCEDIMIENTOS ALMACENADOS (MODIFICADOS LOS DE VENTAS)
-- ============================================================
CREATE   PROCEDURE [dbo].[storedAltaCategoria]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO

CREATE   PROCEDURE [dbo].[storedAltaCliente]
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

CREATE   PROCEDURE [dbo].[storedAltaCompra]
    @id_proveedor INT,
    @id_usuario INT,
    @total DECIMAL(10,2)
AS
INSERT INTO COMPRAS (id_proveedor, id_usuario, total)
VALUES (@id_proveedor, @id_usuario, @total);
GO

CREATE   PROCEDURE [dbo].[storedAltaCompraDetalle]
    @id_compra INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2),
    @subtotal DECIMAL(10,2)
AS
INSERT INTO COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
VALUES (@id_compra, @id_producto, @cantidad, @precio_unitario, @subtotal);
GO

CREATE   PROCEDURE [dbo].[storedAltaImagen]
    @url VARCHAR(500),
    @activo BIT,
    @tipo_entidad VARCHAR(20),
    @id_entidad INT
AS
INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad)
VALUES (@url, @activo, @tipo_entidad, @id_entidad);
GO

CREATE   PROCEDURE [dbo].[storedAltaMarca]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO

CREATE   PROCEDURE [dbo].[storedAltaProducto]
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

CREATE   PROCEDURE [dbo].[storedAltaProductoProveedor]
    @id_producto INT,
    @id_proveedor INT
AS
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@id_producto, @id_proveedor);
GO

CREATE   PROCEDURE [dbo].[storedAltaProveedor]
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

CREATE   PROCEDURE [dbo].[storedAltaRol]
    @nombre VARCHAR(255)
AS
INSERT INTO ROLES (nombre)
VALUES (@nombre);
GO

CREATE   PROCEDURE [dbo].[storedAltaUsuario]
    @nombre VARCHAR(255),
    @email VARCHAR(255),
    @password_u VARCHAR(255),
    @id_rol INT,
    @activo BIT
AS
INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo)
VALUES (@nombre, @email, @password_u, @id_rol, @activo);
GO

CREATE   PROCEDURE [dbo].[storedAltaVenta]
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT,
    @id_estado_venta INT = 1
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @YY CHAR(2) = RIGHT(YEAR(@fecha), 2);
    DECLARE @MM CHAR(2) = RIGHT('0' + CAST(MONTH(@fecha) AS VARCHAR), 2);
    DECLARE @UltimoNumero INT;

    SELECT @UltimoNumero = MAX(CAST(RIGHT(numero_factura, 4) AS INT))
    FROM VENTAS
    WHERE numero_factura LIKE 'A-' + @YY + '-' + @MM + '-%';

    IF @UltimoNumero IS NULL SET @UltimoNumero = 0;

    DECLARE @NuevoNumero INT = @UltimoNumero + 1;
    DECLARE @NumeroFactura NVARCHAR(50) = 'A-' + @YY + '-' + @MM + '-' + RIGHT('0000' + CAST(@NuevoNumero AS VARCHAR), 4);

    INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura, activo, id_estado_venta)
    VALUES (@fecha, @id_cliente, @id_usuario, 0, @NumeroFactura, 1, @id_estado_venta);

    SELECT SCOPE_IDENTITY() AS id_venta;
END
GO

CREATE   PROCEDURE [dbo].[storedAltaVentaDetalle]
    @id_venta INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM VENTAS WHERE id_venta = @id_venta AND activo = 1)
        BEGIN
            RAISERROR('La venta no existe o está anulada.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        DECLARE @stock_actual INT;
        SELECT @stock_actual = stock_actual FROM PRODUCTOS WHERE id_producto = @id_producto;
        IF @stock_actual < @cantidad
        BEGIN
            RAISERROR('Stock insuficiente para el producto.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        VALUES (@id_venta, @id_producto, @cantidad, @precio_unitario, @cantidad * @precio_unitario);

        UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad WHERE id_producto = @id_producto;

        UPDATE VENTAS
        SET total = (SELECT ISNULL(SUM(subtotal), 0) FROM VENTA_DETALLES WHERE id_venta = @id_venta)
        WHERE id_venta = @id_venta;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO

CREATE   PROCEDURE [dbo].[storedCambiarEstadoCategoria]
    @id_categoria INT,
    @activo BIT
AS
UPDATE CATEGORIAS
SET activo = @activo
WHERE id_categoria = @id_categoria;
GO

CREATE   PROCEDURE [dbo].[storedCambiarEstadoMarca]
    @id_marca INT,
    @activo BIT
AS
UPDATE MARCAS
SET activo = @activo
WHERE id_marca = @id_marca;
GO

CREATE   PROCEDURE [dbo].[storedCambiarEstadoVenta]
    @id_venta INT,
    @activo BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM VENTAS WHERE id_venta = @id_venta)
    BEGIN
        RAISERROR('La venta no existe.', 16, 1);
        RETURN;
    END

    UPDATE VENTAS
    SET activo = @activo
    WHERE id_venta = @id_venta;
END
GO

CREATE   PROCEDURE [dbo].[storedEliminarProducto]
    @id_producto INT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE PRODUCTOS
    SET activo = 0
    WHERE id_producto = @id_producto;
END
GO

CREATE   PROCEDURE [dbo].[storedEliminarProveedor]
    @id_proveedor INT
AS
UPDATE PROVEEDORES
SET activo = 0
WHERE id_proveedor = @id_proveedor;
GO

CREATE   PROCEDURE [dbo].[storeDetalleVenta]
    @id_venta INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        d.id_detalle,
        d.cantidad,
        d.subtotal,
        d.id_producto,
        d.precio_unitario AS precio,
        p.nombre
    FROM VENTA_DETALLES d
    INNER JOIN PRODUCTOS p ON d.id_producto = p.id_producto
    WHERE d.id_venta = @id_venta;
END
GO

CREATE   PROCEDURE [dbo].[storedListarCategorias]
AS
SELECT id_categoria, nombre, descripcion, activo
FROM CATEGORIAS;
GO

CREATE   PROCEDURE [dbo].[storedListarClientes]
AS
SELECT id_cliente, dni, nombre, apellido, email, telefono, direccion, activo
FROM CLIENTES;
GO

CREATE   PROCEDURE [dbo].[storedListarCompraDetalles]
AS
SELECT id_detalle, id_compra, id_producto, cantidad, precio_unitario, subtotal
FROM COMPRA_DETALLES;
GO

CREATE   PROCEDURE [dbo].[storedListarCompras]
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

CREATE   PROCEDURE [dbo].[storedListarImagenes]
AS
SELECT id_imagen, url, activo, tipo_entidad, id_entidad
FROM IMAGENES;
GO

CREATE   PROCEDURE [dbo].[storedListarMarcas]
AS
SELECT id_marca, nombre, descripcion, activo
FROM MARCAS;
GO

CREATE   PROCEDURE [dbo].[storedListarProductoProveedor]
AS
SELECT id_producto, id_proveedor
FROM PRODUCTO_PROVEEDOR;
GO

CREATE   PROCEDURE [dbo].[storedListarProductos]
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

CREATE   PROCEDURE [dbo].[storedListarProveedores]
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES;
GO

CREATE   PROCEDURE [dbo].[storedListarProveedorPorId]
    @id_proveedor INT
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE id_proveedor = @id_proveedor;
GO

CREATE   PROCEDURE [dbo].[storedListarRoles]
AS
SELECT id_rol, nombre
FROM ROLES;
GO

CREATE   PROCEDURE [dbo].[storedListarUsuarios]
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

CREATE   PROCEDURE [dbo].[storedListarVentas]
AS
BEGIN
    SELECT 
        v.id_venta,
        v.fecha,
        v.id_cliente,
        c.nombre AS nombre_cliente,
        c.apellido AS apellido_cliente,
        v.id_usuario,
        u.nombre AS nombre_usuario,
        v.total,
        v.numero_factura,
        v.activo,
        v.id_estado_venta,
        e.nombre AS nombre_estado
    FROM VENTAS v
    INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
    INNER JOIN USUARIOS u ON v.id_usuario = u.id_usuario
    LEFT JOIN ESTADO_VENTA e ON v.id_estado_venta = e.id_estado_venta
    ORDER BY v.id_venta DESC;
END
GO

CREATE   PROCEDURE [dbo].[storedModificarCategoria]
    @id_categoria INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
UPDATE CATEGORIAS 
SET nombre = @nombre, descripcion = @descripcion, activo = @activo
WHERE id_categoria = @id_categoria;
GO

CREATE   PROCEDURE [dbo].[storedModificarCliente]
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

CREATE   PROCEDURE [dbo].[storedModificarCompra]
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

CREATE   PROCEDURE [dbo].[storedModificarCompraDetalle]
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

CREATE   PROCEDURE [dbo].[storedModificarImagen]
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

CREATE   PROCEDURE [dbo].[storedModificarMarca]
    @id_marca INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
UPDATE MARCAS 
SET nombre = @nombre, descripcion = @descripcion, activo = @activo
WHERE id_marca = @id_marca;
GO

CREATE   PROCEDURE [dbo].[storedModificarProducto]
    @id_producto INT,
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @id_marca INT,
    @id_categoria INT,
    @id_proveedor INT,
    @precio DECIMAL(10,2),
    @stock_actual INT,
    @stock_minimo INT,
    @porcentaje_ganancia DECIMAL(5,2),
    @url_imagen VARCHAR(500)
AS
BEGIN
    UPDATE PRODUCTOS
    SET nombre = @nombre,
        descripcion = @descripcion,
        id_marca = @id_marca,
        id_categoria = @id_categoria,
        id_proveedor = @id_proveedor,
        stock_actual = @stock_actual,
        stock_minimo = @stock_minimo,
        precio = @precio,
        porcentaje_ganancia = @porcentaje_ganancia
    WHERE id_producto = @id_producto;

    IF EXISTS (SELECT 1 FROM IMAGENES WHERE id_entidad = @id_producto AND tipo_entidad = 'PRODUCTO')
    BEGIN
        UPDATE IMAGENES
        SET url = @url_imagen
        WHERE id_entidad = @id_producto
          AND tipo_entidad = 'PRODUCTO';
    END
    ELSE
    BEGIN
        INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad)
        VALUES (@url_imagen, 1, 'PRODUCTO', @id_producto);
    END
END
GO

CREATE   PROCEDURE [dbo].[storedModificarProductoProveedor]
    @id_producto_anterior INT,
    @id_proveedor_anterior INT,
    @id_producto INT,
    @id_proveedor INT
AS
UPDATE PRODUCTO_PROVEEDOR 
SET id_producto = @id_producto, id_proveedor = @id_proveedor
WHERE id_producto = @id_producto_anterior AND id_proveedor = @id_proveedor_anterior;
GO

CREATE   PROCEDURE [dbo].[storedModificarProveedor]
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

CREATE   PROCEDURE [dbo].[storedModificarRol]
    @id_rol INT,
    @nombre VARCHAR(255)
AS
UPDATE ROLES 
SET nombre = @nombre
WHERE id_rol = @id_rol;
GO

CREATE   PROCEDURE [dbo].[storedModificarUsuario]
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

CREATE   PROCEDURE [dbo].[storedModificarVenta]
    @id_venta INT,
    @id_cliente INT,
    @fecha DATETIME,
    @id_usuario INT,
    @id_estado_venta INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM VENTAS WHERE id_venta = @id_venta AND activo = 1)
    BEGIN
        RAISERROR('La venta no existe o está anulada.', 16, 1);
        RETURN;
    END

    UPDATE VENTAS
    SET fecha = @fecha,
        id_cliente = @id_cliente,
        id_usuario = @id_usuario,
        id_estado_venta = @id_estado_venta
    WHERE id_venta = @id_venta;

    SELECT @id_venta AS id_venta;
END
GO

CREATE   PROCEDURE [dbo].[storedModificarVentaDetalle]
    @id_venta INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        DECLARE @id_detalle INT;
        DECLARE @cantidad_antigua INT;

        SELECT @id_detalle = id_detalle, @cantidad_antigua = cantidad
        FROM VENTA_DETALLES
        WHERE id_venta = @id_venta AND id_producto = @id_producto;

        IF @id_detalle IS NULL
        BEGIN
            RAISERROR('Detalle no encontrado para esta venta y producto.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        UPDATE PRODUCTOS SET stock_actual = stock_actual + @cantidad_antigua WHERE id_producto = @id_producto;

        DECLARE @stock_actual INT;
        SELECT @stock_actual = stock_actual FROM PRODUCTOS WHERE id_producto = @id_producto;
        IF @stock_actual < @cantidad
        BEGIN
            UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad_antigua WHERE id_producto = @id_producto;
            RAISERROR('Stock insuficiente para la nueva cantidad.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        UPDATE VENTA_DETALLES
        SET cantidad = @cantidad,
            precio_unitario = @precio_unitario,
            subtotal = @cantidad * @precio_unitario
        WHERE id_detalle = @id_detalle;

        UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad WHERE id_producto = @id_producto;

        UPDATE VENTAS
        SET total = (SELECT ISNULL(SUM(subtotal), 0) FROM VENTA_DETALLES WHERE id_venta = @id_venta)
        WHERE id_venta = @id_venta;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END
GO

CREATE   PROCEDURE [dbo].[storeVerVenta]
    @id_venta INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        v.id_venta,
        v.fecha,
        v.numero_factura,
        v.total,
        v.id_cliente,
        c.nombre AS nombre_cliente,
        c.apellido AS apellido_cliente,
        v.id_usuario,
        u.nombre AS nombre_usuario,
        u.activo AS activo_usuario,
        v.id_estado_venta,
        e.nombre AS nombre_estado
    FROM VENTAS v
    INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
    INNER JOIN USUARIOS u ON v.id_usuario = u.id_usuario
    LEFT JOIN ESTADO_VENTA e ON v.id_estado_venta = e.id_estado_venta
    WHERE v.id_venta = @id_venta;
END
GO

-- ============================================================
-- INSERTS DE ESTADOS DE VENTA
-- ============================================================
SET IDENTITY_INSERT [dbo].[ESTADO_VENTA] ON
INSERT INTO [dbo].[ESTADO_VENTA] ([id_estado_venta], [nombre]) VALUES (1, 'Pendiente')
INSERT INTO [dbo].[ESTADO_VENTA] ([id_estado_venta], [nombre]) VALUES (2, 'En preparación')
INSERT INTO [dbo].[ESTADO_VENTA] ([id_estado_venta], [nombre]) VALUES (3, 'Lista para retirar')
INSERT INTO [dbo].[ESTADO_VENTA] ([id_estado_venta], [nombre]) VALUES (4, 'Entregada')
INSERT INTO [dbo].[ESTADO_VENTA] ([id_estado_venta], [nombre]) VALUES (5, 'Cancelada')
SET IDENTITY_INSERT [dbo].[ESTADO_VENTA] OFF
GO

-- ============================================================
-- DATOS DE PRUEBA (ORIGINALES, CON id_estado_venta)
-- ============================================================
INSERT INTO ROLES (nombre) VALUES 
('Administrador'),
('Vendedor'),
('Gerente');

INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo) VALUES 
('Admin', 'admin@comercio.com', 'admin123', 1, 1),
('Juan Perez', 'juan@comercio.com', 'juan123', 2, 1),
('Maria Gomez', 'maria@comercio.com', 'maria123', 3, 1);

INSERT INTO CATEGORIAS (nombre, descripcion, activo) VALUES 
('Celulares', 'Teléfonos inteligentes y accesorios', 1),
('Tablets', 'Tablets y dispositivos similares', 1),
('Computadoras', 'Notebooks, netbooks y PC', 1),
('Electrodomésticos', 'Línea blanca y pequeños electrodomésticos', 1),
('Accesorios', 'Cargadores, fundas, auriculares, etc.', 1);

INSERT INTO MARCAS (nombre, descripcion, activo) VALUES 
('Samsung', 'Electrónica y electrodomésticos', 1),
('Apple', 'Dispositivos y computadoras', 1),
('LG', 'Electrónica y electrodomésticos', 1),
('Motorola', 'Teléfonos y accesorios', 1),
('Lenovo', 'Computadoras y tablets', 1),
('HP', 'Computadoras e impresoras', 1),
('Dell', 'Computadoras y periféricos', 1),
('Sony', 'Electrónica y entretenimiento', 1),
('Philips', 'Electrodomésticos y salud', 1),
('BGH', 'Electrodomésticos', 1);

INSERT INTO PROVEEDORES (cuil, nombre, email, telefono, direccion, activo) VALUES 
('20-12345678-9', 'TecnoImport S.A.', 'tecnoimport@mail.com', '011-1234-5678', 'Av. Corrientes 1234, CABA', 1),
('30-87654321-0', 'ElectroWorld', 'electroworld@mail.com', '011-2345-6789', 'Calle 56 789, CABA', 1),
('40-11223344-5', 'CompuMundo', 'compumundo@mail.com', '011-3456-7890', 'Av. Santa Fe 456, CABA', 1),
('50-55667788-9', 'HogarDigital', 'hogardigital@mail.com', '011-4567-8901', 'Av. Rivadavia 789, CABA', 1),
('60-99887766-5', 'AccesoriosPlus', 'accesoriosplus@mail.com', '011-5678-9012', 'Calle 123, CABA', 1);

INSERT INTO CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo) VALUES 
('12345678', 'Carlos', 'Lopez', 'carlos.lopez@mail.com', '1111-1111', 'Calle Falsa 123', 1),
('87654321', 'Ana', 'Martinez', 'ana.martinez@mail.com', '2222-2222', 'Av. Libertador 456', 1),
('11223344', 'Luis', 'Garcia', 'luis.garcia@mail.com', '3333-3333', 'Calle 9 de Julio 789', 1),
('99887766', 'Laura', 'Fernandez', 'laura.fernandez@mail.com', '4444-4444', 'Av. Callao 101', 1),
('44556677', 'Javier', 'Rodriguez', 'javier.rodriguez@mail.com', '5555-5555', 'Calle Arenales 202', 1);

INSERT INTO PRODUCTOS (nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo) VALUES 
('Samsung Galaxy S24', 'Smartphone gama alta, 256GB, 12GB RAM', 1, 1, 1, 30, 5, 1200.00, 25.00, 1),
('iPhone 15 Pro Max', 'Apple iPhone 15 Pro Max 256GB', 2, 1, 1, 20, 3, 1500.00, 30.00, 1),
('Motorola Edge 40', 'Motorola Edge 40, 128GB, 8GB RAM', 4, 1, 2, 25, 4, 800.00, 22.00, 1),
('iPad Pro 12.9', 'Tablet Apple con M2, 128GB', 2, 2, 3, 15, 2, 1100.00, 28.00, 1),
('Samsung Galaxy Tab S9', 'Tablet Samsung 11", 128GB', 1, 2, 1, 18, 3, 900.00, 25.00, 1),
('Lenovo ThinkPad X1', 'Notebook empresarial, i7, 16GB, 512GB SSD', 5, 3, 3, 10, 2, 2000.00, 20.00, 1),
('HP Pavilion 15', 'Notebook HP, i5, 8GB, 256GB SSD', 6, 3, 4, 12, 2, 850.00, 18.00, 1),
('Dell XPS 13', 'Notebook ultrabook, i7, 16GB, 512GB SSD', 7, 3, 4, 8, 1, 1800.00, 22.00, 1),
('LG 55" OLED TV', 'Televisor 4K OLED, 55 pulgadas', 3, 4, 2, 6, 1, 1500.00, 15.00, 1),
('Samsung Refrigerador', 'Refrigerador side-by-side, 600L', 1, 4, 5, 8, 2, 1200.00, 18.00, 1),
('Philips Microwave', 'Microondas digital 25L', 9, 4, 5, 20, 5, 250.00, 20.00, 1),
('BGH Lavarropas', 'Lavarropas automático 8kg', 10, 4, 4, 10, 2, 700.00, 16.00, 1);

INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad) VALUES 
('https://example.com/galaxy_s24.jpg', 1, 'PRODUCTO', 1),
('https://example.com/iphone15promax.jpg', 1, 'PRODUCTO', 2),
('https://example.com/motorola_edge40.jpg', 1, 'PRODUCTO', 3),
('https://example.com/ipad_pro.jpg', 1, 'PRODUCTO', 4),
('https://example.com/galaxy_tab_s9.jpg', 1, 'PRODUCTO', 5),
('https://example.com/thinkpad_x1.jpg', 1, 'PRODUCTO', 6),
('https://example.com/hp_pavilion15.jpg', 1, 'PRODUCTO', 7),
('https://example.com/dell_xps13.jpg', 1, 'PRODUCTO', 8),
('https://example.com/lg_oled_tv.jpg', 1, 'PRODUCTO', 9),
('https://example.com/samsung_refri.jpg', 1, 'PRODUCTO', 10),
('https://example.com/philips_micro.jpg', 1, 'PRODUCTO', 11),
('https://example.com/bgh_lavarropas.jpg', 1, 'PRODUCTO', 12);

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 1),
(6, 3),
(7, 4),
(8, 4),
(9, 2),
(10, 5),
(11, 5),
(12, 4);

INSERT INTO COMPRAS (fecha, id_proveedor, id_usuario, total) VALUES 
(GETDATE(), 1, 1, 0),
(GETDATE(), 3, 2, 0);

INSERT INTO COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 10, 950.00, 9500.00),
(1, 2, 5, 1200.00, 6000.00),
(1, 5, 8, 720.00, 5760.00),
(1, 10, 4, 980.00, 3920.00),
(2, 4, 6, 880.00, 5280.00),
(2, 6, 3, 1600.00, 4800.00),
(2, 8, 2, 1400.00, 2800.00),
(2, 11, 10, 200.00, 2000.00);

UPDATE COMPRAS SET total = (SELECT SUM(subtotal) FROM COMPRA_DETALLES WHERE id_compra = 1) WHERE id_compra = 1;
UPDATE COMPRAS SET total = (SELECT SUM(subtotal) FROM COMPRA_DETALLES WHERE id_compra = 2) WHERE id_compra = 2;

INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura, activo, id_estado_venta) VALUES 
(GETDATE(), 1, 2, 0, 'A-26-06-0001', 1, 1),
(GETDATE(), 2, 1, 0, 'A-26-06-0002', 1, 1);

INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 2, 1200.00, 2400.00),
(1, 3, 1, 800.00, 800.00),
(1, 7, 2, 850.00, 1700.00),
(1, 9, 1, 1500.00, 1500.00),
(2, 2, 1, 1500.00, 1500.00),
(2, 4, 1, 1100.00, 1100.00),
(2, 6, 1, 2000.00, 2000.00),
(2, 12, 2, 700.00, 1400.00);

UPDATE VENTAS SET total = (SELECT SUM(subtotal) FROM VENTA_DETALLES WHERE id_venta = 1) WHERE id_venta = 1;
UPDATE VENTAS SET total = (SELECT SUM(subtotal) FROM VENTA_DETALLES WHERE id_venta = 2) WHERE id_venta = 2;

UPDATE PRODUCTOS SET stock_actual = stock_actual - 2 WHERE id_producto = 1;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 1 WHERE id_producto = 3;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 2 WHERE id_producto = 7;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 1 WHERE id_producto = 9;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 1 WHERE id_producto = 2;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 1 WHERE id_producto = 4;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 1 WHERE id_producto = 6;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 2 WHERE id_producto = 12;

GO
USE [master]
GO
ALTER DATABASE [COMERCIO_DB] SET  READ_WRITE 
GO

-- ============================================================
-- PROCEDIMIENTOS ADICIONALES (AGREGADOS POR AGUS)
-- ============================================================
USE [COMERCIO_DB]
GO

CREATE PROCEDURE [dbo].[storedTotalVentasDelDia]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT CAST(ISNULL(SUM(total), 0) AS DECIMAL(10, 2)) AS total_ventas_dia
    FROM VENTAS
    WHERE activo = 1
      AND fecha >= CONVERT(DATE, GETDATE())
      AND fecha < DATEADD(DAY, 1, CONVERT(DATE, GETDATE()));
END
GO

CREATE PROCEDURE [dbo].[storedCantidadProductosActivos]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT COUNT(*) AS cantidad_productos_activos
    FROM PRODUCTOS
    WHERE activo = 1;
END
GO

CREATE PROCEDURE [dbo].[storedCantidadProductosBajoStock]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT COUNT(*) AS cantidad_productos_bajo_stock
    FROM PRODUCTOS
    WHERE activo = 1
      AND stock_actual < stock_minimo;
END
GO

CREATE PROCEDURE [dbo].[storedGananciaEstimadaVentas]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT CAST(
        ISNULL(
            SUM(
                VD.cantidad
                * VD.precio_unitario
                * (P.porcentaje_ganancia / 100.00)
            ),
            0
        )
        AS DECIMAL(18, 2)
    ) AS ganancia_estimada
    FROM VENTAS V
    INNER JOIN VENTA_DETALLES VD
        ON VD.id_venta = V.id_venta
    INNER JOIN PRODUCTOS P
        ON P.id_producto = VD.id_producto
    WHERE V.activo = 1;
END
GO

-- ============================================================
-- RESTRICCIONES DE INTEGRIDAD (CON LA CORRECCIÓN)
-- ============================================================
ALTER TABLE COMPRA_DETALLES
ADD CONSTRAINT CK_COMPRA_DETALLES_cantidad
CHECK (cantidad > 0);
GO

ALTER TABLE COMPRA_DETALLES
ADD CONSTRAINT CK_COMPRA_DETALLES_precio
CHECK (precio_unitario >= 0);
GO

ALTER TABLE COMPRA_DETALLES
ADD CONSTRAINT CK_COMPRA_DETALLES_subtotal
CHECK (subtotal >= 0);
GO

ALTER TABLE COMPRA_DETALLES
ADD CONSTRAINT UQ_COMPRA_DETALLES_compra_producto
UNIQUE (id_compra, id_producto);
GO

ALTER TABLE COMPRAS
ADD CONSTRAINT CK_COMPRAS_total
CHECK (total >= 0);
GO

ALTER TABLE PRODUCTOS
ADD CONSTRAINT CK_PRODUCTOS_stock_actual
CHECK (stock_actual >= 0);
GO

-- ============================================================
-- TIPO TABLA Y TRIGGER PARA COMPRAS
-- ============================================================
CREATE TYPE dbo.TipoDetalleCompra AS TABLE
(
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_producto)
);
GO

CREATE TRIGGER dbo.tr_CompraDetalle_AfterInsert
ON dbo.COMPRA_DETALLES
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE P
    SET P.stock_actual = P.stock_actual + X.cantidad_comprada
    FROM PRODUCTOS P
    INNER JOIN
    (
        SELECT
            id_producto,
            SUM(cantidad) AS cantidad_comprada
        FROM inserted
        GROUP BY id_producto
    ) X
        ON X.id_producto = P.id_producto;

    UPDATE C
    SET C.total = X.total_compra
    FROM COMPRAS C
    INNER JOIN
    (
        SELECT
            CD.id_compra,
            SUM(CD.subtotal) AS total_compra
        FROM COMPRA_DETALLES CD
        WHERE CD.id_compra IN
        (
            SELECT DISTINCT id_compra
            FROM inserted
        )
        GROUP BY CD.id_compra
    ) X
        ON X.id_compra = C.id_compra;
END;
GO

CREATE PROCEDURE dbo.storedRegistrarCompra
    @fecha DATETIME = NULL,
    @id_proveedor INT,
    @id_usuario INT,
    @detalles dbo.TipoDetalleCompra READONLY
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF @fecha IS NULL
            SET @fecha = GETDATE();

        IF NOT EXISTS (SELECT 1 FROM PROVEEDORES WHERE id_proveedor = @id_proveedor AND activo = 1)
        BEGIN
            RAISERROR('El proveedor no existe o está inactivo.', 16, 1);
        END;

        IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE id_usuario = @id_usuario AND activo = 1)
        BEGIN
            RAISERROR('El usuario no existe o está inactivo.', 16, 1);
        END;

        IF NOT EXISTS (SELECT 1 FROM @detalles)
        BEGIN
            RAISERROR('La compra debe contener al menos un producto.', 16, 1);
        END;

        IF EXISTS (SELECT 1 FROM @detalles WHERE cantidad <= 0 OR precio_unitario < 0)
        BEGIN
            RAISERROR('Las cantidades deben ser mayores a cero y los precios no pueden ser negativos.', 16, 1);
        END;

        IF EXISTS (
            SELECT 1
            FROM @detalles D
            LEFT JOIN PRODUCTOS P ON P.id_producto = D.id_producto AND P.activo = 1
            WHERE P.id_producto IS NULL
        )
        BEGIN
            RAISERROR('Uno o más productos no existen o están inactivos.', 16, 1);
        END;

        IF EXISTS (
            SELECT 1
            FROM @detalles D
            WHERE NOT EXISTS (
                SELECT 1
                FROM PRODUCTO_PROVEEDOR PP
                WHERE PP.id_producto = D.id_producto
                  AND PP.id_proveedor = @id_proveedor
            )
        )
        BEGIN
            RAISERROR('Uno o más productos no pertenecen al proveedor seleccionado.', 16, 1);
        END;

        INSERT INTO COMPRAS (fecha, id_proveedor, id_usuario, total)
        VALUES (@fecha, @id_proveedor, @id_usuario, 0);

        DECLARE @id_compra INT = SCOPE_IDENTITY();

        INSERT INTO COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
        SELECT @id_compra, id_producto, cantidad, precio_unitario, cantidad * precio_unitario
        FROM @detalles;

        COMMIT TRANSACTION;

        SELECT C.id_compra, C.fecha, C.id_proveedor, C.id_usuario, C.total
        FROM COMPRAS C
        WHERE C.id_compra = @id_compra;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO
