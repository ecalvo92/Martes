USE [master]
GO

CREATE DATABASE [MARTES_BD]
GO

USE [MARTES_BD]
GO

CREATE TABLE [dbo].[tCarrito](
	[IdCarrito] [int] IDENTITY(1,1) NOT NULL,
	[Consecutivo] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tCategoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_tCategoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tDetalle](
	[IdDetale] [int] IDENTITY(1,1) NOT NULL,
	[IdMaestro] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetalle] PRIMARY KEY CLUSTERED 
(
	[IdDetale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tMaestro](
	[IdMaestro] [int] IDENTITY(1,1) NOT NULL,
	[Consecutivo] [int] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tMaestro] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tProducto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Inventario] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

SET IDENTITY_INSERT [dbo].[tCarrito] ON 
GO
INSERT [dbo].[tCarrito] ([IdCarrito], [Consecutivo], [IdProducto], [Cantidad], [Fecha]) VALUES (11, 2, 3, 1, CAST(N'2024-08-06T21:01:39.840' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tCarrito] OFF
GO

SET IDENTITY_INSERT [dbo].[tCategoria] ON 
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Descripcion]) VALUES (1, N'Periféricos')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Monitores')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Tarjetas')
GO
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO

SET IDENTITY_INSERT [dbo].[tDetalle] ON 
GO
INSERT [dbo].[tDetalle] ([IdDetale], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (1, 1, 2, 2, CAST(15000.00 AS Decimal(18, 2)), CAST(30000.00 AS Decimal(18, 2)), CAST(3900.00 AS Decimal(18, 2)), CAST(33900.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([IdDetale], [IdMaestro], [IdProducto], [Cantidad], [PrecioUnitario], [SubTotal], [Impuesto], [Total]) VALUES (2, 1, 3, 3, CAST(50000.00 AS Decimal(18, 2)), CAST(150000.00 AS Decimal(18, 2)), CAST(19500.00 AS Decimal(18, 2)), CAST(169500.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tDetalle] OFF
GO

SET IDENTITY_INSERT [dbo].[tMaestro] ON 
GO
INSERT [dbo].[tMaestro] ([IdMaestro], [Consecutivo], [FechaCompra], [SubTotal], [Impuesto], [Total]) VALUES (1, 2, CAST(N'2024-08-06T20:58:43.827' AS DateTime), CAST(180000.00 AS Decimal(18, 2)), CAST(23400.00 AS Decimal(18, 2)), CAST(203400.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[tMaestro] OFF
GO

SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([IdProducto], [Descripcion], [Inventario], [Precio], [Imagen], [IdCategoria]) VALUES (2, N'Mouse Inalámbrico', 3, CAST(15000.00 AS Decimal(10, 2)), N'https://pngimg.es/d/monitor_PNG101656.png', 1)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Descripcion], [Inventario], [Precio], [Imagen], [IdCategoria]) VALUES (3, N'Monitor Asus', 1, CAST(50000.00 AS Decimal(10, 2)), N'https://pngimg.es/d/monitor_PNG101656.png', 2)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Descripcion], [Inventario], [Precio], [Imagen], [IdCategoria]) VALUES (4, N'Tarjeta de Video', 5, CAST(75000.00 AS Decimal(10, 2)), N'https://pngimg.es/d/monitor_PNG101656.png', 3)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Descripcion], [Inventario], [Precio], [Imagen], [IdCategoria]) VALUES (5, N'Monitor Games', 12, CAST(160000.00 AS Decimal(10, 2)), N'https://pngimg.es/d/monitor_PNG101656.png', 2)
GO
INSERT [dbo].[tProducto] ([IdProducto], [Descripcion], [Inventario], [Precio], [Imagen], [IdCategoria]) VALUES (6, N'Monitor Asus Segunda Parte', 2, CAST(225000.00 AS Decimal(10, 2)), N'https://pngimg.es/d/monitor_PNG101656.png', 2)
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
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
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol], [EsClaveTemporal], [ClaveVencimiento]) VALUES (2, N'118160975', N'MADRIGAL ABARCA ANDY JULIAN', N'amadrigal60975@ufide.ac.cr', N'60975', 1, 2, 0, CAST(N'2024-07-30T18:15:49.770' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol], [EsClaveTemporal], [ClaveVencimiento]) VALUES (4, N'304590415', N'CALVO CASTILLO EDUARDO JOSE', N'ecalvo90415@ufide.ac.cr', N'90415', 0, 1, 0, CAST(N'2024-07-23T20:08:51.473' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol], [EsClaveTemporal], [ClaveVencimiento]) VALUES (16, N'117830806', N'JIMENEZ GONZALEZ DIANA VANESSA', N'djimenez30808@ufide.ac.cr2', N'30808', 0, 1, 0, CAST(N'2024-07-23T20:08:51.473' AS DateTime))
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Nombre], [Correo], [Contrasenna], [Estado], [IdRol], [EsClaveTemporal], [ClaveVencimiento]) VALUES (19, N'119190738', N'PADILLA RIVAS JOSE ALBERTO', N'jpadilla90738@ufide.ac.cr', N'90738', 0, 1, 0, CAST(N'2024-07-23T20:08:51.473' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[tProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tProducto]
GO

ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([Consecutivo])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tUsuario]
GO

ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tCategoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tCategoria]
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

CREATE PROCEDURE [dbo].[ConsultarCarrito]
	@Consecutivo INT
AS
BEGIN

	SELECT  IdCarrito,
		    C.Consecutivo,
			U.Nombre,
		    C.IdProducto,
			P.Descripcion,
			p.Precio,
			(p.Precio * Cantidad) SubTotal,
			(p.Precio * Cantidad) * 0.13 Impuesto,
			(p.Precio * Cantidad) + (p.Precio * Cantidad) * 0.13 Total,
		    Cantidad,
		    Fecha
	  FROM  dbo.tCarrito C
	  INNER JOIN dbo.tUsuario U ON C.Consecutivo = U.Consecutivo
	  INNER JOIN dbo.tProducto P ON C.IdProducto = P.IdProducto
	  WHERE	C.Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]

AS
BEGIN
	
SELECT IdProducto,
       p.Descripcion 'DescripcionProducto',
       Inventario,
       Precio,
       Imagen,
       p.IdCategoria,
	   c.Descripcion 'DescripcionCategoria'
  FROM tProducto p 
  INNER JOIN tCategoria c on p.IdCategoria = c.IdCategoria

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

CREATE PROCEDURE [dbo].[PagarCarrito]
	@Consecutivo INT
AS
BEGIN
	
	-->MAESTRO
	INSERT INTO dbo.tMaestro(Consecutivo,FechaCompra,SubTotal,Impuesto,Total)
    SELECT	Consecutivo, 
			GETDATE(), 
			SUM(P.Precio * Cantidad), 
			SUM(P.Precio * Cantidad) * 0.13, 
			SUM(P.Precio * Cantidad) + SUM(P.Precio * Cantidad) * 0.13
	FROM tCarrito C
	INNER JOIN tProducto P ON C.IdProducto = P.IdProducto
	WHERE Consecutivo = @Consecutivo
	GROUP BY Consecutivo


	-->DETALLLE
	INSERT INTO dbo.tDetalle(IdMaestro,IdProducto,Cantidad,PrecioUnitario,SubTotal,Impuesto,Total)
	SELECT	@@IDENTITY, 
			C.IdProducto, 
			Cantidad, 
			P.Precio, 
			P.Precio * Cantidad, 
			(P.Precio * Cantidad) * 0.13, 
			P.Precio * Cantidad + (P.Precio * Cantidad) * 0.13
	FROM tCarrito C
	INNER JOIN tProducto P ON C.IdProducto = P.IdProducto
	WHERE Consecutivo = @Consecutivo


	-->REBAJA DEL INVENTARIO
	UPDATE P
	SET Inventario = Inventario - Cantidad
	FROM tProducto P
	INNER JOIN tCarrito C ON P.IdProducto = C.IdProducto
	WHERE Consecutivo = @Consecutivo


	-->LIMPIEZA DEL CARRITO
	DELETE FROM tCarrito
	WHERE Consecutivo = @Consecutivo

END
GO

CREATE PROCEDURE [dbo].[RegistrarCarrito]
	@Consecutivo INT,
    @IdProducto INT,
    @Cantidad INT
AS
BEGIN
	
	IF NOT EXISTS(SELECT 1 FROM tCarrito WHERE	Consecutivo = @Consecutivo
											AND IdProducto = @IdProducto)
	BEGIN

		INSERT INTO tCarrito(Consecutivo,IdProducto,Cantidad,Fecha)
		VALUES (@Consecutivo,@IdProducto,@Cantidad,GETDATE())

	END
	ELSE
	BEGIN

		UPDATE tCarrito
		SET Cantidad = @Cantidad
		WHERE	Consecutivo = @Consecutivo
			AND IdProducto = @IdProducto 

	END

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