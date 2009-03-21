/****** Object:  StoredProcedure [Utility].[spInitDB]    Script Date: 03/20/2009 07:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		tom
-- Create date: 3/15/09
-- Description:	Adds nessecary starting data to the database.
-- =============================================
CREATE PROCEDURE [Utility].[spInitDB]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @LastID INT
	SET @LastID = 0

	-- Create basic game types
	IF NOT EXISTS (SELECT 1 FROM CalculatedData.GameType WHERE GametypeLogID = 0)
		BEGIN 
			INSERT INTO CalculatedData.GameType (GametypeLogID, GametypeName, IsTeamGame)
			VALUES (0, 'Free For All', 0)
		END

	IF NOT EXISTS (SELECT 1 FROM CalculatedData.GameType WHERE GametypeLogID = 4)
		BEGIN
			INSERT INTO CalculatedData.GameType (GametypeLogID, GametypeName, IsTeamGame)
			VALUES (4, 'Team Capture the Flag', 1)
		END

	-- Last parsed line = 0
	IF NOT EXISTS (SELECT 1 FROM SiteData.SystemSetting WHERE SettingKey = 'LastParsedLineNo')
		BEGIN
			INSERT INTO SiteData.SystemSetting(SettingKey, SettingValue)
			VALUES ('LastParsedLineNo', '0')
		END
	ELSE
		BEGIN
			UPDATE SiteData.SystemSetting
			SET SettingValue = '0'
			WHERE SettingKey = 'LastParsedLineNo'
		END

	-- Last parsed log line = 0
	IF NOT EXISTS (SELECT 1 FROM SiteData.SystemSetting WHERE SettingKey = 'LastSavedLogFileDataLineNo')
		BEGIN
			INSERT INTO SiteData.SystemSetting(SettingKey, SettingValue)
			VALUES ('LastSavedLogFileDataLineNo', '0')
		END
	ELSE
		BEGIN
			UPDATE SiteData.SystemSetting
			SET SettingValue = '0'
			WHERE SettingKey = 'LastSavedLogFileDataLineNo'
		END

	-- Create basic data procedure access rights
/*
	INSERT INTO dataprocedure(DataProcedureName)
	VALUES ('spdpGetGameResults')

	SET @LastID = @@IDENTITY;

	INSERT INTO dataproceduresecurity(fkDataProcedureID, Role)
	VALUES (vLastID, 'admin');
	INSERT INTO dataproceduresecurity(fkDataProcedureID, Role)
	VALUES (vLastID, 'user');
*/
	-- Assign known map aliases
	UPDATE CalculatedData.Map SET MapAlias = 'Castle' WHERE MapName = 'actf30'
	UPDATE CalculatedData.Map SET MapAlias = 'Stronghold' WHERE MapName = 'actf33'
	UPDATE CalculatedData.Map SET MapAlias = 'Feel the Base' WHERE MapName = 'actf38'

	UPDATE CalculatedData.Map SET MapAlias = 'Frozen Colors' WHERE MapName = 'frozencolors'

	UPDATE CalculatedData.Map SET MapAlias = 'Nebulus' WHERE MapName = 'lzctf1'

	UPDATE CalculatedData.Map SET MapAlias = 'Inner Sanctums' WHERE MapName = 'mpteam3'
	UPDATE CalculatedData.Map SET MapAlias = 'Scornforge' WHERE MapName = 'mpteam4'
	UPDATE CalculatedData.Map SET MapAlias = 'Vortex Portal' WHERE MapName = 'mpteam6'
	UPDATE CalculatedData.Map SET MapAlias = 'The Capture Chamber' WHERE MapName = 'mpteam7'

	UPDATE CalculatedData.Map SET MapAlias = 'Dueling Keeps 2' WHERE MapName = 'mpq3ctf1'
	UPDATE CalculatedData.Map SET MapAlias = 'Beyond Reality' WHERE MapName = 'mpq3tourney6'

	UPDATE CalculatedData.Map SET MapAlias = 'Dueling Keeps' WHERE MapName = 'q3ctf1'

	UPDATE CalculatedData.Map SET MapAlias = 'Powerstation 0218' WHERE MapName = 'q3tourney1'
	UPDATE CalculatedData.Map SET MapAlias = 'Hell''s Gate' WHERE MapName = 'q3tourney3'

	UPDATE CalculatedData.Map SET MapAlias = 'Spider Crossings' WHERE MapName = 'q3wcp9'
	UPDATE CalculatedData.Map SET MapAlias = 'Coral CTF ''The Beach''' WHERE MapName = 'q3wcp16'
	UPDATE CalculatedData.Map SET MapAlias = 'Divided Crossings' WHERE MapName = 'q3wcp17'
	UPDATE CalculatedData.Map SET MapAlias = 'The Vast and the Furious' WHERE MapName = 'q3wcp23'

	UPDATE CalculatedData.Map SET MapAlias = 'Silly Shootings' WHERE MapName = 'q3wxs2'
END
GO
