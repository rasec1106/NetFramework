use DB_POO2
GO

CREATE TABLE [dbo].[PAIS](
	idPais [int] IDENTITY(1,1) NOT NULL,
	nombre varchar(150) NOT NULL,
	activo bit NOT NULL,
	eliminado BIT NOT NULL,
	usuarioRegistro VARCHAR(20) NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	usuarioModificacion VARCHAR(20) NULL,
	fechaModificacion DATETIME NULL,
	usuarioEliminacion VARCHAR(20) NULL,
	fechaEliminacion DATETIME NULL
CONSTRAINT [PAIS_pk] PRIMARY KEY CLUSTERED
(
	idPais ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PAIS] ADD CONSTRAINT [DF_PAIS_activo] DEFAULT ((1)) FOR [activo]
GO

ALTER TABLE [dbo].[PAIS] ADD CONSTRAINT [DF_PAIS_eliminado] DEFAULT ((0)) FOR [eliminado]
GO

INSERT INTO PAIS (nombre, activo, eliminado, usuarioRegistro, fechaRegistro)
values
('PERU', 1, 0, 'FPERALTA', GETDATE()),
('COLOMBIA', 1, 0, 'FPERALTA', GETDATE())
go

CREATE TABLE [dbo].[SUPERVISOR](
	idSupervisor [int] IDENTITY(1,1) NOT NULL,
	nombre varchar(200) NOT NULL,
	apellidos varchar(200) NOT NULL,
	direccion varchar(255) NULL,
	email varchar(255) NOT NULL,
	idPais INT NOT NULL,
	activo bit NOT NULL,
	eliminado BIT NOT NULL,
	usuarioRegistro VARCHAR(20) NOT NULL,
	fechaRegistro DATETIME NOT NULL,
	usuarioModificacion VARCHAR(20) NULL,
	fechaModificacion DATETIME NULL,
	usuarioEliminacion VARCHAR(20) NULL,
	fechaEliminacion DATETIME NULL
CONSTRAINT [SUPERVISOR_pk] PRIMARY KEY CLUSTERED
(
	idSupervisor ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SUPERVISOR] ADD CONSTRAINT [DF_SUPERVISOR_activo] DEFAULT ((1)) FOR [activo]
GO

ALTER TABLE [dbo].[SUPERVISOR] ADD CONSTRAINT [DF_SUPERVISOR_eliminado] DEFAULT ((0)) FOR [eliminado]
GO

INSERT INTO SUPERVISOR(nombre, apellidos, direccion,email, idPais, activo, eliminado, usuarioRegistro, fechaRegistro)
values
	('FABIO ALEJANDRO', 'PERALTA MEDINA', 'CALLE 9 DE OCTUBRE 644', 'fperalta@gmail.com', 1, 1, 0, 'FPERALTA', GETDATE()),
	('RICARDO ANTONY', 'ASMAT MARINES', 'AV. PEDRO MUÑIZ 233', 'rasmat@gmail.com', 1, 1, 0, 'FPERALTA', GETDATE()),
	('KEVIN', 'ESPEJO ALAYO', 'AV. LARCO 488', 'kespejo@gmail.com', 1, 1, 0, 'FPERALTA', GETDATE()),
	('JUAN CARLOS', 'CARDENAS ROJAS', 'CALLE MAGNOLIAS 289', 'jcardenas@gmail.com', 1, 1, 0, 'FPERALTA', GETDATE())
GO

CREATE OR ALTER PROCEDURE sp_GetPaises
AS
BEGIN
	SELECT idPais, nombre
	FROM PAIS
END
GO

CREATE OR ALTER PROCEDURE sp_GetSupervisores
AS
BEGIN
	SELECT idSupervisor, nombre, apellidos, isnull(direccion, '') as direccion, email, idPais
	FROM SUPERVISOR
	WHERE eliminado = 0
END
GO

CREATE OR ALTER PROCEDURE sp_InsertSupervisor
	@prmstrNombre VARCHAR(200),
	@prmstrApellidos VARCHAR(200),
	@prmstrDireccion VARCHAR(255) = NULL,
	@prmstrEmail VARCHAR(255),
	@prmintIdPais INT
AS
BEGIN
	INSERT INTO SUPERVISOR (nombre, apellidos, direccion, email, idPais, activo, eliminado, usuarioRegistro, fechaRegistro)
	VALUES(@prmstrNombre, @prmstrApellidos, @prmstrDireccion, @prmstrEmail, @prmintIdPais, 1, 0, 'ADMINISTRADOR', GETDATE())
END
GO

CREATE OR ALTER PROCEDURE sp_UpdateSupervisor
	@prmintIdSupervisor INT,
	@prmstrNombre VARCHAR(200),
	@prmstrApellidos VARCHAR(200),
	@prmstrDireccion VARCHAR(255),
	@prmstrEmail VARCHAR(255),
	@prmintIdPais INT
AS
BEGIN
	UPDATE SUPERVISOR
	SET
		nombre = @prmstrNombre,
		apellidos = @prmstrApellidos,
		direccion = @prmstrDireccion,
		email = @prmstrEmail,
		idPais = @prmintIdPais,
		usuarioModificacion = 'ADMINISTRADOR',
		fechaModificacion = getdate()
	WHERE idSupervisor = @prmintIdSupervisor
END
GO

CREATE OR ALTER PROCEDURE sp_DeleteSupervisor
	@prmintIdSupervisor INT
AS
BEGIN
	UPDATE SUPERVISOR
	SET
		eliminado = 1,
		usuarioEliminacion = 'ADMINISTRADOR',
		fechaEliminacion = GETDATE()
	WHERE idSupervisor = @prmintIdSupervisor
	--DELETE FROM SUPERVISOR WHERE idSupervisor = @prmintIdSupervisor
END
GO