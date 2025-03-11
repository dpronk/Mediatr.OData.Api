﻿USE [Examples]
GO
/****** Object:  Table [dbo].[Afdeling]    Script Date: 17/02/2025 10:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Afdeling](
	[Sleutel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[BedrijfId] [int] NULL,
 CONSTRAINT [PK_Afdeling] PRIMARY KEY CLUSTERED 
(
	[Sleutel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bedrijf]    Script Date: 17/02/2025 10:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bedrijf](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_Bedrijf] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medewerkers]    Script Date: 17/02/2025 10:24:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medewerkers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[AfdelingId] [int] NULL,
 CONSTRAINT [PK_Medewerkers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Afdeling]  WITH CHECK ADD  CONSTRAINT [FK_Afdeling_Bedrijf] FOREIGN KEY([BedrijfId])
REFERENCES [dbo].[Bedrijf] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Afdeling] CHECK CONSTRAINT [FK_Afdeling_Bedrijf]
GO
ALTER TABLE [dbo].[Medewerkers]  WITH CHECK ADD  CONSTRAINT [FK_Medewerkers_Afdeling] FOREIGN KEY([AfdelingId])
REFERENCES [dbo].[Afdeling] ([Sleutel])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Medewerkers] CHECK CONSTRAINT [FK_Medewerkers_Afdeling]
GO