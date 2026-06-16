USE COMERCIO_DB
GO

-- LISTAR VENTAS 
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

--- ALTA DE VENTA
CREATE OR ALTER PROCEDURE [dbo].[storedAltaVentaConUnDetalle]
    @fecha DATETIME,
    @id_cliente INT,
    @id_usuario INT,                 -- Nuevo parámetro: vendedor que registra la venta
    @DetallesJSON NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;

    BEGIN TRY
        -- 1. Parsear JSON a tabla temporal
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

        -- 2. Validar stock suficiente
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

        -- 3. Calcular total de la venta
        DECLARE @Total DECIMAL(18,2);
        SELECT @Total = SUM(cantidad * precio_unitario) FROM @Detalles;

        -- 4. Generar número de factura automático (formato A-YY-MM-NNNN)
        DECLARE @YY CHAR(2) = RIGHT(YEAR(@fecha), 2);
        DECLARE @MM CHAR(2) = RIGHT('0' + CAST(MONTH(@fecha) AS VARCHAR), 2);
        DECLARE @UltimoNumero INT;

        SELECT @UltimoNumero = MAX(CAST(RIGHT(numero_factura, 4) AS INT))
        FROM VENTAS
        WHERE numero_factura LIKE 'A-' + @YY + '-' + @MM + '-%';

        IF @UltimoNumero IS NULL SET @UltimoNumero = 0;

        DECLARE @NuevoNumero INT = @UltimoNumero + 1;
        DECLARE @NumeroFactura NVARCHAR(50) = 'A-' + @YY + '-' + @MM + '-' + RIGHT('0000' + CAST(@NuevoNumero AS VARCHAR), 4);

        -- 5. Insertar cabecera de la venta (incluyendo id_usuario)
        INSERT INTO VENTAS (fecha, id_cliente, id_usuario, total, numero_factura)
        VALUES (@fecha, @id_cliente, @id_usuario, @Total, @NumeroFactura);

        DECLARE @VentaId INT = SCOPE_IDENTITY();

        -- 6. Insertar detalles
        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        SELECT @VentaId, id_producto, cantidad, precio_unitario, cantidad * precio_unitario
        FROM @Detalles;

        -- 7. Descontar stock
        UPDATE p
        SET stock_actual = p.stock_actual - d.cantidad
        FROM PRODUCTOS p
        INNER JOIN @Detalles d ON p.id_producto = d.id_producto;

        COMMIT TRANSACTION;

        -- 8. Retornar ID y número de factura
        SELECT @VentaId AS Id, @NumeroFactura AS NumeroFactura;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO
-- MODIFICAR VENTA 


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
        -- 1. Obtener los detalles antiguos (antes de modificar)
        DECLARE @OldDetails TABLE (
            id_producto INT,
            cantidad INT
        );

        INSERT INTO @OldDetails (id_producto, cantidad)
        SELECT id_producto, cantidad
        FROM VENTA_DETALLES
        WHERE id_venta = @id_venta;

        -- 2. Revertir el stock de los productos antiguos
        UPDATE p
        SET stock_actual = p.stock_actual + od.cantidad
        FROM PRODUCTOS p
        INNER JOIN @OldDetails od ON p.id_producto = od.id_producto;

        -- 3. Parsear los nuevos detalles desde JSON
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

        -- 4. Validar stock suficiente para los nuevos productos
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

        -- 5. Calcular el nuevo total
        DECLARE @Total DECIMAL(18,2);
        SELECT @Total = SUM(cantidad * precio_unitario) FROM @NewDetails;

        -- 6. Actualizar la cabecera (NO se modifica el número de factura)
        UPDATE VENTAS
        SET fecha = @fecha,
            id_cliente = @id_cliente,
            id_usuario = @id_usuario,
            total = @Total
        WHERE id_venta = @id_venta;

        -- 7. Eliminar los detalles antiguos
        DELETE FROM VENTA_DETALLES WHERE id_venta = @id_venta;

        -- 8. Insertar los nuevos detalles
        INSERT INTO VENTA_DETALLES (id_venta, id_producto, cantidad, precio_unitario, subtotal)
        SELECT @id_venta, id_producto, cantidad, precio_unitario, cantidad * precio_unitario
        FROM @NewDetails;

        -- 9. Descontar el stock de los nuevos productos
        UPDATE p
        SET stock_actual = p.stock_actual - nd.cantidad
        FROM PRODUCTOS p
        INNER JOIN @NewDetails nd ON p.id_producto = nd.id_producto;

        COMMIT TRANSACTION;

        -- Retornar el ID de la venta modificada
        SELECT @id_venta AS Id;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO