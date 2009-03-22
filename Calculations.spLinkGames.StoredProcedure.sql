/****** Object:  StoredProcedure [Calculations].[spLinkGames]    Script Date: 03/22/2009 17:07:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkGames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Links games to adjacent games.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkGames]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Have to link previous game in separate update from next game, since
	-- fnGetNextGame function requires previous game id being set.
	UPDATE CalculatedData.Game
	SET fkPreviousGameID = Calculations.fnGetPreviousGame(GameID)

	UPDATE CalculatedData.Game
	SET fkNextGameID = Calculations.fnGetNextGame(GameID)
END
' 
END
GO
