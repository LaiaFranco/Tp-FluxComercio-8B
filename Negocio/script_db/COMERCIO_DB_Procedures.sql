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

-- ========== PRODUCTOS ==========
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

        -- Marca
        M.id_marca,
        M.nombre AS nombre_marca,

        -- Categoría
        C.id_categoria,
        C.nombre AS nombre_categoria,

        -- Proveedor
        PR.id_proveedor,
        PR.nombre AS nombre_proveedor,
        PR.cuil,

        -- Imagen
        I.id_imagen,
        I.url AS url_imagen

    FROM PRODUCTOS P

        INNER JOIN MARCAS M
            ON P.id_marca = M.id_marca

        INNER JOIN CATEGORIAS C
            ON P.id_categoria = C.id_categoria

        INNER JOIN PROVEEDORES PR
            ON P.id_proveedor = PR.id_proveedor

        LEFT JOIN IMAGENES I
            ON I.id_entidad = P.id_producto
           AND I.tipo_entidad = 'PRODUCTO'
           AND I.activo = 1;

END
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaProducto]
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
INSERT INTO PRODUCTOS (nombre, descripcion, id_marca, id_categoria, stock_actual, stock_minimo, precio, porcentaje_ganancia, activo)
VALUES (@nombre, @descripcion, @id_marca, @id_categoria, @stock_actual, @stock_minimo, @precio, @porcentaje_ganancia, @activo);
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
WHERE activo = 1;   -- solo activos por defecto
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

-- ========== VENTAS ==========
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

CREATE OR ALTER PROCEDURE [dbo].[storedAltaVenta]
    @id_cliente INT,
    @id_usuario INT,
    @total DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @anio INT = YEAR(GETDATE());
    DECLARE @nuevo_numero INT;
    DECLARE @numero_factura VARCHAR(255);
    DECLARE @id_venta INT;

    -- Obtener el último número usado para el año actual (si existe)
    -- Se extrae la parte numérica del último número de factura del año
    SELECT @nuevo_numero = MAX(CAST(SUBSTRING(numero_factura, 7, 8) AS INT)) + 1
    FROM VENTAS
    WHERE numero_factura LIKE 'A-' + RIGHT('0000' + CAST(@anio AS VARCHAR(4)), 4) + '-%';

    -- Si no hay facturas para el año, empezamos en 1
    IF @nuevo_numero IS NULL
        SET @nuevo_numero = 1;

    -- Construir el número de factura
    SET @numero_factura = 'A-' 
                        + RIGHT('0000' + CAST(@anio AS VARCHAR(4)), 4) 
                        + '-' 
                        + RIGHT('00000000' + CAST(@nuevo_numero AS VARCHAR(8)), 8);

    -- Insertar la venta
    INSERT INTO VENTAS (id_cliente, id_usuario, total, numero_factura)
    VALUES (@id_cliente, @id_usuario, @total, @numero_factura);

    -- Obtener el ID generado
    SET @id_venta = SCOPE_IDENTITY();

    -- Retornar el ID
    SELECT @id_venta AS IdVenta;
END
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarVenta]
    @id_venta INT,
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT,
    @total DECIMAL(10,2),
    @numero_factura VARCHAR(255)
AS
UPDATE VENTAS 
SET fecha = @fecha, id_cliente = @id_cliente, id_usuario = @id_usuario,
    total = @total, numero_factura = @numero_factura
WHERE id_venta = @id_venta;
GO

-- ========== VENTA_DETALLES ==========
CREATE OR ALTER PROCEDURE [dbo].[storedListarVentaDetalles]
AS
SELECT id_detalle, id_venta, id_producto, cantidad, precio_unitario, subtotal
FROM VENTA_DETALLES;
GO

CREATE OR ALTER PROCEDURE [dbo].[storedAltaVentaDetalle]
    @id_venta INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2),
    @subtotal DECIMAL(10,2)
AS
INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
VALUES (@id_venta, @id_producto, @cantidad, @precio_unitario, @subtotal);
GO

CREATE OR ALTER PROCEDURE [dbo].[storedModificarVentaDetalle]
    @id_detalle INT,
    @id_venta INT,
    @id_producto INT,
    @cantidad INT,
    @precio_unitario DECIMAL(10,2),
    @subtotal DECIMAL(10,2)
AS
UPDATE VENTA_DETALLES 
SET id_venta = @id_venta, id_producto = @id_producto, cantidad = @cantidad,
    precio_unitario = @precio_unitario, subtotal = @subtotal
WHERE id_detalle = @id_detalle;
GO

-- ========== IMAGENES (corregido según la tabla real) ==========
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