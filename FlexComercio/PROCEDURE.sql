use FLUXCOMMERCE 
Go

CREATE PROCEDURE storedVentas
    @Id_Cliente INT,
    @Id_Usuario INT,
    @Total DECIMAL(1,1) = 0  
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el cliente exista
    IF NOT EXISTS (SELECT 1 FROM Cliente WHERE Id_Cliente = @Id_Cliente)
    BEGIN
        RAISERROR('El cliente con ID %d no existe.', 16, 1, @Id_Cliente);
        RETURN;
    END

    -- Validar que el usuario exista
    IF NOT EXISTS (SELECT 1 FROM Usuario WHERE Id_Usuario = @Id_Usuario)
    BEGIN
        RAISERROR('El usuario con ID %d no existe.', 16, 1, @Id_Usuario);
        RETURN;
    END

    -- Validar que el total no exceda el rango de DECIMAL(1,1)
    IF @Total < -9.9 OR @Total > 9.9
    BEGIN
        RAISERROR('El total debe estar entre -9.9 y 9.9 (DECIMAL(1,1)).', 16, 1);
        RETURN;
    END

    -- Insertar la venta (Fecha usa DEFAULT, Numero_Factura e Id_venta son identity)
    INSERT INTO Venta (Id_Cliente, Id_Usuario, Total)
    VALUES (@Id_Cliente, @Id_Usuario, @Total);

    -- Retornar el ID de venta generado y el número de factura
    SELECT 
        Id_venta, 
        Numero_Factura 
    FROM Venta 
    WHERE Id_venta = SCOPE_IDENTITY();
END
GO

-- Actualizar
CREATE PROCEDURE storedActualizarVenta
    @idVenta INT,
    @idCliente INT = NULL,
    @idUsuario INT = NULL,
    @total DECIMAL(1,1) = NULL,
    @activo BIT = NULL
AS
BEGIN
    UPDATE Venta SET
        Id_Cliente = ISNULL(@idCliente, Id_Cliente),
        Id_Usuario = ISNULL(@idUsuario, Id_Usuario),
        Total = ISNULL(@total, Total),
        Activo = ISNULL(@activo, Activo)
    WHERE Id_venta = @idVenta;
END

--Actualizar