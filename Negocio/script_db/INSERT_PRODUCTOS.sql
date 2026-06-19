USE [COMERCIO_DB]
GO

DECLARE @idProducto int;
DECLARE @idProveedor int;

-- Producto 1
SET @idProveedor = 1;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Mouse Logitech M90', 'Mouse optico USB para uso diario', 1, 1, @idProveedor, 25, 5, 8.50, 30.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 2
SET @idProveedor = 2;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Teclado Redragon Kumara', 'Teclado mecanico compacto con cable USB', 1, 1, @idProveedor, 15, 3, 45.99, 35.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 3
SET @idProveedor = 1;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Auriculares HyperX Cloud Stinger', 'Auriculares gamer con microfono', 1, 1, @idProveedor, 12, 4, 59.90, 32.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 4
SET @idProveedor = 2;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Monitor Samsung 24 pulgadas', 'Monitor LED Full HD 24 pulgadas', 1, 1, @idProveedor, 8, 2, 189.99, 28.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 5
SET @idProveedor = 1;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Disco SSD Kingston 480GB', 'Unidad de estado solido SATA 480GB', 1, 1, @idProveedor, 20, 5, 42.75, 30.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 6
SET @idProveedor = 2;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Memoria RAM Kingston 8GB DDR4', 'Modulo de memoria RAM DDR4 8GB 2666MHz', 1, 1, @idProveedor, 30, 6, 24.99, 40.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 7
SET @idProveedor = 1;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Webcam Logitech C270', 'Camara web HD 720p con microfono integrado', 1, 1, @idProveedor, 10, 2, 29.50, 35.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 8
SET @idProveedor = 2;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Router TP-Link Archer C6', 'Router WiFi doble banda AC1200', 1, 1, @idProveedor, 14, 3, 54.25, 30.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 9
SET @idProveedor = 1;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Parlantes Genius SP-HF180', 'Parlantes estereo USB compactos', 1, 1, @idProveedor, 18, 4, 16.80, 38.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);


-- Producto 10
SET @idProveedor = 2;

INSERT INTO PRODUCTOS
(nombre, descripcion, id_marca, id_categoria, id_proveedor, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES
('Notebook Lenovo IdeaPad 3', 'Notebook 15 pulgadas con procesador Ryzen y SSD', 1, 1, @idProveedor, 5, 1, 899.99, 25.00, 1);

SET @idProducto = SCOPE_IDENTITY();

INSERT INTO PRODUCTO_PROVEEDOR (id_producto, id_proveedor)
VALUES (@idProducto, @idProveedor);
GO