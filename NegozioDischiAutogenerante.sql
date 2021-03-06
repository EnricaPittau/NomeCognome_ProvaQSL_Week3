USE [master]
GO
/****** Object:  Database [GestioneNegozioDischi]    Script Date: 18/03/2022 15:00:20 ******/
CREATE DATABASE [GestioneNegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestioneNegozioDischi', FILENAME = N'C:\Users\Enrica\GestioneNegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GestioneNegozioDischi_log', FILENAME = N'C:\Users\Enrica\GestioneNegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GestioneNegozioDischi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestioneNegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestioneNegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GestioneNegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestioneNegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestioneNegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GestioneNegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestioneNegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestioneNegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [GestioneNegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestioneNegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestioneNegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestioneNegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GestioneNegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GestioneNegozioDischi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GestioneNegozioDischi] SET QUERY_STORE = OFF
GO
USE [GestioneNegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 18/03/2022 15:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](50) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [varchar](20) NOT NULL,
	[Genere] [varchar](10) NOT NULL,
	[Supporto] [varchar](20) NOT NULL,
	[IdBand] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UNQ_AlbumSupporto] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[Supporto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 18/03/2022 15:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[IdAlbum] [int] NOT NULL,
	[IdBrano] [int] NOT NULL,
 CONSTRAINT [PK_AlbumBrano] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC,
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 18/03/2022 15:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IdBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 18/03/2022 15:00:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IdBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](50) NOT NULL,
	[Durata] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album] ADD  DEFAULT ('Sconosciuto') FOR [Genere]
GO
ALTER TABLE [dbo].[Album] ADD  DEFAULT ('Sconosciuto') FOR [Supporto]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_BandAlbum] FOREIGN KEY([IdBand])
REFERENCES [dbo].[Band] ([IdBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_BandAlbum]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_AlbumBrano] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([IdAlbum])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_AlbumBrano]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_BranoAlbum] FOREIGN KEY([IdBrano])
REFERENCES [dbo].[Brano] ([IdBrano])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_BranoAlbum]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CHK_Genere] CHECK  (([Genere]='Sconosciuto' OR [Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CHK_Genere]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CHK_Supporto] CHECK  (([Supporto]='Sconosciuto' OR [Supporto]='CD' OR [Supporto]='Vinile' OR [Supporto]='Streaming'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CHK_Supporto]
GO
USE [master]
GO
ALTER DATABASE [GestioneNegozioDischi] SET  READ_WRITE 
GO
