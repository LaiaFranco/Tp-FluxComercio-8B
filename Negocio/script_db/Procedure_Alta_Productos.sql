USE [COMERCIO_DB]
GO

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

ALTER TABLE PRODUCTOS
ALTER COLUMN precio decimal(10,2) NOT NULL
GO