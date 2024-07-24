USE [master]
GO

CREATE DATABASE [MARTES_BD]
GO

USE [MARTES_BD]
GO

CREATE TABLE [dbo].[tRol](
	[IdRol] [tinyint] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](15) NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdRol] [tinyint] NOT NULL,
	[EsClaveTemporal] [bit] NULL,
	[ClaveVencimiento] [datetime] NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tRol] ([IdRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@Identificacion VARCHAR(20),
	@Nombre VARCHAR(100),
	@Correo VARCHAR(100),
	@IdRol TINYINT,
	@Consecutivo INT
AS
BEGIN

	UPDATE	tUsuario
	   SET	Identificacion = @Identificacion,
			Nombre = @Nombre,
			Correo = @Correo,
			IdRol = CASE WHEN @IdRol = 0 THEN IdRol ELSE @IdRol END
	 WHERE	Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[CambiarEstadoUsuario]
	@Consecutivo INT
AS
BEGIN
	
	--borrado lógico
	UPDATE	tUsuario
	SET		Estado = CASE WHEN Estado = 1 THEN 0 ELSE 1 END
	WHERE	Consecutivo = @Consecutivo

	--borrado físico
	--DELETE FROM tUsuario 
	--WHERE	Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo			varchar(100),
	@Contrasenna	varchar(15)
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,Correo,Estado,IdRol,EsClaveTemporal,ClaveVencimiento
	FROM	dbo.tUsuario
	WHERE	Correo = @Correo
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Identificacion	varchar(20),
	@Nombre			varchar(100),
	@Correo			varchar(100),
	@Contrasenna	varchar(15)
AS
BEGIN

	IF(NOT EXISTS(SELECT 1 FROM tUsuario WHERE Identificacion = @Identificacion OR Correo = @Correo ))
	BEGIN
	
		INSERT INTO dbo.tUsuario(Identificacion,Nombre,Correo,Contrasenna,Estado,IdRol,EsClaveTemporal,ClaveVencimiento)
		VALUES(@Identificacion,@Nombre,@Correo,@Contrasenna,1,1,0,GETDATE())

	END

END
GO

CREATE PROCEDURE [dbo].[ValidarUsuarioIdentificacion]
	@Identificacion VARCHAR(20)
AS
BEGIN

	SELECT	Consecutivo, Identificacion, Nombre, Correo
	FROM	tUsuario
	WHERE	Identificacion = @Identificacion

END
GO
