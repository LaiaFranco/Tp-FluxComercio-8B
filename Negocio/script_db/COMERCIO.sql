CREATE DATABASE COMERCIO_DB
GO

USE COMERCIO_DB
GO

CREATE TABLE [dbo].[MARCAS](
    [id_marca] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_MARCAS_activo] DEFAULT (1),
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED
(
    [id_marca] ASC
)
)
GO

CREATE TABLE [dbo].[CATEGORIAS](
    [id_categoria] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_CATEGORIAS_activo] DEFAULT (1),
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED
(
    [id_categoria] ASC
)
)
GO

CREATE TABLE [dbo].[ROLES](
    [id_rol] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED
(
    [id_rol] ASC
),
 CONSTRAINT [UQ_ROLES_nombre] UNIQUE ([nombre])
)
GO

CREATE TABLE [dbo].[USUARIOS](
    [id_usuario] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [email] [varchar](255) NOT NULL,
    [password_hash] [varchar](255) NOT NULL,
    [id_rol] [int] NOT NULL,
    [activo] [bit] NULL CONSTRAINT [DF_USUARIOS_activo] DEFAULT (1),
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED
(
    [id_usuario] ASC
),
 CONSTRAINT [UQ_USUARIOS_email] UNIQUE ([email])
)
GO

CREATE TABLE [dbo].[PRODUCTOS](
    [id_producto] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [descripcion] [varchar](300) NULL,
    [id_marca] [int] NOT NULL,
    [id_categoria] [int] NOT NULL,
    [stock_actual] [int] NOT NULL CONSTRAINT [DF_PRODUCTOS_stock_actual] DEFAULT (0),
    [stock_minimo] [int] NOT NULL CONSTRAINT [DF_PRODUCTOS_stock_minimo] DEFAULT (0),
    [porcentaje_ganancia] [decimal](5,2) NOT NULL,
    [activo] [bit] NULL CONSTRAINT [DF_PRODUCTOS_activo] DEFAULT (1),
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED
(
    [id_producto] ASC
)
)
GO

CREATE TABLE [dbo].[PROVEEDORES](
    [id_proveedor] [int] IDENTITY(1,1) NOT NULL,
    [cuil] [varchar](20) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [email] [varchar](255) NULL,
    [telefono] [varchar](255) NULL,
    [direccion] [varchar](255) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_PROVEEDORES_activo] DEFAULT (1),
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED
(
    [id_proveedor] ASC
),
 CONSTRAINT [UQ_PROVEEDORES_cuil] UNIQUE ([cuil])
)
GO

CREATE TABLE [dbo].[PRODUCTO_PROVEEDOR](
    [id_producto] [int] NOT NULL,
    [id_proveedor] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTO_PROVEEDOR] PRIMARY KEY CLUSTERED
(
    [id_producto] ASC,
    [id_proveedor] ASC
)
)
GO

CREATE TABLE [dbo].[COMPRAS](
    [id_compra] [int] IDENTITY(1,1) NOT NULL,
    [fecha] [datetime] NOT NULL CONSTRAINT [DF_COMPRAS_fecha] DEFAULT (GETDATE()),
    [id_proveedor] [int] NOT NULL,
    [id_usuario] [int] NOT NULL,
    [total] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_COMPRAS] PRIMARY KEY CLUSTERED
(
    [id_compra] ASC
)
)
GO

CREATE TABLE [dbo].[COMPRA_DETALLES](
    [id_detalle] [int] IDENTITY(1,1) NOT NULL,
    [id_compra] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
    [cantidad] [int] NOT NULL,
    [precio_unitario] [decimal](10,2) NOT NULL,
    [subtotal] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_COMPRA_DETALLES] PRIMARY KEY CLUSTERED
(
    [id_detalle] ASC
)
)
GO

CREATE TABLE [dbo].[CLIENTES](
    [id_cliente] [int] IDENTITY(1,1) NOT NULL,
    [dni] [varchar](20) NOT NULL,
    [nombre] [varchar](255) NOT NULL,
    [apellido] [varchar](255) NULL,
    [email] [varchar](255) NULL,
    [telefono] [varchar](255) NULL,
    [direccion] [varchar](255) NULL,
    [activo] [bit] NULL CONSTRAINT [DF_CLIENTES_activo] DEFAULT (1),
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED
(
    [id_cliente] ASC
),
 CONSTRAINT [UQ_CLIENTES_dni] UNIQUE ([dni])
)
GO

CREATE TABLE [dbo].[VENTAS](
    [id_venta] [int] IDENTITY(1,1) NOT NULL,
    [fecha] [datetime] NOT NULL CONSTRAINT [DF_VENTAS_fecha] DEFAULT (GETDATE()),
    [id_cliente] [int] NOT NULL,
    [id_usuario] [int] NOT NULL,
    [total] [decimal](10,2) NOT NULL,
    [numero_factura] [varchar](255) NOT NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED
(
    [id_venta] ASC
),
 CONSTRAINT [UQ_VENTAS_numero_factura] UNIQUE ([numero_factura])
)
GO

CREATE TABLE [dbo].[VENTA_DETALLES](
    [id_detalle] [int] IDENTITY(1,1) NOT NULL,
    [id_venta] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
    [cantidad] [int] NOT NULL,
    [precio_unitario] [decimal](10,2) NOT NULL,
    [subtotal] [decimal](10,2) NOT NULL,
 CONSTRAINT [PK_VENTA_DETALLES] PRIMARY KEY CLUSTERED
(
    [id_detalle] ASC
)
)
GO

CREATE TABLE [dbo].[IMAGENES](
    [id_imagen] [int] IDENTITY(1,1) NOT NULL,
    [url] [varchar](255) NOT NULL,
    [orden] [int] NULL CONSTRAINT [DF_IMAGENES_orden] DEFAULT (0),
    [activo] [bit] NULL CONSTRAINT [DF_IMAGENES_activo] DEFAULT (1),
    [id_img_user] [int] NOT NULL,
    [id_producto] [int] NOT NULL,
 CONSTRAINT [PK_IMAGENES] PRIMARY KEY CLUSTERED
(
    [id_imagen] ASC
),
 CONSTRAINT [UQ_IMAGENES_id_img_user] UNIQUE ([id_img_user])
)
GO

ALTER TABLE [dbo].[USUARIOS] WITH CHECK ADD CONSTRAINT [FK_USUARIOS_ROLES] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_rol])
GO

ALTER TABLE [dbo].[PRODUCTOS] WITH CHECK ADD CONSTRAINT [FK_PRODUCTOS_MARCAS] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCAS] ([id_marca])
GO

ALTER TABLE [dbo].[PRODUCTOS] WITH CHECK ADD CONSTRAINT [FK_PRODUCTOS_CATEGORIAS] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[CATEGORIAS] ([id_categoria])
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

ALTER TABLE [dbo].[IMAGENES] WITH CHECK ADD CONSTRAINT [FK_IMAGENES_USUARIOS] FOREIGN KEY([id_img_user])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO

ALTER TABLE [dbo].[IMAGENES] WITH CHECK ADD CONSTRAINT [FK_IMAGENES_PRODUCTOS] FOREIGN KEY([id_producto])
REFERENCES [dbo].[PRODUCTOS] ([id_producto])
GO