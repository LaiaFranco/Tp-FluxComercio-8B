USE COMERCIO_DB
GO

DECLARE @idRolAdmin int
DECLARE @idRolVendedor int

DECLARE @idUsuarioAdmin int
DECLARE @idUsuarioVendedor int

DECLARE @idMarcaSamsung int
DECLARE @idMarcaApple int
DECLARE @idMarcaLogitech int

DECLARE @idCategoriaCelulares int
DECLARE @idCategoriaNotebooks int
DECLARE @idCategoriaAccesorios int

DECLARE @idProveedor1 int
DECLARE @idProveedor2 int

DECLARE @idProducto1 int
DECLARE @idProducto2 int
DECLARE @idProducto3 int
DECLARE @idProducto4 int

DECLARE @idCliente1 int
DECLARE @idCliente2 int

DECLARE @idCompra1 int
DECLARE @idVenta1 int

insert into ROLES (nombre)
values ('Administrador')

set @idRolAdmin = SCOPE_IDENTITY()

insert into ROLES (nombre)
values ('Vendedor')

set @idRolVendedor = SCOPE_IDENTITY()


insert into USUARIOS (nombre, email, password_hash, id_rol, activo)
values ('Admin Sistema', 'admin@comercio.com', '123456', @idRolAdmin, 1)

set @idUsuarioAdmin = SCOPE_IDENTITY()

insert into USUARIOS (nombre, email, password_hash, id_rol, activo)
values ('Juan Vendedor', 'juan@comercio.com', '123456', @idRolVendedor, 1)

set @idUsuarioVendedor = SCOPE_IDENTITY()


insert into MARCAS (nombre, descripcion, activo)
values ('Samsung', 'Marca de tecnologia y electronica', 1)

set @idMarcaSamsung = SCOPE_IDENTITY()

insert into MARCAS (nombre, descripcion, activo)
values ('Apple', 'Marca de celulares, notebooks y accesorios', 1)

set @idMarcaApple = SCOPE_IDENTITY()

insert into MARCAS (nombre, descripcion, activo)
values ('Logitech', 'Marca de accesorios para computacion', 1)

set @idMarcaLogitech = SCOPE_IDENTITY()


insert into CATEGORIAS (nombre, descripcion, activo)
values ('Celulares', 'Telefonos moviles y smartphones', 1)

set @idCategoriaCelulares = SCOPE_IDENTITY()

insert into CATEGORIAS (nombre, descripcion, activo)
values ('Notebooks', 'Computadoras portatiles', 1)

set @idCategoriaNotebooks = SCOPE_IDENTITY()

insert into CATEGORIAS (nombre, descripcion, activo)
values ('Accesorios', 'Perifericos y accesorios tecnologicos', 1)

set @idCategoriaAccesorios = SCOPE_IDENTITY()


insert into PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
values ('20-12345678-9', 'Tecnologia Mayorista SA', 'ventas@tecno-mayorista.com', '1122334455', 'Av. Siempre Viva 123', 1)

set @idProveedor1 = SCOPE_IDENTITY()

insert into PROVEEDORES (cuil, nombre, email, telefono, direccion, activo)
values ('27-87654321-4', 'Insumos Digitales SRL', 'contacto@insumosdigitales.com', '1166778899', 'San Martin 456', 1)

set @idProveedor2 = SCOPE_IDENTITY()


insert into PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo)
values ('Samsung Galaxy A55', 'Celular Samsung Galaxy A55 256GB', @idMarcaSamsung, @idCategoriaCelulares, 15, 3, 30.00, 1)

set @idProducto1 = SCOPE_IDENTITY()

insert into PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo)
values ('iPhone 15', 'Celular Apple iPhone 15 128GB', @idMarcaApple, @idCategoriaCelulares, 8, 2, 35.00, 1)

set @idProducto2 = SCOPE_IDENTITY()

insert into PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo)
values ('MacBook Air M2', 'Notebook Apple MacBook Air con chip M2', @idMarcaApple, @idCategoriaNotebooks, 5, 1, 28.00, 1)

set @idProducto3 = SCOPE_IDENTITY()

insert into PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, porcentaje_ganancia, activo)
values ('Mouse Logitech M280', 'Mouse inalambrico Logitech', @idMarcaLogitech, @idCategoriaAccesorios, 30, 5, 40.00, 1)

set @idProducto4 = SCOPE_IDENTITY()


insert into PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
values (@idProducto1, @idProveedor1)

insert into PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
values (@idProducto2, @idProveedor1)

insert into PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
values (@idProducto3, @idProveedor2)

insert into PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
values (@idProducto4, @idProveedor2)


insert into CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
values ('40111222', 'Lucia', 'Perez', 'lucia.perez@gmail.com', '1133445566', 'Belgrano 1200', 1)

set @idCliente1 = SCOPE_IDENTITY()

insert into CLIENTES (dni, nombre, apellido, email, telefono, direccion, activo)
values ('35999888', 'Martin', 'Gomez', 'martin.gomez@gmail.com', '1177889900', 'Rivadavia 2400', 1)

set @idCliente2 = SCOPE_IDENTITY()


insert into COMPRAS (id_proveedor, id_usuario, total)
values (@idProveedor1, @idUsuarioAdmin, 1650000.00)

set @idCompra1 = SCOPE_IDENTITY()

insert into COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
values (@idCompra1, @idProducto1, 5, 300000.00, 1500000.00)

insert into COMPRA_DETALLES (id_compra, id_producto, cantidad, precio_unitario, subtotal)
values (@idCompra1, @idProducto4, 10, 15000.00, 150000.00)


insert into VENTAS (id_cliente, id_usuario, total, numero_factura)
values (@idCliente1, @idUsuarioVendedor, 430000.00, 'A-0001-00000001')

set @idVenta1 = SCOPE_IDENTITY()

insert into VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
values (@idVenta1, @idProducto1, 1, 390000.00, 390000.00)

insert into VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
values (@idVenta1, @idProducto4, 1, 40000.00, 40000.00)


insert into IMAGENES (url, orden, activo, id_img_user, id_producto)
values ('https://example.com/img/samsung-galaxy-a55.jpg', 1, 1, @idUsuarioAdmin, @idProducto1)

insert into IMAGENES (url, orden, activo, id_img_user, id_producto)
values ('https://example.com/img/iphone-15.jpg', 1, 1, @idUsuarioVendedor, @idProducto2)
GO


SELECT * FROM MARCAS
SELECT * FROM CATEGORIAS
SELECT * FROM PRODUCTOS
SELECT * FROM PROVEEDORES
SELECT * FROM CLIENTES
SELECT * FROM COMPRAS
SELECT * FROM COMPRA_DETALLES
SELECT * FROM VENTAS
SELECT * FROM VENTA_DETALLES
SELECT * FROM USUARIOS
SELECT * FROM ROLES
SELECT * FROM IMAGENES