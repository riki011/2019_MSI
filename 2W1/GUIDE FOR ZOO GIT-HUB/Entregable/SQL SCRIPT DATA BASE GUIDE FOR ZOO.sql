USE [master]
GO
/****** Object:  Database [finalZoologico]    Script Date: 5/11/2019 17:08:39 ******/
CREATE DATABASE [finalZoologico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finalZoologico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\finalZoologico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'finalZoologico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\finalZoologico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [finalZoologico] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finalZoologico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finalZoologico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finalZoologico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finalZoologico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finalZoologico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finalZoologico] SET ARITHABORT OFF 
GO
ALTER DATABASE [finalZoologico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [finalZoologico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finalZoologico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finalZoologico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finalZoologico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finalZoologico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finalZoologico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finalZoologico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finalZoologico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finalZoologico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [finalZoologico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finalZoologico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finalZoologico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finalZoologico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finalZoologico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finalZoologico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finalZoologico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finalZoologico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finalZoologico] SET  MULTI_USER 
GO
ALTER DATABASE [finalZoologico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finalZoologico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finalZoologico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finalZoologico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [finalZoologico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [finalZoologico] SET QUERY_STORE = OFF
GO
USE [finalZoologico]
GO
/****** Object:  Table [dbo].[Guia]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guia](
	[idGuia] [int] IDENTITY(1,1) NOT NULL,
	[legajoGuia] [varchar](50) NOT NULL,
	[nombreGuia] [varchar](30) NOT NULL,
	[telefono] [bigint] NULL,
 CONSTRAINT [PK_Guia] PRIMARY KEY CLUSTERED 
(
	[idGuia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[idInstitucion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[idInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recorrido]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recorrido](
	[nroRecorrido] [int] IDENTITY(1,1) NOT NULL,
	[puntosDePaseo] [varchar](50) NOT NULL,
	[precioXpersona] [real] NOT NULL,
	[duracionMinutos] [int] NOT NULL,
	[horarioRecorrido] [varchar](50) NULL,
	[cupo] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_recorrido] PRIMARY KEY CLUSTERED 
(
	[nroRecorrido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL,
	[accesLevel] [int] NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[visita]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visita](
	[NroVisita] [int] IDENTITY(1,1) NOT NULL,
	[idInstitucion] [int] NOT NULL,
	[idGuia] [int] NOT NULL,
	[NroRecorrido] [int] NOT NULL,
	[representante] [varchar](50) NOT NULL,
	[cantVisitantes] [int] NOT NULL,
	[montoSeña] [int] NOT NULL,
	[fechaReserva] [date] NOT NULL,
 CONSTRAINT [PK_visita] PRIMARY KEY CLUSTERED 
(
	[NroVisita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[visita]  WITH CHECK ADD  CONSTRAINT [FK_visita_Guia1] FOREIGN KEY([idGuia])
REFERENCES [dbo].[Guia] ([idGuia])
GO
ALTER TABLE [dbo].[visita] CHECK CONSTRAINT [FK_visita_Guia1]
GO
ALTER TABLE [dbo].[visita]  WITH CHECK ADD  CONSTRAINT [FK_visita_Institucion1] FOREIGN KEY([idInstitucion])
REFERENCES [dbo].[Institucion] ([idInstitucion])
GO
ALTER TABLE [dbo].[visita] CHECK CONSTRAINT [FK_visita_Institucion1]
GO
ALTER TABLE [dbo].[visita]  WITH CHECK ADD  CONSTRAINT [FK_visita_recorrido1] FOREIGN KEY([NroRecorrido])
REFERENCES [dbo].[recorrido] ([nroRecorrido])
GO
ALTER TABLE [dbo].[visita] CHECK CONSTRAINT [FK_visita_recorrido1]
GO
/****** Object:  StoredProcedure [dbo].[guardarVisitaParametro]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[guardarVisitaParametro]
@nroVisita int
as
select v.NroVisita,i.nombre,g.nombreGuia,r.nombre,v.representante,v.cantVisitantes,v.fechaReserva
from visita v inner join Guia g on g.idGuia = v.idGuia 
				inner join Institucion i on i.idInstitucion = v.idInstitucion 
				inner join recorrido r on r.nroRecorrido = v.NroRecorrido
where v.NroVisita= @nroVisita
GO
/****** Object:  StoredProcedure [dbo].[verificarFecha]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[verificarFecha]
@fecha date,
@nro int
as

select fechaReserva,NroRecorrido
from visita
where fechaReserva=@fecha and NroRecorrido=@nro
GO
/****** Object:  StoredProcedure [dbo].[visitaParametrizada2]    Script Date: 5/11/2019 17:08:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[visitaParametrizada2]
@nroVisita int 
as
select v.NroVisita,i.nombre,g.nombreGuia,r.nombre,v.representante,v.cantVisitantes,v.fechaReserva, r.horarioRecorrido 
from visita v inner join Guia g on g.idGuia = v.idGuia inner join Institucion i on i.idInstitucion = v.idInstitucion 
			inner join recorrido r on r.nroRecorrido = v.NroRecorrido
where v.NroVisita =@nroVisita
GO
USE [master]
GO
ALTER DATABASE [finalZoologico] SET  READ_WRITE 
GO
