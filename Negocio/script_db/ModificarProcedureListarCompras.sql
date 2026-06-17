USE COMERCIO_DB
GO

ALTER PROCEDURE storedListarCompras
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
INNER JOIN ROLES R ON R.id_rol = U.id_rol
GO

CREATE PROCEDURE storedEliminarProveedor
@id_proveedor int
AS
UPDATE PROVEEDORES
SET activo = 0
WHERE id_proveedor = @id_proveedor
GO


ALTER PROCEDURE storedListarProveedores
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE activo = 1
GO

CREATE PROCEDURE storedListarProveedorPorId
@id_proveedor int
AS
SELECT id_proveedor, cuil, nombre, email, telefono, direccion, activo
FROM PROVEEDORES
WHERE id_proveedor = @id_proveedor
GO

--SELECT * FROM PROVEEDORES