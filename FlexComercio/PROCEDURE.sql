USE FLUXCOMMERCE;
GO

CREATE OR ALTER PROCEDURE storedVentas
    @Id_Cliente INT,
    @Id_Usuario INT,
    @Total DECIMAL(10,2) = 0
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Usuario WHERE Id_Usuario = @Id_Usuario)
    BEGIN
        RAISERROR('El usuario con ID %d no existe.', 16, 1, @Id_Usuario);
        RETURN;
    END

    IF @Total < -99999999.99 OR @Total > 99999999.99
    BEGIN
        RAISERROR('El total está fuera del rango permitido para DECIMAL(10,2).', 16, 1);
        RETURN;
    END

    INSERT INTO Venta (Id_Cliente, Id_Usuario, Total)
    VALUES (@Id_Cliente, @Id_Usuario, @Total);

    SELECT 
        Id_venta, 
        Fecha,
        Numero_Factura,
        Total
    FROM Venta 
    WHERE Id_venta = SCOPE_IDENTITY();
END
GO

USE FLUXCOMMERCE;
GO

CREATE OR ALTER PROCEDURE storedActualizarVenta
    @idVenta INT,
    @idCliente INT = NULL,
    @idUsuario INT = NULL,
    @total DECIMAL(10,2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Venta WHERE Id_venta = @idVenta)
    BEGIN
        RAISERROR('La venta con ID %d no existe.', 16, 1, @idVenta);
        RETURN;
    END

    IF @idUsuario IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Usuario WHERE Id_Usuario = @idUsuario)
    BEGIN
        RAISERROR('El usuario con ID %d no existe.', 16, 1, @idUsuario);
        RETURN;
    END

    UPDATE Venta SET
        Id_Cliente = ISNULL(@idCliente, Id_Cliente),
        Id_Usuario = ISNULL(@idUsuario, Id_Usuario),
        Total = ISNULL(@total, Total)
    WHERE Id_venta = @idVenta;

    SELECT 
        Id_venta, 
        Fecha, 
        Id_Cliente, 
        Id_Usuario, 
        Total, 
        Numero_Factura
    FROM Venta 
    WHERE Id_venta = @idVenta;
END
GO

USE FLUXCOMMERCE;
GO

CREATE OR ALTER PROCEDURE storedListarVentas
AS
BEGIN
    SELECT 
        V.Id_venta,
        V.Fecha,
        V.Id_Cliente,
        V.Id_Usuario,
        V.Total,
        V.Numero_Factura,
        U.Nombre AS UsuarioNombre,
        U.Dni AS UsuarioDni,
        U.Activo AS UsuarioActivo,
        C.Nombre AS ClienteNombre,
        C.Apellido AS ClienteApellido,
        C.Dni AS ClienteDni,
        C.Email AS ClienteEmail,
        C.Telefono AS ClienteTelefono
    FROM Venta V
    INNER JOIN Usuario U ON V.Id_Usuario = U.Id_usuario
    INNER JOIN Cliente C ON V.Id_Cliente = C.Id_cliente
    ORDER BY V.Fecha DESC;
END
GO

--v1