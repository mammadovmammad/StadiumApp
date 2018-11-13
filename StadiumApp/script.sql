USE [FootballStadium]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 13.11.2018 23:23:19 ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 13.11.2018 23:23:19 ******/
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
/****** Object:  Table [dbo].[Stadiums]    Script Date: 13.11.2018 23:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stadiums](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Stadiums] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([Id], [ContactId], [StadiumId], [Date], [Time], [Price], [IsPlayed]) VALUES (1, 1, 1, CAST(N'2018-11-13' AS Date), CAST(N'20:00:00' AS Time), 30.0000, 0)
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
SET IDENTITY_INSERT [dbo].[Contacts] OFF
SET IDENTITY_INSERT [dbo].[Stadiums] ON 

INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (1, N'Azfar', N'0506665544')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (2, N'Rəvan', N'0701455896')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (3, N'İnter', N'0559632545')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (4, N'Azal', N'0775489632')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (5, N'Günəş', N'0552132547')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (6, N'Aura', N'0514569874')
INSERT [dbo].[Stadiums] ([Id], [Name], [Phone]) VALUES (7, N'Turan', N'0556665544')
SET IDENTITY_INSERT [dbo].[Stadiums] OFF
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
