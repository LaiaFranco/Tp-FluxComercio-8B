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
/****** Objeto: Table [dbo].[VENTAS] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
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
/****** Objeto: StoredProcedure [dbo].[storedAltaCategoria] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedAltaCategoria]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO CATEGORIAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaCliente] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaCompra] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedAltaCompra]
    @id_proveedor INT,
    @id_usuario INT,
    @total DECIMAL(10,2)
AS
INSERT INTO COMPRAS (id_proveedor, id_usuario, total)
VALUES (@id_proveedor, @id_usuario, @total);
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaCompraDetalle] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaImagen] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaMarca] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedAltaMarca]
    @nombre VARCHAR(255),
    @descripcion VARCHAR(300),
    @activo BIT
AS
INSERT INTO MARCAS (nombre, descripcion, activo)
VALUES (@nombre, @descripcion, @activo);
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaProducto] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaProductoProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedAltaProductoProveedor]
    @id_producto INT,
    @id_proveedor INT
AS
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@id_producto, @id_proveedor);
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaRol] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedAltaRol]
    @nombre VARCHAR(255)
AS
INSERT INTO ROLES (nombre)
VALUES (@nombre);
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaUsuario] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedAltaVenta] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Alta de cabecera de venta (genera nÃºmero de factura, total inicial 0)
CREATE   PROCEDURE [dbo].[storedAltaVenta]
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT
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

    INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura, activo)
    VALUES (@fecha, @id_cliente, @id_usuario, 0, @NumeroFactura, 1);

    -- Devuelve el ID generado
    SELECT SCOPE_IDENTITY() AS id_venta;
END
GO
/****** Objeto: StoredProcedure [dbo].[storedAltaVentaDetalle] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Alta de un detalle de venta (actualiza stock y total)
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
        -- Verificar que la venta existe y estÃ¡ activa
        IF NOT EXISTS (SELECT 1 FROM VENTAS WHERE id_venta = @id_venta AND activo = 1)
        BEGIN
            RAISERROR('La venta no existe o estÃ¡ anulada.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar stock suficiente
        DECLARE @stock_actual INT;
        SELECT @stock_actual = stock_actual FROM PRODUCTOS WHERE id_producto = @id_producto;
        IF @stock_actual < @cantidad
        BEGIN
            RAISERROR('Stock insuficiente para el producto.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insertar detalle
        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        VALUES (@id_venta, @id_producto, @cantidad, @precio_unitario, @cantidad * @precio_unitario);

        -- Descontar stock
        UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad WHERE id_producto = @id_producto;

        -- Recalcular total de la venta
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
/****** Objeto: StoredProcedure [dbo].[storedCambiarEstadoCategoria] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedCambiarEstadoCategoria]
    @id_categoria INT,
    @activo BIT
AS
UPDATE CATEGORIAS
SET activo = @activo
WHERE id_categoria = @id_categoria;
GO
/****** Objeto: StoredProcedure [dbo].[storedCambiarEstadoMarca] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedCambiarEstadoMarca]
    @id_marca INT,
    @activo BIT
AS
UPDATE MARCAS
SET activo = @activo
WHERE id_marca = @id_marca;
GO
/****** Objeto: StoredProcedure [dbo].[storedCambiarEstadoVenta] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Cambiar estado (activo) de una venta
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
/****** Objeto: StoredProcedure [dbo].[storedEliminarProducto] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedEliminarProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedEliminarProveedor]
    @id_proveedor INT
AS
UPDATE PROVEEDORES
SET activo = 0
WHERE id_proveedor = @id_proveedor;
GO
/****** Objeto: StoredProcedure [dbo].[storeDetalleVenta] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
--  ***** NUEVO: Obtiene los detalles de una venta con JOIN a Productos *****
-- ============================================================
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
/****** Objeto: StoredProcedure [dbo].[storedListarCategorias] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== CATEGORIAS ==========
CREATE   PROCEDURE [dbo].[storedListarCategorias]
AS
SELECT id_categoria, nombre, descripcion, activo
FROM CATEGORIAS;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarClientes] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== CLIENTES ==========
CREATE   PROCEDURE [dbo].[storedListarClientes]
AS
SELECT id_cliente, dni, nombre, apellido, email, telefono, direccion, activo
FROM CLIENTES;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarCompraDetalles] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== COMPRA_DETALLES ==========
CREATE   PROCEDURE [dbo].[storedListarCompraDetalles]
AS
SELECT id_detalle, id_compra, id_producto, cantidad, precio_unitario, subtotal
FROM COMPRA_DETALLES;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarCompras] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== COMPRAS ==========
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
/****** Objeto: StoredProcedure [dbo].[storedListarImagenes] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== IMAGENES ==========
CREATE   PROCEDURE [dbo].[storedListarImagenes]
AS
SELECT id_imagen, url, activo, tipo_entidad, id_entidad
FROM IMAGENES;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarMarcas] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== MARCAS ==========
CREATE   PROCEDURE [dbo].[storedListarMarcas]
AS
SELECT id_marca, nombre, descripcion, activo
FROM MARCAS;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarProductoProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== PRODUCTO_PROVEEDOR ==========
CREATE   PROCEDURE [dbo].[storedListarProductoProveedor]
AS
SELECT id_producto, id_proveedor
FROM PRODUCTO_PROVEEDOR;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarProductos] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== PRODUCTOS ==========
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
/****** Objeto: StoredProcedure [dbo].[storedListarProveedores] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== PROVEEDORES ==========
CREATE   PROCEDURE [dbo].[storedListarProveedores]
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE activo = 1;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarProveedorPorId] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedListarProveedorPorId]
    @id_proveedor INT
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE id_proveedor = @id_proveedor;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarRoles] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== ROLES ==========
CREATE   PROCEDURE [dbo].[storedListarRoles]
AS
SELECT id_rol, nombre
FROM ROLES;
GO
/****** Objeto: StoredProcedure [dbo].[storedListarUsuarios] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== USUARIOS ==========
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
/****** Objeto: StoredProcedure [dbo].[storedListarVentas] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ========== VENTAS ==========

-- *** LISTAR VENTAS (MODIFICADO: INCLUYE id_usuario Y nombre_usuario) ***
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
        u.nombre AS nombre_usuario,  -- <-- NUEVO CAMPO
        v.total,
        v.numero_factura,
        v.activo
    FROM VENTAS v
    INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
    INNER JOIN USUARIOS u ON v.id_usuario = u.id_usuario  -- <-- NUEVO JOIN
    ORDER BY v.id_venta DESC;
END
GO
/****** Objeto: StoredProcedure [dbo].[storedModificarCategoria] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarCliente] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarCompra] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarCompraDetalle] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarImagen] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarMarca] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarProducto] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

    -- =========================
    -- PRODUCTOS
    -- =========================
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

    -- =========================
    -- IMAGEN
    -- =========================
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
/****** Objeto: StoredProcedure [dbo].[storedModificarProductoProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarProveedor] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarRol] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[storedModificarRol]
    @id_rol INT,
    @nombre VARCHAR(255)
AS
UPDATE ROLES 
SET nombre = @nombre
WHERE id_rol = @id_rol;
GO
/****** Objeto: StoredProcedure [dbo].[storedModificarUsuario] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Objeto: StoredProcedure [dbo].[storedModificarVenta] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
--  ***** MODIFICADO PARA QUE DEVUELVA EL ID *****
-- ============================================================
CREATE   PROCEDURE [dbo].[storedModificarVenta]
    @id_venta INT,
    @id_cliente INT,
    @fecha DATETIME,
    @id_usuario INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM VENTAS WHERE id_venta = @id_venta AND activo = 1)
    BEGIN
        RAISERROR('La venta no existe o estÃ¡ anulada.', 16, 1);
        RETURN;
    END

    UPDATE VENTAS
    SET fecha = @fecha,
        id_cliente = @id_cliente,
        id_usuario = @id_usuario
    WHERE id_venta = @id_venta;

    -- Esto permite que el C# use ejecutarEscalar() y obtenga el ID
    SELECT @id_venta AS id_venta;
END
GO
/****** Objeto: StoredProcedure [dbo].[storedModificarVentaDetalle] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
--  ***** REEMPLAZADO PARA QUE ACEPTE LOS PARÃMETROS DE C# *****
-- ============================================================
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

        -- Obtener el detalle actual
        SELECT @id_detalle = id_detalle, @cantidad_antigua = cantidad
        FROM VENTA_DETALLES
        WHERE id_venta = @id_venta AND id_producto = @id_producto;

        IF @id_detalle IS NULL
        BEGIN
            RAISERROR('Detalle no encontrado para esta venta y producto.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Reponer stock antiguo
        UPDATE PRODUCTOS SET stock_actual = stock_actual + @cantidad_antigua WHERE id_producto = @id_producto;

        -- Verificar stock para nueva cantidad
        DECLARE @stock_actual INT;
        SELECT @stock_actual = stock_actual FROM PRODUCTOS WHERE id_producto = @id_producto;
        IF @stock_actual < @cantidad
        BEGIN
            -- Revertir reposiciÃ³n
            UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad_antigua WHERE id_producto = @id_producto;
            RAISERROR('Stock insuficiente para la nueva cantidad.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Actualizar detalle
        UPDATE VENTA_DETALLES
        SET cantidad = @cantidad,
            precio_unitario = @precio_unitario,
            subtotal = @cantidad * @precio_unitario
        WHERE id_detalle = @id_detalle;

        -- Descontar nuevo stock
        UPDATE PRODUCTOS SET stock_actual = stock_actual - @cantidad WHERE id_producto = @id_producto;

        -- Recalcular total de la venta
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
/****** Objeto: StoredProcedure [dbo].[storeVerVenta] Fecha de script: 30/06/2026 06:43:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================================
--  ***** NUEVO: Obtiene una venta por ID con JOIN a Cliente y Usuario *****
-- ============================================================
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
        u.activo AS activo_usuario
    FROM VENTAS v
    INNER JOIN CLIENTES c ON v.id_cliente = c.id_cliente
    INNER JOIN USUARIOS u ON v.id_usuario = u.id_usuario
    WHERE v.id_venta = @id_venta;
END 
GO

-- ============================================================
--  INSERCIONES DE DATOS DE PRUEBA
-- ============================================================

-- 1. ROLES
INSERT INTO ROLES (nombre) VALUES 
('Administrador'),
('Vendedor'),
('Gerente');

-- 2. USUARIOS
INSERT INTO USUARIOS (nombre, email, password_u, id_rol, activo) VALUES 
('Admin', 'admin@comercio.com', 'admin123', 1, 1),
('Juan Perez', 'juan@comercio.com', 'juan123', 2, 1),
('Maria Gomez', 'maria@comercio.com', 'maria123', 3, 1);

-- 3. CATEGORIAS
INSERT INTO CATEGORIAS (nombre, descripcion, activo) VALUES 
('Electrónica', 'Productos electrónicos', 1),
('Ropa', 'Indumentaria', 1),
('Alimentos', 'Productos alimenticios', 1);

-- 4. MARCAS
INSERT INTO MARCAS (nombre, descripcion, activo) VALUES 
('Samsung', 'Electrónica coreana', 1),
('Nike', 'Ropa deportiva', 1),
('Nestlé', 'Alimentos', 1);

-- 5. PROVEEDORES
INSERT INTO PROVEEDORES (cuil, nombre, email, telefono, direccion, activo) VALUES 
('20-12345678-9', 'Proveedor A', 'prov_a@mail.com', '123456789', 'Calle 1', 1),
('30-87654321-0', 'Proveedor B', 'prov_b@mail.com', '987654321', 'Calle 2', 1),
('40-11223344-5', 'Proveedor C', 'prov_c@mail.com', '112233445', 'Calle 3', 1);

-- 6. CLIENTES
INSERT INTO CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo) VALUES 
('12345678', 'Carlos', 'Lopez', 'carlos@mail.com', '1111111', 'Dir 1', 1),
('87654321', 'Ana', 'Martinez', 'ana@mail.com', '2222222', 'Dir 2', 1),
('11223344', 'Luis', 'Garcia', 'luis@mail.com', '3333333', 'Dir 3', 1);

-- 7. PRODUCTOS (dependen de marcas, categorías y proveedores)
-- Usamos los IDs obtenidos (asumimos que el identity empieza en 1)
INSERT INTO PRODUCTOS (nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo) VALUES 
('Smartphone Galaxy', 'Smartphone de última generación', 1, 1, 1, 50, 5, 500.00, 20.00, 1),
('Camiseta Deportiva', 'Camiseta de algodón', 2, 2, 2, 100, 10, 25.00, 30.00, 1),
('Leche Entera', 'Leche de vaca', 3, 3, 3, 200, 20, 1.50, 15.00, 1);

-- 8. IMAGENES para los productos
INSERT INTO IMAGENES (url, activo, tipo_entidad, id_entidad) VALUES 
('http://example.com/samsung.jpg', 1, 'PRODUCTO', 1),
('http://example.com/nike.jpg', 1, 'PRODUCTO', 2),
('http://example.com/nestle.jpg', 1, 'PRODUCTO', 3);

-- 9. PRODUCTO_PROVEEDOR (asociar cada producto con su proveedor principal)
INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- 10. COMPRAS (una compra de ejemplo)
-- Fecha actual, proveedor 1, usuario 1 (Admin), total 0 inicialmente
INSERT INTO COMPRAS (fecha, id_proveedor, id_usuario, total) VALUES 
(GETDATE(), 1, 1, 0);

-- 11. COMPRA_DETALLES para la compra anterior
-- Suponemos que la compra insertada tiene id_compra = 1
-- Detalle 1: producto 1 (Smartphone), cantidad 10, precio 450.00 (precio de compra)
INSERT INTO COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 10, 450.00, 4500.00),
(1, 2, 20, 20.00, 400.00),
(1, 3, 50, 1.20, 60.00);

-- Actualizar el total de la compra sumando los subtotales
UPDATE COMPRAS SET total = (SELECT SUM(subtotal) FROM COMPRA_DETALLES WHERE id_compra = 1) WHERE id_compra = 1;

-- 12. VENTAS (una venta de ejemplo)
-- Cliente 1, usuario 2 (Vendedor), fecha actual, total 0 inicial
INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura, activo) VALUES 
(GETDATE(), 1, 2, 0, 'A-24-07-0001', 1);

-- 13. VENTA_DETALLES para la venta anterior
-- Suponemos id_venta = 1
-- Detalle 1: producto 1, cantidad 2, precio 500.00
INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 2, 500.00, 1000.00),
(1, 2, 3, 25.00, 75.00);

-- Actualizar el total de la venta
UPDATE VENTAS SET total = (SELECT SUM(subtotal) FROM VENTA_DETALLES WHERE id_venta = 1) WHERE id_venta = 1;

-- Actualizar el stock de los productos vendidos (descontar manualmente, aunque el SP storedAltaVentaDetalle lo haría automáticamente)
-- Pero como hicimos inserción directa, ajustamos el stock manualmente para consistencia.
UPDATE PRODUCTOS SET stock_actual = stock_actual - 2 WHERE id_producto = 1;
UPDATE PRODUCTOS SET stock_actual = stock_actual - 3 WHERE id_producto = 2;

-- Nota: los stocks ya quedan actualizados según las ventas y compras.

GO
USE [master]
GO
ALTER DATABASE [COMERCIO_DB] SET  READ_WRITE 
GO


--COSAS AGREGADAS POR AGUS
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

USE [COMERCIO_DB]
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


USE [COMERCIO_DB]
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

USE [COMERCIO_DB]
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

EXEC storedGananciaEstimadaVentas
