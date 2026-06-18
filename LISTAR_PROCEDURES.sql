

USE COMERCIO_DB
GO

EXEC storedListarMarcas
	EXEC storedListarCategorias
	EXEC storedListarProductos
	EXEC storedListarClientes
	EXEC storedListarVentas
EXEC storedListarProveedores;
EXEC storedListarCompras;