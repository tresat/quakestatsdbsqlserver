/****** Object:  Table [CalculatedData].[GameEvents]    Script Date: 04/19/2009 22:47:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[GameEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[GameEvents](
	[PrimaryID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[EventTime] [bigint] NULL,
	[LineNo] [int] NULL,
	[EventType] [varchar](12) NOT NULL,
	[ClientID1] [int] NULL,
	[ClientTeam1] [varchar](10) NULL,
	[ClientID2] [int] NULL,
	[ClientTeam2] [varchar](10) NULL,
	[ItemName] [varchar](100) NULL,
	[WeaponName] [varchar](45) NULL
) ON [SITE_DATA]
END
GO
SET ANSI_PADDING OFF
GO
GRANT DELETE ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT INSERT ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT SELECT ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT UPDATE ON [CalculatedData].[GameEvents] TO [public]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CalculatedData].[GameEvents]') AND type in (N'U'))
BEGIN
CREATE TABLE [CalculatedData].[GameEvents](
	[PrimaryID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[EventTime] [bigint] NULL,
	[LineNo] [int] NULL,
	[EventType] [varchar](12) NOT NULL,
	[ClientID1] [int] NULL,
	[ClientTeam1] [varchar](10) NULL,
	[ClientID2] [int] NULL,
	[ClientTeam2] [varchar](10) NULL,
	[ItemName] [varchar](100) NULL,
	[WeaponName] [varchar](45) NULL
) ON [SITE_DATA]
END
GO
SET ANSI_PADDING OFF
GO
GRANT DELETE ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT INSERT ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT SELECT ON [CalculatedData].[GameEvents] TO [public]
GO
GRANT UPDATE ON [CalculatedData].[GameEvents] TO [public]
GO
