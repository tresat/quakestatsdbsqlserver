/****** Object:  StoredProcedure [Utility].[spResetDB]    Script Date: 03/22/2009 17:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Utility].[spResetDB]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/15/09
-- Description:	Empties the database.
-- =============================================
CREATE PROCEDURE [Utility].[spResetDB]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Clear calculated data tables
	DELETE FROM CalculatedData.[Kill]
	DELETE FROM CalculatedData.[Dialog]
	DELETE FROM CalculatedData.ClientToItem
	DELETE FROM CalculatedData.ClientData

	UPDATE CalculatedData.Client
	SET fkPreviousClientID = NULL,
		fknextclientID = NULL
	DELETE FROM CalculatedData.Client

	DELETE FROM CalculatedData.Item
	DELETE FROM CalculatedData.Weapon
	DELETE FROM CalculatedData.GameData

	UPDATE CalculatedData.Game
	SET fkPreviousGameID = NULL,
		  fkNextGameID = NULL
	DELETE FROM CalculatedData.Game

	UPDATE CalculatedData.ServerUppage
	SET fkPreviousServerUppageID = NULL,
		fkNextServerUppageID = NULL
	DELETE FROM CalculatedData.ServerUppage

	DELETE FROM SiteData.SystemSetting
	WHERE SettingKey IN (''LastParsedLineNo'', ''CurrentServerUppageID'', ''LastSavedGameShutdownLineNo'', ''LastSavedLogFileDataLineNo'')

	-- Clear out log file tables
	DELETE FROM LogFileData.BlueLine
	DELETE FROM LogFileData.ClientBeginLine
	DELETE FROM LogFileData.ClientConnectLine
	DELETE FROM LogFileData.ClientDisconnectLine
	DELETE FROM LogFileData.ClientUserinfoChangedLine
	DELETE FROM LogFileData.ExitLine
	DELETE FROM LogFileData.GameDelimiterLine
	DELETE FROM LogFileData.InitGameLine
	DELETE FROM LogFileData.ItemLine
	DELETE FROM LogFileData.KillLine
	DELETE FROM LogFileData.RedLine
	DELETE FROM LogFileData.SayLine
	DELETE FROM LogFileData.SayTeamLine
	DELETE FROM LogFileData.ScoreLine
	DELETE FROM LogFileData.ShutdownGameLine
	DELETE FROM LogFileData.TellLine
	DELETE FROM LogFileData.VTellLine
	DELETE FROM LogFileData.WarmupLine
END
' 
END
GO
