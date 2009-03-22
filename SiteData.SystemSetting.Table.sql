/****** Object:  Table [SiteData].[SystemSetting]    Script Date: 03/22/2009 17:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SiteData].[SystemSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [SiteData].[SystemSetting](
	[SettingKey] [varchar](255) NOT NULL,
	[SettingValue] [varchar](255) NULL,
 CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED 
(
	[SettingKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SITE_DATA]
) ON [SITE_DATA]
END
GO
SET ANSI_PADDING OFF
GO
