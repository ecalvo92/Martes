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
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([IdRol], [NombreRol]) VALUES (1, N'Usuario')
GO
INSERT [dbo].[tRol] ([IdRol], [NombreRol]) VALUES (2, N'Administrador')
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO

SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol]) VALUES (2, N'305060673', N'SANCHEZ CORNEJO JOEL GEOVANNY', N'jsanchez60673@ufide.ac.cr', N'60673', 1, 1)
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol]) VALUES (4, N'304590415', N'CALVO CASTILLO EDUARDO JOSE', N'ecalvo90415@ufide.ac.cr', N'90415', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[tRol] ([IdRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo			varchar(100),
	@Contrasenna	varchar(15)
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,Correo,Estado,IdRol
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

	INSERT INTO dbo.tUsuario(Identificacion,Nombre,Correo,Contrasenna,Estado,IdRol)
    VALUES(@Identificacion,@Nombre,@Correo,@Contrasenna,1,1)

END
GO