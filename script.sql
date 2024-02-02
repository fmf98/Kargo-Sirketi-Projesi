USE [master]
GO
/****** Object:  Database [KargoSirketiDB]    Script Date: 18.01.2024 05:32:38 ******/
CREATE DATABASE [KargoSirketiDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KargoSirketiDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KargoSirketiDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KargoSirketiDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KargoSirketiDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KargoSirketiDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KargoSirketiDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KargoSirketiDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KargoSirketiDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KargoSirketiDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KargoSirketiDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KargoSirketiDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET RECOVERY FULL 
GO
ALTER DATABASE [KargoSirketiDB] SET  MULTI_USER 
GO
ALTER DATABASE [KargoSirketiDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KargoSirketiDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KargoSirketiDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KargoSirketiDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KargoSirketiDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KargoSirketiDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KargoSirketiDB', N'ON'
GO
ALTER DATABASE [KargoSirketiDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [KargoSirketiDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KargoSirketiDB]
GO
/****** Object:  Table [dbo].[KargoDurum]    Script Date: 18.01.2024 05:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KargoDurum](
	[KargoDurumId] [int] IDENTITY(1,1) NOT NULL,
	[KargoDurumAd] [nvarchar](20) NULL,
 CONSTRAINT [PK_KargoDurum] PRIMARY KEY CLUSTERED 
(
	[KargoDurumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargolar]    Script Date: 18.01.2024 05:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargolar](
	[KargoId] [int] IDENTITY(1,1) NOT NULL,
	[KargoPrID] [int] NULL,
	[KargoAlımTarih] [datetime] NULL,
	[KargoTeslimTarih] [datetime] NULL,
	[KargoDurumId] [int] NULL,
	[KargoNot] [nvarchar](max) NULL,
	[KargoAdres] [nvarchar](max) NULL,
	[KargoBaslik] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kargolar] PRIMARY KEY CLUSTERED 
(
	[KargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 18.01.2024 05:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PrId] [int] IDENTITY(1,1) NOT NULL,
	[PrAdSoyad] [nvarchar](50) NULL,
	[PrKullanici] [nvarchar](20) NULL,
	[PrSifre] [nvarchar](20) NULL,
	[PrSubeId] [int] NULL,
	[PrYetkiId] [int] NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subeler]    Script Date: 18.01.2024 05:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subeler](
	[SubeId] [int] IDENTITY(1,1) NOT NULL,
	[SubeKonum] [nvarchar](20) NULL,
 CONSTRAINT [PK_Subeler] PRIMARY KEY CLUSTERED 
(
	[SubeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetkiler]    Script Date: 18.01.2024 05:32:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetkiler](
	[YetkiId] [int] IDENTITY(1,1) NOT NULL,
	[YetkiTipi] [nvarchar](20) NULL,
 CONSTRAINT [PK_Yetkiler] PRIMARY KEY CLUSTERED 
(
	[YetkiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[KargoDurum] ON 

INSERT [dbo].[KargoDurum] ([KargoDurumId], [KargoDurumAd]) VALUES (1, N'Hazırlanıyor')
INSERT [dbo].[KargoDurum] ([KargoDurumId], [KargoDurumAd]) VALUES (2, N'Teslim Edildi')
SET IDENTITY_INSERT [dbo].[KargoDurum] OFF
GO
SET IDENTITY_INSERT [dbo].[Kargolar] ON 

INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (1, 5, CAST(N'2024-01-17T19:42:57.563' AS DateTime), CAST(N'2024-01-18T04:38:53.107' AS DateTime), 2, N'Kargo sahibi özellikle gönderdiği ürünün kırılabilir olduğunu belirtiyor. Lütfen dikkatli taşıyınız.', N'Manolya mahallesi, Lale caddesi, Papatya sokak, no:41/2 - Kadıköy', N'Kırılabilir Ürün!')
INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (2, 4, CAST(N'2024-01-17T20:08:05.993' AS DateTime), NULL, 1, N'Kargo sahibi özellikle gönderdiği ürünün kırılabilir olduğunu belirtiyor. Lütfen dikkatli taşıyınız.', N'Manolya mahallesi, Lale caddesi, Papatya sokak, no:41/2 - Kadıköy', N'Kırılabilir Ürün!')
INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (5, 5, CAST(N'2024-01-17T21:20:37.753' AS DateTime), NULL, 1, N'Kargo paketi içerisinde dikkat edilmesi gereken bir ürün bulunmuyor.', N'Kum mahallesi, Toprak sokak, No:32/4 - Kadıköy', N'Standart Kargo')
INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (6, 6, CAST(N'2024-01-18T05:16:40.333' AS DateTime), NULL, 1, N'Kargo paketi içerisinde dikkat edilmesi gereken bir ürün bulunmuyor.', N'Manolya mahallesi, Lale caddesi, Papatya sokak, no:41/2 - Kadıköy', N'Standart Kargo')
INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (7, 8, CAST(N'2024-01-18T05:17:26.810' AS DateTime), CAST(N'2024-01-18T05:17:58.897' AS DateTime), 2, N'Kargo sahibi özellikle gönderdiği ürünün kırılabilir olduğunu belirtiyor. Lütfen dikkatli taşıyınız.', N'Kum mahallesi, Toprak sokak, No:32/4 - Kadıköy', N'Kırılabilir Ürün!')
INSERT [dbo].[Kargolar] ([KargoId], [KargoPrID], [KargoAlımTarih], [KargoTeslimTarih], [KargoDurumId], [KargoNot], [KargoAdres], [KargoBaslik]) VALUES (8, 10, CAST(N'2024-01-18T05:17:41.493' AS DateTime), NULL, 1, N'Kargo paketi içerisinde dikkat edilmesi gereken bir ürün bulunmuyor.', N'Manolya mahallesi, Lale caddesi, Papatya sokak, no:43/6 - Kadıköy', N'Standart Kargo')
SET IDENTITY_INSERT [dbo].[Kargolar] OFF
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (1, N'Hamit Kaya', N'hamitkaya', N'1234', 1, 1)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (2, N'Esma Aydın', N'esmaaydın', N'1234', 2, 1)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (3, N'Orhan Uzun', N'orhanuzun', N'1234', 3, 1)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (4, N'Çınar Turna', N'çınarturna', N'123', 1, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (5, N'Cenk Konmaz', N'cenkkonmaz', N'123', 1, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (6, N'Pınar Gün', N'pınargün', N'123', 2, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (7, N'Mutlu Bayır', N'mutlubayır', N'123', 2, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (8, N'Zafer Görür', N'zafergörür', N'123', 3, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (9, N'Okan Meşe', N'okanmeşe', N'123', 3, 2)
INSERT [dbo].[Personeller] ([PrId], [PrAdSoyad], [PrKullanici], [PrSifre], [PrSubeId], [PrYetkiId]) VALUES (10, N'Hasan Kalın', N'hasankalın', N'123', 3, 2)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
SET IDENTITY_INSERT [dbo].[Subeler] ON 

INSERT [dbo].[Subeler] ([SubeId], [SubeKonum]) VALUES (1, N'Kadıköy')
INSERT [dbo].[Subeler] ([SubeId], [SubeKonum]) VALUES (2, N'Üsküdar')
INSERT [dbo].[Subeler] ([SubeId], [SubeKonum]) VALUES (3, N'Beşiktaş')
SET IDENTITY_INSERT [dbo].[Subeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yetkiler] ON 

INSERT [dbo].[Yetkiler] ([YetkiId], [YetkiTipi]) VALUES (1, N'Yönetici')
INSERT [dbo].[Yetkiler] ([YetkiId], [YetkiTipi]) VALUES (2, N'Çalışan')
SET IDENTITY_INSERT [dbo].[Yetkiler] OFF
GO
ALTER TABLE [dbo].[Kargolar]  WITH CHECK ADD  CONSTRAINT [FK_Kargolar_KargoDurum] FOREIGN KEY([KargoDurumId])
REFERENCES [dbo].[KargoDurum] ([KargoDurumId])
GO
ALTER TABLE [dbo].[Kargolar] CHECK CONSTRAINT [FK_Kargolar_KargoDurum]
GO
ALTER TABLE [dbo].[Kargolar]  WITH CHECK ADD  CONSTRAINT [FK_Kargolar_Personeller] FOREIGN KEY([KargoPrID])
REFERENCES [dbo].[Personeller] ([PrId])
GO
ALTER TABLE [dbo].[Kargolar] CHECK CONSTRAINT [FK_Kargolar_Personeller]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Subeler] FOREIGN KEY([PrSubeId])
REFERENCES [dbo].[Subeler] ([SubeId])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Subeler]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Yetkiler] FOREIGN KEY([PrYetkiId])
REFERENCES [dbo].[Yetkiler] ([YetkiId])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Yetkiler]
GO
USE [master]
GO
ALTER DATABASE [KargoSirketiDB] SET  READ_WRITE 
GO
