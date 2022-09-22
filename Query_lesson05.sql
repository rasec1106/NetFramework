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