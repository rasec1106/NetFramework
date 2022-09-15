use DB_POO2
GO

CREATE TABLE [dbo].[CATEGORIA](
	idCategoria [int] IDENTITY(1,1) NOT NULL,
	nombreCategoria varchar(150) NOT NULL,
	activo bit NOT NULL,
	eliminado BIT NOT NULL,
	usuarioRegistro VARCHAR(20) NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	usuarioModificacion VARCHAR(20) NULL,
	fechaModificacion DATETIME NULL,
	usuarioEliminacion VARCHAR(20) NULL,
	fechaEliminacion DATETIME NULL
CONSTRAINT [CATEGORIA_pk] PRIMARY KEY CLUSTERED
(
	idCategoria ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CATEGORIA] ADD CONSTRAINT [DF_CATEGORIA_activo] DEFAULT ((1)) FOR [activo]
GO

ALTER TABLE [dbo].[CATEGORIA] ADD CONSTRAINT [DF_CATEGORIA_eliminado] DEFAULT ((0)) FOR [eliminado]
GO

CREATE TABLE [dbo].PRODUCTO(
	idProducto [int] IDENTITY(1,1) NOT NULL,
	idCategoria int not null,
	nombreProducto varchar(150) NOT NULL,
	precioUnitario DECIMAL(18,2) NOT NULL,
	stock INT NOT NULL,
	activo bit NOT NULL,
	eliminado BIT NOT NULL,
	usuarioRegistro VARCHAR(20) NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	usuarioModificacion VARCHAR(20) NULL,
	fechaModificacion DATETIME NULL,
	usuarioEliminacion VARCHAR(20) NULL,
	fechaEliminacion DATETIME NULL
CONSTRAINT [PRODUCTO_pk] PRIMARY KEY CLUSTERED
(
	idProducto ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].PRODUCTO ADD CONSTRAINT [DF_PRODUCTO_activo] DEFAULT ((1)) FOR [activo]
GO

ALTER TABLE [dbo].PRODUCTO ADD CONSTRAINT [DF_PRODUCTO_eliminado] DEFAULT ((0)) FOR [eliminado]
GO

ALTER TABLE [dbo].PRODUCTO WITH CHECK ADD CONSTRAINT [PRODUCTO_CATEGORIA] FOREIGN KEY(idCategoria)
REFERENCES [dbo].CATEGORIA (idCategoria)
GO

ALTER TABLE [dbo].PRODUCTO CHECK CONSTRAINT [PRODUCTO_CATEGORIA]
GO

INSERT INTO CATEGORIA(nombreCategoria, activo, eliminado, usuarioRegistro, fechaRegistro)
values
	('BEBIDAS', 1, 0, 'FPERALTA', GETDATE()),
	('CONDIMENTOS', 1, 0, 'FPERALTA', GETDATE()),
	('FRUTAS/VERDURAS', 1, 0, 'FPERALTA', GETDATE()),
	('LACTEOS', 1, 0, 'FPERALTA', GETDATE())
GO

INSERT INTO PRODUCTO(idCategoria, nombreProducto, precioUnitario, stock, activo, eliminado, usuarioRegistro, fechaRegistro)
VALUES
	(1, 'TE', 18, 39, 1, 0, 'FPERALTA', GETDATE()),
	(1, 'CERVEZA', 19, 17, 1, 0, 'FPERALTA', GETDATE()),
	(2, 'SIROPE DE REGALIZ', 10, 13, 1, 0, 'FPERALTA', GETDATE()),
	(2, 'CAJUN', 22, 53, 1, 0, 'FPERALTA', GETDATE()),
	(2, 'MEZCLA GUMBO', 21, 12, 1, 0, 'FPERALTA', GETDATE()),
	(3, 'MANZANA', 30, 15, 1, 0, 'FPERALTA', GETDATE()),
	(4, 'QUESO', 22, 30, 1, 0, 'FPERALTA', GETDATE()),
	(4, 'YOGURT', 38, 16, 1, 0, 'FPERALTA', GETDATE())
GO

CREATE OR ALTER PROCEDURE sp_GetProductos
AS
BEGIN
	SELECT 
		P.idProducto, P.nombreProducto, C.nombreCategoria, P.precioUnitario, P.stock
	FROM PRODUCTO P
	INNER JOIN CATEGORIA C ON C.idCategoria = P.idCategoria 
END
GO