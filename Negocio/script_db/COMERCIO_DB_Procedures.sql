USE COMERCIO_DB
GO

create procedure [dbo].[storedListarMarcas] as
select id_marca, nombre, descripcion, activo
from MARCAS
GO

create procedure [dbo].[storedAltaMarca]
@nombre varchar(255),
@descripcion varchar(300),
@activo bit
as
insert into MARCAS (nombre, descripcion, activo)
values (@nombre, @descripcion, @activo)
GO

create procedure [dbo].[storedModificarMarca]
@id_marca int,
@nombre varchar(255),
@descripcion varchar(300),
@activo bit
as
update MARCAS set nombre = @nombre, descripcion = @descripcion, activo = @activo
where id_marca = @id_marca
GO


create procedure [dbo].[storedListarCategorias] as
select id_categoria, nombre, descripcion, activo
from CATEGORIAS
GO

create procedure [dbo].[storedAltaCategoria]
@nombre varchar(255),
@descripcion varchar(300),
@activo bit
as
insert into CATEGORIAS (nombre, descripcion, activo)
values (@nombre, @descripcion, @activo)
GO

create procedure [dbo].[storedModificarCategoria]
@id_categoria int,
@nombre varchar(255),
@descripcion varchar(300),
@activo bit
as
update CATEGORIAS set nombre = @nombre, descripcion = @descripcion, activo = @activo
where id_categoria = @id_categoria
GO


create procedure [dbo].[storedListarRoles] as
select id_rol, nombre
from ROLES
GO

create procedure [dbo].[storedAltaRol]
@nombre varchar(255)
as
insert into ROLES (nombre)
values (@nombre)
GO

create procedure [dbo].[storedModificarRol]
@id_rol int,
@nombre varchar(255)
as
update ROLES set nombre = @nombre
where id_rol = @id_rol
GO


create procedure [dbo].[storedListarUsuarios] as
select id_usuario, nombre, email, password_hash, id_rol, activo
from USUARIOS
GO

create procedure [dbo].[storedAltaUsuario]
@nombre varchar(255),
@email varchar(255),
@password_hash varchar(255),
@id_rol int,
@activo bit
as
insert into USUARIOS (nombre, email, password_hash, id_rol, activo)
values (@nombre, @email, @password_hash, @id_rol, @activo)
GO

create procedure [dbo].[storedModificarUsuario]
@id_usuario int,
@nombre varchar(255),
@email varchar(255),
@password_hash varchar(255),
@id_rol int,
@activo bit
as
update USUARIOS set nombre = @nombre, email = @email, password_hash = @password_hash, id_rol = @id_rol, activo = @activo
where id_usuario = @id_usuario
GO


create procedure [dbo].[storedListarProductos] as
select id_producto, nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo
from PRODUCTOS
GO

create procedure [dbo].[storedAltaProducto]
@nombre varchar(255),
@descripcion varchar(300),
@id_marca int,
@id_categoria int,
@stock_actual int,
@stock_minimo int,
@porcentaje_ganancia decimal(5,2),
@activo bit
as
insert into PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo)
values (@nombre, @descripcion, @id_marca, @id_categoria, @stock_actual, @stock_minimo, @porcentaje_ganancia, @activo)
GO

create procedure [dbo].[storedModificarProducto]
@id_producto int,
@nombre varchar(255),
@descripcion varchar(300),
@id_marca int,
@id_categoria int,
@stock_actual int,
@stock_minimo int,
@porcentaje_ganancia decimal(5,2),
@activo bit
as
update PRODUCTOS set nombre = @nombre, descripcion = @descripcion, id_marca = @id_marca, id_categoria = @id_categoria,
stock_actual = @stock_actual, stock_minimo = @stock_minimo, porcentaje_ganancia = @porcentaje_ganancia, activo = @activo
where id_producto = @id_producto
GO


create procedure [dbo].[storedListarProveedores] as
select id_proveedor, cuil, nombre, email, telefono, direccion, activo
from PROVEEDORES
GO

create procedure [dbo].[storedAltaProveedor]
@cuil varchar(20),
@nombre varchar(255),
@email varchar(255),
@telefono varchar(255),
@direccion varchar(255),
@activo bit
as
insert into PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
values (@cuil, @nombre, @email, @telefono, @direccion, @activo)
GO

create procedure [dbo].[storedModificarProveedor]
@id_proveedor int,
@cuil varchar(20),
@nombre varchar(255),
@email varchar(255),
@telefono varchar(255),
@direccion varchar(255),
@activo bit
as
update PROVEEDORES set cuil = @cuil, nombre = @nombre, email = @email, telefono = @telefono, direccion = @direccion, activo = @activo
where id_proveedor = @id_proveedor
GO


create procedure [dbo].[storedListarProductoProveedor] as
select id_producto, id_proveedor
from PRODUCTO_PROVEEDOR
GO

create procedure [dbo].[storedAltaProductoProveedor]
@id_producto int,
@id_proveedor int
as
insert into PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
values (@id_producto, @id_proveedor)
GO

create procedure [dbo].[storedModificarProductoProveedor]
@id_producto_anterior int,
@id_proveedor_anterior int,
@id_producto int,
@id_proveedor int
as
update PRODUCTO_PROVEEDOR set id_producto = @id_producto, id_proveedor = @id_proveedor
where id_producto = @id_producto_anterior and id_proveedor = @id_proveedor_anterior
GO


create procedure [dbo].[storedListarCompras] as
select id_compra, fecha, id_proveedor, id_usuario, total
from COMPRAS
GO

create procedure [dbo].[storedAltaCompra]
@id_proveedor int,
@id_usuario int,
@total decimal(10,2)
as
insert into COMPRAS (id_proveedor, id_usuario, total)
values (@id_proveedor, @id_usuario, @total)
GO

create procedure [dbo].[storedModificarCompra]
@id_compra int,
@fecha datetime,
@id_proveedor int,
@id_usuario int,
@total decimal(10,2)
as
update COMPRAS set fecha = @fecha, id_proveedor = @id_proveedor, id_usuario = @id_usuario, total = @total
where id_compra = @id_compra
GO


create procedure [dbo].[storedListarCompraDetalles] as
select id_detalle, id_compra, id_producto, cantidad, precio_unitario, subtotal
from COMPRA_DETALLES
GO

create procedure [dbo].[storedAltaCompraDetalle]
@id_compra int,
@id_producto int,
@cantidad int,
@precio_unitario decimal(10,2),
@subtotal decimal(10,2)
as
insert into COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
values (@id_compra, @id_producto, @cantidad, @precio_unitario, @subtotal)
GO

create procedure [dbo].[storedModificarCompraDetalle]
@id_detalle int,
@id_compra int,
@id_producto int,
@cantidad int,
@precio_unitario decimal(10,2),
@subtotal decimal(10,2)
as
update COMPRA_DETALLES set id_compra = @id_compra, id_producto = @id_producto, cantidad = @cantidad,
precio_unitario = @precio_unitario, subtotal = @subtotal
where id_detalle = @id_detalle
GO


create procedure [dbo].[storedListarClientes] as
select id_cliente, dni, nombre, apellido, email, telefono, direccion, activo
from CLIENTES
GO

create procedure [dbo].[storedAltaCliente]
@dni varchar(20),
@nombre varchar(255),
@apellido varchar(255),
@email varchar(255),
@telefono varchar(255),
@direccion varchar(255),
@activo bit
as
insert into CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
values (@dni, @nombre, @apellido, @email, @telefono, @direccion, @activo)
GO

create procedure [dbo].[storedModificarCliente]
@id_cliente int,
@dni varchar(20),
@nombre varchar(255),
@apellido varchar(255),
@email varchar(255),
@telefono varchar(255),
@direccion varchar(255),
@activo bit
as
update CLIENTES set dni = @dni, nombre = @nombre, apellido = @apellido, email = @email,
telefono = @telefono, direccion = @direccion, activo = @activo
where id_cliente = @id_cliente
GO


create procedure [dbo].[storedListarVentas] as
select id_venta, fecha, id_cliente, id_usuario, total, numero_factura
from VENTAS
GO

create procedure [dbo].[storedAltaVenta]
@id_cliente int,
@id_usuario int,
@total decimal(10,2),
@numero_factura varchar(255)
as
insert into VENTAS (id_cliente, id_usuario, total, numero_factura)
values (@id_cliente, @id_usuario, @total, @numero_factura)
GO

create procedure [dbo].[storedModificarVenta]
@id_venta int,
@fecha datetime,
@id_cliente int,
@id_usuario int,
@total decimal(10,2),
@numero_factura varchar(255)
as
update VENTAS set fecha = @fecha, id_cliente = @id_cliente, id_usuario = @id_usuario,
total = @total, numero_factura = @numero_factura
where id_venta = @id_venta
GO


create procedure [dbo].[storedListarVentaDetalles] as
select id_detalle, id_venta, id_producto, cantidad, precio_unitario, subtotal
from VENTA_DETALLES
GO

create procedure [dbo].[storedAltaVentaDetalle]
@id_venta int,
@id_producto int,
@cantidad int,
@precio_unitario decimal(10,2),
@subtotal decimal(10,2)
as
insert into VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
values (@id_venta, @id_producto, @cantidad, @precio_unitario, @subtotal)
GO

create procedure [dbo].[storedModificarVentaDetalle]
@id_detalle int,
@id_venta int,
@id_producto int,
@cantidad int,
@precio_unitario decimal(10,2),
@subtotal decimal(10,2)
as
update VENTA_DETALLES set id_venta = @id_venta, id_producto = @id_producto, cantidad = @cantidad,
precio_unitario = @precio_unitario, subtotal = @subtotal
where id_detalle = @id_detalle
GO


create procedure [dbo].[storedListarImagenes] as
select id_imagen, url, orden, activo, id_img_user, id_producto
from IMAGENES
GO

create procedure [dbo].[storedAltaImagen]
@url varchar(255),
@orden int,
@activo bit,
@id_img_user int,
@id_producto int
as
insert into IMAGENES (url, orden, activo, id_img_user, id_producto)
values (@url, @orden, @activo, @id_img_user, @id_producto)
GO

create procedure [dbo].[storedModificarImagen]
@id_imagen int,
@url varchar(255),
@orden int,
@activo bit,
@id_img_user int,
@id_producto int
as
update IMAGENES set url = @url, orden = @orden, activo = @activo, id_img_user = @id_img_user, id_producto = @id_producto
where id_imagen = @id_imagen
GO



EXEC storedListarMarcas
EXEC storedListarCategorias
EXEC storedListarProductos
EXEC storedListarClientes
EXEC storedListarVentas

EXEC storedListarCompras
EXEC storedListarProveedores