USE [master]
GO
/****** Object:  Database [ukcdb]    Script Date: 11/04/2021 21:08:36 ******/
CREATE DATABASE [ukcdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ukcdb', FILENAME = N'C:\Users\corey\ukcdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ukcdb_log', FILENAME = N'C:\Users\corey\ukcdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ukcdb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ukcdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ukcdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ukcdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ukcdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ukcdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ukcdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ukcdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ukcdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ukcdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ukcdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ukcdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ukcdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ukcdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ukcdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ukcdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ukcdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ukcdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ukcdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ukcdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ukcdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ukcdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ukcdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ukcdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ukcdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ukcdb] SET  MULTI_USER 
GO
ALTER DATABASE [ukcdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ukcdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ukcdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ukcdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ukcdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ukcdb] SET QUERY_STORE = OFF
GO
USE [ukcdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ukcdb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[RoleDescription] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crag]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crag](
	[CragID] [int] IDENTITY(1,1) NOT NULL,
	[CragName] [varchar](100) NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[CragDescription] [varchar](255) NULL,
	[ImageID] [int] NOT NULL,
	[Country] [varchar](100) NULL,
	[Region] [varchar](100) NULL,
	[County] [varchar](100) NULL,
	[DateAdded] [datetime2](7) NULL,
 CONSTRAINT [PK__Crag__7D8C01DBE65EBF5B] PRIMARY KEY CLUSTERED 
(
	[CragID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favourites]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favourites](
	[UserID] [nvarchar](450) NOT NULL,
	[RouteID] [int] NOT NULL,
	[RelationID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Favourites] PRIMARY KEY CLUSTERED 
(
	[RelationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageDescription] [varchar](255) NOT NULL,
	[ImageURL] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Images__7516F4EC2D4CC901] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Route]    Script Date: 11/04/2021 21:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[CragID] [int] NOT NULL,
	[RouteName] [varchar](100) NOT NULL,
	[RouteGrade] [varchar](4) NOT NULL,
	[RouteHeight] [int] NOT NULL,
	[RouteDescription] [varchar](255) NULL,
	[RoutePitches] [int] NULL,
	[ImageID] [int] NULL,
	[DateAdded] [datetime2](7) NOT NULL,
 CONSTRAINT [PK__Route__80979AADC61D0761] PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210405160410_IdentityMigration', N'5.0.4')
INSERT [dbo].[AspNetRoles] ([Id], [RoleDescription], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2cfac93c-e678-4bf3-a425-036fd477dcd4', NULL, N'Moderator', N'MODERATOR', N'616a0ea8-07c2-4824-b139-208af3b65605')
INSERT [dbo].[AspNetRoles] ([Id], [RoleDescription], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'581e6ca3-b6de-40bb-9f75-daacc5d761cf', NULL, N'Admin', N'ADMIN', N'34441791-bda4-4b01-a206-06df508f23a0')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'530654a5-d96d-4524-b900-604d34a1a6ef', N'2cfac93c-e678-4bf3-a425-036fd477dcd4')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b84daf79-509c-44cd-a7e0-f72ef426df0e', N'581e6ca3-b6de-40bb-9f75-daacc5d761cf')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'530654a5-d96d-4524-b900-604d34a1a6ef', N'Martin', N'MARTIN', N'Martin@martin.com', N'MARTIN@MARTIN.COM', 0, N'AQAAAAEAACcQAAAAEGE1rQ8WWNu/WHDXq5Iuw5KkqHHtFmmslsc86XLMKgHCiSBqT+LucnFYp1jleYyppQ==', N'WPVUWAOJC2R7OSCLG3OSUPR3QXXBGV47', N'2ed0a94b-7a95-4687-8456-346189f5405d', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b84daf79-509c-44cd-a7e0-f72ef426df0e', N'Corey', N'COREY', N'Admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEL8AI37ZvMiWc1rHI8P7qv7bQHUB9Q4Iz+dcALUzQk/qKRkM/BFLgtEZdiPQAGVlsw==', N'7Y2FCFB754RNHFR4CXDESPJTWEDB2NFG', N'a739e235-8ad7-473b-89f8-21c3baaa2467', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Crag] ON 

INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (2, N'Wharncliffe Crag', -1.5523389, 53.4717353, N'Wharncliffe Crags is a gritstone escarpment or edge situated north west of Sheffield in South Yorkshire, England. Wharncliffe Crags has a long history of rock climbing: it was at the forefront at the birth of the sport in the UK in the 1880s.', 1, N'United Kingdom', N'Yorkshire and Humber', N'South Yorkshire', CAST(N'2021-04-06T23:27:34.2899679' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (3, N'Burbage North', -1.6123829, 53.3392975, N'Burbage North is a 
popular spot because 
its great accessibility 
makes it a regular 
haunt of many 
climbers. Unlike its 
darker sister, Burbage 
South, it has a 
reputation for friendly 
routes in a picturesque 
setting.', 2, N'United Kingdom', N'yorkshire and humber', N'south yorkshire', CAST(N'2021-04-06T23:27:34.2899679' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (5, N'Wyndcliff Quarry', -2.6797875, 51.6729086, N'Sunny, quick-drying, 
convenient: 
understandably 
popular, despite a fair 
bit of dubious rock. 
Following recent, 
extensive new routing, 
there are now over 100 
fully bolted sport 
routes, 55 of which get 
a trad grade.', 3, N'Wales', N'South Wales', N'Newport', CAST(N'2021-04-07T02:09:14.8433070' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (16, N'Froggat Edge', -1.6283, 53.2842, N'Froggatt is the second most popular of the Eastern Edges with good reason; the cliff is relatively low lying, escapes the worst of the weather, faces the afternoon sun, and has many neat slabby routes.', 6, N'United Kingdom', N'East Midlands', N'Derbyshire', CAST(N'2021-04-07T02:09:14.8433070' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (1005, N'Meikle Ross', -4.0956, 54.7664, N'8 cliff areas within an 800 metre stretch of coastline give adventurous climbing mostly in the middle grades. Variable rock quality in places, care to be taken at the top of routes especially.', 4002, N'Scotland', N'Dumfries & Galloway', N'Kirkcudbrightshire', CAST(N'2021-04-10T22:24:08.9489870' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (2006, N'Post Hill Quarry', -1.6416927, 53.7933549, N'Hidden in the trees within Post Hill, Are 3 separate Gritstone crags left from an old quarry. There is a mixture of bouldering and single pitch climbing.', 5003, N'United Kingdom', N'Yorkshire and Humber', N'West Yorkshire', CAST(N'2021-04-11T14:55:01.2844479' AS DateTime2))
INSERT [dbo].[Crag] ([CragID], [CragName], [Longitude], [Latitude], [CragDescription], [ImageID], [Country], [Region], [County], [DateAdded]) VALUES (2007, N'Lands End', -5.7120494, 50.0656439, N'Although only a stone''s throw from the bustling tourist attractions that cap Land''s End, the cliffs and climbs are well hidden from the gaze of the masses and retain an air of seriousness that is out of proportion to their location and height.', 5005, N'United Kingdom', N'South West England', N'Cornwall', CAST(N'2021-04-11T15:38:31.3587752' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Crag] OFF
SET IDENTITY_INSERT [dbo].[Favourites] ON 

INSERT [dbo].[Favourites] ([UserID], [RouteID], [RelationID]) VALUES (N'530654a5-d96d-4524-b900-604d34a1a6ef', 3007, 1)
INSERT [dbo].[Favourites] ([UserID], [RouteID], [RelationID]) VALUES (N'b84daf79-509c-44cd-a7e0-f72ef426df0e', 1003, 3)
INSERT [dbo].[Favourites] ([UserID], [RouteID], [RelationID]) VALUES (N'b84daf79-509c-44cd-a7e0-f72ef426df0e', 3006, 4)
SET IDENTITY_INSERT [dbo].[Favourites] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1, N'Wharncliffe Crag Overview', N'Wharncliffe_Crags_2.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (2, N'Burbage North Overview', N'SHEFFIELD_Burbage-7984.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3, N'Wyndliffe Quarry', N'Wyndcliff.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (4, N'Puttrell Progress', N'Puttrell Progress.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (6, N'Froggatt Edge Image', N'Froggatt.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (8, N'Sunset Crack', N'Sunset.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1002, N'Himmelswillen', N'himmel.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1003, N'Tower Face', N'Tower.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1004, N'Beta Crack', N'Beta Crack.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1005, N'Tody''s Wall', N'Tody.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (1006, N'Strapadictomy', N'Strapadictomy.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (2002, N'Long John''s Slab', N'Long J.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (2003, N'Knight''s Move', N'Knights.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (2004, N'Long Tall Sally', N'Sally.jpg')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3002, N'Ash Tree Wall', N'ash tree.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3003, N'Mutiny Crack', N'Mutiny.jfif')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3004, N'Three Blind Mice', N'Mice.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3005, N'Remergence', N'Remergence.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3006, N'The Sentinel', N'Sentinel.jfif')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (3007, N'One Tooth Short of a Smile', N'Tooth.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (4002, N'Meikle Ross', N'Meikle.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (4003, N'Mellow Yellow', N'Yellow.jfif')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (5002, N'Post Hill Quarry', N'Post.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (5003, N'Post Hill Quarry', N'Post.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (5004, N'Monkey Bars', N'Post.webp')
INSERT [dbo].[Images] ([ImageID], [ImageDescription], [ImageURL]) VALUES (5005, N'Lands End', N'LandsEnd.webp')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Route] ON 

INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (4, 2, N'Puttrell''s Progress', N'4a', 12, N'A fine mini-expedition. Climb the right arete of the big cave and enter the vertical slot with difficulty. Make a bold-feeling traverse left and finish up the steep juggy crack.', 1, 4, CAST(N'2021-04-07T19:35:00.0000000' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (6, 16, N'Sunset Crack', N'4b', 15, N'The awkward undercut crack has enough runners to make up for the previous two offerings! The initial bulge is the crux and the route has its fair share of sloping holds but, on the whole, it is pretty friendly at the grade.', 1, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (1002, 2, N'Himmelswillen', N'4c', 14, N'The classic of the crag, surprisingly steep and pumpy for its time. Climb the left arete to ledges then step right and layback into the finger-crack that splits the centre of the tower. Finish on the left arete. Starting up the right arete is an option at', 1, 1002, CAST(N'2021-04-10T20:42:04.0746170' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (1003, 2, N'Tower Face', N'4b', 12, N'The left-hand facet of the square buttress is split by a thin crack. Approach this via a short slab (awkward for the short and with poor protection), then climb it using the arete on the right as and when needed.', 1, 1003, CAST(N'2021-04-10T20:45:12.9003802' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (1004, 2, N'Beta Crack', N'4a', 10, N'The long flake running up the right-hand side of the slab; a fine pitch with exciting moves rightwards over a small overhang. It is also possible to escape left as a worthwhile VD.', 1, 1004, CAST(N'2021-04-10T20:51:03.5416026' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (1005, 16, N'Tody''s Wall', N'4a', 18, N'Mild for HVS but excellent. Grovel onto the jammed block, place a few cams and make the obvious move onto the slab - easier said than done. Finish up the slab and elegant crack above.', 1, 1005, CAST(N'2021-04-10T21:15:04.4351227' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (1006, 16, N'Strapadictomy', N'6b', 9, N'A real classic and rite of passage which is hard work but well protected. Climb the short arete to runners, then lean out (large wire in the flake) and layback onto the flake. About face, and finish briskly.', 1, 1006, CAST(N'2021-04-10T21:18:08.9875094' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (2002, 16, N'Long John''s Slab', N'5c', 14, N'From a lurking boulder, mantel onto a narrow ledge then use the old peg hole (6a for the short) to gain finger-holds and easier climbing.', 1, 2002, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (2003, 3, N'Knight''s Move', N'5a', 16, N'A Burbage classic. Climb past some holes then take the thin cracks (small wires) and the wall above, following the flakes rightwards to finish. Mild at the grade but some have to be.', 1, 2003, CAST(N'2021-04-10T21:40:50.8426185' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (2004, 3, N'Long Tall Sally', N'5b', 10, N'A superb climb up the blank groove. Many people''s first Extreme which is odd as it isn''t that easy. Passing the bulge is awkward and leads to the tenuous crux; protection is good but fiddly.', 1, 2004, CAST(N'2021-04-10T21:45:27.3660218' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3002, 3, N'Ash Tree Wall', N'4a', 14, N'Climb the fist crack to its end then traverse left reach to the pleasant right-trending groove.', 1, 3002, CAST(N'2021-04-10T22:02:08.9339853' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3003, 3, N'Mutiny Crack', N'4b', 10, N'A mini-classic, and a great little route following the crack cleaving the bulges. It is jug-pulling once the initial awkward roof is passed but this is a real struggle for many.', 1, 3003, CAST(N'2021-04-10T22:03:54.8917082' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3004, 3, N'Three Blind Mice', N'6c', 10, N'Fine technical climbing up the blank arching wall. Use a couple of chipped pockets on the right to climb the lower leaning wall leftwards, pass the bulge via wild mantel and finish direct.', 1, 3004, CAST(N'2021-04-10T22:06:09.0101474' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3005, 3, N'Remergence', N'6b', 12, N'The centre of the roof is passed with difficulty using chalked slots to gain a flatty above - a great f6B problem.', 1, 3005, CAST(N'2021-04-10T22:07:30.2623895' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3006, 2, N'The Sentinel', N'4a', 10, N'The narrow projecting buttress has a couple of steep and powerful moves just below the top.', 1, 3006, CAST(N'2021-04-10T22:09:39.4199071' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (3007, 5, N'One Tooth Short', N'6a', 10, N'Climb direct for 3 bolts; then follow a right-rising line to finish at the abseil station of Still Stuck on You (or, more logically, finish straight up to a newer lower-off). At this grade the main line of concretions to the right should be avoided', 1, 3007, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (4002, 1005, N'Mellow Yellow', N'4c', 45, NULL, 3, 4003, CAST(N'2021-04-10T22:25:14.5772834' AS DateTime2))
INSERT [dbo].[Route] ([RouteID], [CragID], [RouteName], [RouteGrade], [RouteHeight], [RouteDescription], [RoutePitches], [ImageID], [DateAdded]) VALUES (5002, 2006, N'Monkey Bars', N'5b', 14, N'Refer to pictures of Crag. Either Trad or Highball boulder problem. Start at the waist high under cut and climb the arête. Poor protection.', 1, 5004, CAST(N'2021-04-11T14:58:15.6537307' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Route] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/04/2021 21:08:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/04/2021 21:08:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/04/2021 21:08:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/04/2021 21:08:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/04/2021 21:08:37 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/04/2021 21:08:37 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/04/2021 21:08:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Crag]  WITH CHECK ADD  CONSTRAINT [FK_CragImage] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[Crag] CHECK CONSTRAINT [FK_CragImage]
GO
ALTER TABLE [dbo].[Favourites]  WITH CHECK ADD  CONSTRAINT [FK_UserFavourites] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Favourites] CHECK CONSTRAINT [FK_UserFavourites]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_CragRoute] FOREIGN KEY([CragID])
REFERENCES [dbo].[Crag] ([CragID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_CragRoute]
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [FK_RouteImage] FOREIGN KEY([ImageID])
REFERENCES [dbo].[Images] ([ImageID])
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [FK_RouteImage]
GO
USE [master]
GO
ALTER DATABASE [ukcdb] SET  READ_WRITE 
GO
