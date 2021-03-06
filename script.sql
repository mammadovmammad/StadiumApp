USE [master]
GO
/****** Object:  Database [FootballStadium]    Script Date: 18.11.2018 23:14:28 ******/
CREATE DATABASE [FootballStadium]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football Stadium', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Football Stadium.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football Stadium_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Football Stadium_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FootballStadium] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FootballStadium].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FootballStadium] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FootballStadium] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FootballStadium] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FootballStadium] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FootballStadium] SET ARITHABORT OFF 
GO
ALTER DATABASE [FootballStadium] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FootballStadium] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FootballStadium] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FootballStadium] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FootballStadium] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FootballStadium] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FootballStadium] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FootballStadium] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FootballStadium] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FootballStadium] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FootballStadium] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FootballStadium] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FootballStadium] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FootballStadium] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FootballStadium] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FootballStadium] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FootballStadium] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FootballStadium] SET RECOVERY FULL 
GO
ALTER DATABASE [FootballStadium] SET  MULTI_USER 
GO
ALTER DATABASE [FootballStadium] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FootballStadium] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FootballStadium] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FootballStadium] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FootballStadium] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FootballStadium', N'ON'
GO
ALTER DATABASE [FootballStadium] SET QUERY_STORE = OFF
GO
USE [FootballStadium]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 18.11.2018 23:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[StadiumId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Price] [money] NOT NULL,
	[IsPlayed] [bit] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 18.11.2018 23:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Surname] [nvarchar](20) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stadiums]    Script Date: 18.11.2018 23:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Stadiums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (1, 1, 1, CAST(N'2018-11-13' AS Date), CAST(N'20:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (4, 3, 2, CAST(N'2018-11-14' AS Date), CAST(N'21:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (6, 1, 3, CAST(N'2018-11-17' AS Date), CAST(N'17:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (7, 7, 4, CAST(N'2018-11-16' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 1)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (8, 3, 2, CAST(N'2018-11-17' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 1)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (9, 6, 3, CAST(N'2018-11-29' AS Date), CAST(N'11:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (10, 6, 2, CAST(N'2018-11-03' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (12, 3, 1, CAST(N'2018-11-16' AS Date), CAST(N'18:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (13, 4, 3, CAST(N'2018-11-09' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (14, 4, 1, CAST(N'2018-11-09' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (15, 4, 2, CAST(N'2018-11-16' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (16, 1, 5, CAST(N'2018-11-16' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 1)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (23, 14, 1, CAST(N'2018-11-23' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (24, 14, 3, CAST(N'2018-11-15' AS Date), CAST(N'18:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (25, 11, 4, CAST(N'2018-11-17' AS Date), CAST(N'14:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (26, 5, 3, CAST(N'2018-11-16' AS Date), CAST(N'15:00:00' AS Time), 30.0000, 1)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (27, 3, 3, CAST(N'2018-11-16' AS Date), CAST(N'14:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (28, 5, 3, CAST(N'2018-11-15' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (29, 5, 4, CAST(N'2018-11-17' AS Date), CAST(N'17:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (30, 3, 3, CAST(N'2018-11-16' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (31, 3, 5, CAST(N'2018-11-30' AS Date), CAST(N'14:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (32, 3, 3, CAST(N'2018-11-23' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (33, 3, 3, CAST(N'2018-11-16' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (34, 3, 4, CAST(N'2018-11-16' AS Date), CAST(N'10:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (35, 4, 11, CAST(N'2018-11-16' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (36, 6, 3, CAST(N'2018-11-23' AS Date), CAST(N'14:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (37, 54, 1, CAST(N'2018-11-20' AS Date), CAST(N'20:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (38, 3, 2, CAST(N'2018-11-23' AS Date), CAST(N'14:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (39, 1, 3, CAST(N'2018-11-30' AS Date), CAST(N'13:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (40, 11, 3, CAST(N'2018-11-17' AS Date), CAST(N'16:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (41, 54, 4, CAST(N'2018-11-24' AS Date), CAST(N'16:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (42, 3, 3, CAST(N'2018-11-23' AS Date), CAST(N'11:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (43, 3, 1, CAST(N'2018-11-22' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (44, 6, 2, CAST(N'2018-11-22' AS Date), CAST(N'15:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (45, 13, 2, CAST(N'2018-11-22' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (46, 6, 7, CAST(N'2018-11-22' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (47, 5, 11, CAST(N'2018-11-22' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (48, 4, 5, CAST(N'2018-11-22' AS Date), CAST(N'16:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (49, 8, 2, CAST(N'2018-11-30' AS Date), CAST(N'12:00:00' AS Time), 30.0000, 0)
INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (50, 3, 4, CAST(N'2018-12-14' AS Date), CAST(N'15:00:00' AS Time), 30.0000, 1)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (1, N'Elnur', N'Ramazanzadə', N'0555556655')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (3, N'Vüqar', N'Ali', N'0512214785')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (4, N'Hüseyn', N'Dəmirov', N'0552224565')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (5, N'Aslan', N'Məmmədov', N'0705698547')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (6, N'Rəsul', N'Arazlı', N'0556669966')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (7, N'İsmayılov', N'Rüfət', N'0508821299')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (8, N'Mirkamal', N'Seyid', N'0505778585')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (11, N'Kamran', N'Əlibəyli', N'0554565456')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (12, N'Yolçu ', N'Nəsib', N'0556665566')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (13, N'Tofiq', N'Kərimli', N'0778885522')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (14, N'Ülvi', N'İbrahimov', N'0514564564')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (15, N'Ruslan', N'Əlibəyli', N'0556987458')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (34, N'Fariz', N'Mirzəyev', N'0556541236')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (50, N'Fikrət', N'Əmirov', N'0556987458')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (53, N'Elnur', N'Ramazanzadə ', N'0505556655')
INSERT [dbo].[Contacts] ([Id], [Name], [Surname], [Phone]) VALUES (54, N'Əliyar', N'Məmmədov', N'0702587070')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Stadiums] ON 

INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (1, N'Azfar')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (2, N'Rəvan')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (3, N'İnter')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (4, N'Azal')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (5, N'Günəş')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (7, N'Turan')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (11, N'Ulduz')
INSERT [dbo].[Stadiums] ([Id], [Name]) VALUES (22, N'Tac')
SET IDENTITY_INSERT [dbo].[Stadiums] OFF
ALTER TABLE [dbo].[Bookings] ADD  CONSTRAINT [DF_Bookings_Price]  DEFAULT ((30)) FOR [Price]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Contacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contacts] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Contacts]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Stadiums] FOREIGN KEY([StadiumId])
REFERENCES [dbo].[Stadiums] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Stadiums]
GO
USE [master]
GO
ALTER DATABASE [FootballStadium] SET  READ_WRITE 
GO
