use Laboratorio1
GO

CREATE OR ALTER PROCEDURE [dbo].sp_GetCategoriasProducto
AS
BEGIN
	SELECT idCategoria, nombreCategoria
	FROM CATEGORIA
END
GO

CREATE OR ALTER PROCEDURE [dbo].sp_GetProductosByCategoria
	@prmintIdCategoria INT
AS
BEGIN
	SELECT P.idProducto, P.nombreProducto, P.precioUnitario, P.stock, P.idCategoria, C.nombreCategoria
	FROM PRODUCTO P
	INNER JOIN CATEGORIA C ON C.idCategoria = P.idCategoria	
	WHERE (P.idCategoria = @prmintIdCategoria OR @prmintIdCategoria = 0)
END
GO

CREATE OR ALTER PROCEDURE [dbo].sp_InsertProducto
	@prmstrNombre VARCHAR(150),
	@prmdecPrecioUnitario DECIMAL(18,2),
	@prmintStock int,
	@prmintIdCategoria INT
AS
BEGIN
	INSERT INTO PRODUCTO (nombreProducto, precioUnitario, stock, idCategoria, activo, eliminado, usuarioRegistro, fechaRegistro)
	VALUES(@prmstrNombre, @prmdecPrecioUnitario, @prmintStock, @prmintIdCategoria, 1, 0, 'fperalta', GETDATE())
END
GO

CREATE OR ALTER PROCEDURE [dbo].sp_UpdateProducto
	@prmintIdProducto INT,
	@prmstrNombre VARCHAR(150),
	@prmdecPrecioUnitario DECIMAL(18,2),
	@prmintStock int,
	@prmintIdCategoria INT
AS
BEGIN
	UPDATE PRODUCTO
	SET
		nombreProducto = @prmstrNombre,
		precioUnitario = @prmdecPrecioUnitario,
		stock = @prmintStock,
		idCategoria = @prmintIdCategoria
	WHERE idProducto = @prmintIdProducto
END
GO