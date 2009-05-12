/****** Object:  StoredProcedure [GridProcedures].[spGetGameResults]    Script Date: 04/19/2009 22:47:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[GridProcedures].[spGetGameResults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/5/09
-- Description:	Gets the basic view of game stats for each client
-- =============================================
CREATE PROCEDURE [GridProcedures].[spGetGameResults] 
	-- Add the parameters for the stored procedure here
	@pGameID int,
	@pSortCol int = 4, 
	@pSortAsc bit = 1,
	@pStartRow int = 0,
	@pLimitRows int = 10,
	@pTotalRows int = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SortText AS varchar(100)
	DECLARE @OrderText AS varchar(4)
	DECLARE @Query AS varchar(400)

	--Results is the table we''ll return, clear it out, if it exists
	CREATE TABLE #results (
		ClientID INT NOT NULL DEFAULT 0,
		ClientName VARCHAR(45) NULL,
		TeamLogID INT NOT NULL DEFAULT 0,
		Team VARCHAR(10) NULL,
		Score INT NOT NULL DEFAULT 0,
		Kills INT NOT NULL DEFAULT 0,
		Deaths INT NOT NULL DEFAULT 0,
		TeamKills INT NOT NULL DEFAULT 0,
		SelfKills INT NOT NULL DEFAULT 0,
		CarrierKills INT NOT NULL DEFAULT 0,
		FlagRecoveries INT NOT NULL DEFAULT 0,
		FlagSteals INT NOT NULL DEFAULT 0,
		FlagPickups INT NOT NULL DEFAULT 0,
		FlagCaptures INT NOT NULL DEFAULT 0
	)

	SET @SortText = CASE @pSortCol
			WHEN 1 THEN ''ClientID''
			WHEN 2 THEN ''ClientName''
			WHEN 3 THEN ''TeamLogID''
			WHEN 4 THEN ''Team''
			WHEN 5 THEN ''Score''
			WHEN 6 THEN ''Kills''
			WHEN 7 THEN ''Deaths''
			WHEN 8 THEN ''TeamKills''
			WHEN 9 THEN ''SelfKills''
			WHEN 10 THEN ''CarrierKills''
			WHEN 11 THEN ''FlagRecoveries''
			WHEN 12 THEN ''FlagSteals''
			WHEN 13 THEN ''FlagPickups''
			WHEN 14 THEN ''FlagCaptures'' END
	
	IF @pSortAsc = 1 
		BEGIN
			SET @OrderText = ''ASC''
		END
	ELSE
		BEGIN
			SET @OrderText = ''DESC''
		END

	-- For now, insert one row per EVERY client in the game
	INSERT INTO #results (ClientID, ClientName, TeamLogID, Team, Score)
	SELECT c.ClientID, c.ClientName, c.TeamLogID, Calculations.fnGetTeamColor(c.TeamLogID), IsNull(c.Score, 0)
	FROM CalculatedData.Game g
		LEFT JOIN CalculatedData.Client c ON c.fkGameID = g.GameID
	WHERE g.GameID = @pGameID

	-- Now, update the kill and death totals for each client row
	UPDATE #results SET Kills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
	)
	
	UPDATE #results SET Deaths = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkVictimClientID = ClientID
	)

	UPDATE #results SET TeamKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
			INNER JOIN CalculatedData.Client c1 ON c1.ClientID = k.fkVictimClientID
			INNER JOIN CalculatedData.Client c2 ON c2.ClientID = k.fkKillerClientID
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = #results.ClientID
			AND c1.TeamLogID = c2.TeamLogID
	)

	UPDATE #results SET SelfKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.fkVictimClientID = ClientID
	)
	
	UPDATE #results SET CarrierKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.IsCarrierKill = 1
	)

	--Now, update the flag totals
	UPDATE #results SET FlagRecoveries = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
			WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagRecovery = 1
	)

	UPDATE #results SET FlagSteals = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagSteal = 1
	)

	UPDATE #results SET FlagPickups = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagPickup = 1
	)

	UPDATE #results SET FlagCaptures = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagCapture = 1
	)

	-- Remove non-important clients from results
	DELETE
	FROM #results
	WHERE clientID IN (
		SELECT c.clientID
		FROM CalculatedData.Client c
		WHERE c.fkGameID = @pGameID
			AND c.IsFinalClient = 0
	) AND FlagCaptures = 0;

	-- Since all these vars are either int parameters or built in this SP,
	-- there shouldn''t be any dynamic SQL injection risk here.
	-- We want to select the top x rows with an n offset from the top,
	-- according to whatever the chosen ordering is.
	SET @Query = 
		''SELECT TOP '' + CAST(@pLimitRows AS varchar) + '' r.* '' +
		''FROM #results r '' +
		''WHERE ClientID NOT IN ( '' +
		''	SELECT TOP '' + CAST(@pStartRow AS varchar) + '' ri.ClientID '' + 
		''	FROM #results ri '' +
		''	ORDER BY ri.'' + @SortText + '' '' + @OrderText + '' '' +
		'') '' +
		''ORDER BY '' + @SortText + '' '' + @OrderText
	EXEC(@Query)

	-- Set the output par to the count
	SET @pTotalRows = @@ROWCOUNT
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[GridProcedures].[spGetGameResults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/5/09
-- Description:	Gets the basic view of game stats for each client
-- =============================================
CREATE PROCEDURE [GridProcedures].[spGetGameResults] 
	-- Add the parameters for the stored procedure here
	@pGameID int,
	@pSortCol int = 4, 
	@pSortAsc bit = 1,
	@pStartRow int = 0,
	@pLimitRows int = 10,
	@pTotalRows int = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SortText AS varchar(100)
	DECLARE @OrderText AS varchar(4)
	DECLARE @Query AS varchar(400)

	--Results is the table we''ll return, clear it out, if it exists
	CREATE TABLE #results (
		ClientID INT NOT NULL DEFAULT 0,
		ClientName VARCHAR(45) NULL,
		TeamLogID INT NOT NULL DEFAULT 0,
		Team VARCHAR(10) NULL,
		Score INT NOT NULL DEFAULT 0,
		Kills INT NOT NULL DEFAULT 0,
		Deaths INT NOT NULL DEFAULT 0,
		TeamKills INT NOT NULL DEFAULT 0,
		SelfKills INT NOT NULL DEFAULT 0,
		CarrierKills INT NOT NULL DEFAULT 0,
		FlagRecoveries INT NOT NULL DEFAULT 0,
		FlagSteals INT NOT NULL DEFAULT 0,
		FlagPickups INT NOT NULL DEFAULT 0,
		FlagCaptures INT NOT NULL DEFAULT 0
	)

	SET @SortText = CASE @pSortCol
			WHEN 1 THEN ''ClientID''
			WHEN 2 THEN ''ClientName''
			WHEN 3 THEN ''TeamLogID''
			WHEN 4 THEN ''Team''
			WHEN 5 THEN ''Score''
			WHEN 6 THEN ''Kills''
			WHEN 7 THEN ''Deaths''
			WHEN 8 THEN ''TeamKills''
			WHEN 9 THEN ''SelfKills''
			WHEN 10 THEN ''CarrierKills''
			WHEN 11 THEN ''FlagRecoveries''
			WHEN 12 THEN ''FlagSteals''
			WHEN 13 THEN ''FlagPickups''
			WHEN 14 THEN ''FlagCaptures'' END
	
	IF @pSortAsc = 1 
		BEGIN
			SET @OrderText = ''ASC''
		END
	ELSE
		BEGIN
			SET @OrderText = ''DESC''
		END

	-- For now, insert one row per EVERY client in the game
	INSERT INTO #results (ClientID, ClientName, TeamLogID, Team, Score)
	SELECT c.ClientID, c.ClientName, c.TeamLogID, Calculations.fnGetTeamColor(c.TeamLogID), IsNull(c.Score, 0)
	FROM CalculatedData.Game g
		LEFT JOIN CalculatedData.Client c ON c.fkGameID = g.GameID
	WHERE g.GameID = @pGameID

	-- Now, update the kill and death totals for each client row
	UPDATE #results SET Kills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
	)
	
	UPDATE #results SET Deaths = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkVictimClientID = ClientID
	)

	UPDATE #results SET TeamKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
			INNER JOIN CalculatedData.Client c1 ON c1.ClientID = k.fkVictimClientID
			INNER JOIN CalculatedData.Client c2 ON c2.ClientID = k.fkKillerClientID
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = #results.ClientID
			AND c1.TeamLogID = c2.TeamLogID
	)

	UPDATE #results SET SelfKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.fkVictimClientID = ClientID
	)
	
	UPDATE #results SET CarrierKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.IsCarrierKill = 1
	)

	--Now, update the flag totals
	UPDATE #results SET FlagRecoveries = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
			WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagRecovery = 1
	)

	UPDATE #results SET FlagSteals = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagSteal = 1
	)

	UPDATE #results SET FlagPickups = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagPickup = 1
	)

	UPDATE #results SET FlagCaptures = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagCapture = 1
	)

	-- Remove non-important clients from results
	DELETE
	FROM #results
	WHERE clientID IN (
		SELECT c.clientID
		FROM CalculatedData.Client c
		WHERE c.fkGameID = @pGameID
			AND c.IsFinalClient = 0
	) AND FlagCaptures = 0;

	-- Since all these vars are either int parameters or built in this SP,
	-- there shouldn''t be any dynamic SQL injection risk here.
	-- We want to select the top x rows with an n offset from the top,
	-- according to whatever the chosen ordering is.
	SET @Query = 
		''SELECT TOP '' + CAST(@pLimitRows AS varchar) + '' r.* '' +
		''FROM #results r '' +
		''WHERE ClientID NOT IN ( '' +
		''	SELECT TOP '' + CAST(@pStartRow AS varchar) + '' ri.ClientID '' + 
		''	FROM #results ri '' +
		''	ORDER BY ri.'' + @SortText + '' '' + @OrderText + '' '' +
		'') '' +
		''ORDER BY '' + @SortText + '' '' + @OrderText
	EXEC(@Query)

	-- Set the output par to the count
	SET @pTotalRows = @@ROWCOUNT
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[GridProcedures].[spGetGameResults]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/5/09
-- Description:	Gets the basic view of game stats for each client
-- =============================================
CREATE PROCEDURE [GridProcedures].[spGetGameResults] 
	-- Add the parameters for the stored procedure here
	@pGameID int,
	@pSortCol int = 4, 
	@pSortAsc bit = 1,
	@pStartRow int = 0,
	@pLimitRows int = 10,
	@pTotalRows int = 0 OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @SortText AS varchar(100)
	DECLARE @OrderText AS varchar(4)
	DECLARE @Query AS varchar(400)

	--Results is the table we''ll return, clear it out, if it exists
	CREATE TABLE #results (
		ClientID INT NOT NULL DEFAULT 0,
		ClientName VARCHAR(45) NULL,
		TeamLogID INT NOT NULL DEFAULT 0,
		Team VARCHAR(10) NULL,
		Score INT NOT NULL DEFAULT 0,
		Kills INT NOT NULL DEFAULT 0,
		Deaths INT NOT NULL DEFAULT 0,
		TeamKills INT NOT NULL DEFAULT 0,
		SelfKills INT NOT NULL DEFAULT 0,
		CarrierKills INT NOT NULL DEFAULT 0,
		FlagRecoveries INT NOT NULL DEFAULT 0,
		FlagSteals INT NOT NULL DEFAULT 0,
		FlagPickups INT NOT NULL DEFAULT 0,
		FlagCaptures INT NOT NULL DEFAULT 0
	)

	SET @SortText = CASE @pSortCol
			WHEN 1 THEN ''ClientID''
			WHEN 2 THEN ''ClientName''
			WHEN 3 THEN ''TeamLogID''
			WHEN 4 THEN ''Team''
			WHEN 5 THEN ''Score''
			WHEN 6 THEN ''Kills''
			WHEN 7 THEN ''Deaths''
			WHEN 8 THEN ''TeamKills''
			WHEN 9 THEN ''SelfKills''
			WHEN 10 THEN ''CarrierKills''
			WHEN 11 THEN ''FlagRecoveries''
			WHEN 12 THEN ''FlagSteals''
			WHEN 13 THEN ''FlagPickups''
			WHEN 14 THEN ''FlagCaptures'' END
	
	IF @pSortAsc = 1 
		BEGIN
			SET @OrderText = ''ASC''
		END
	ELSE
		BEGIN
			SET @OrderText = ''DESC''
		END

	-- For now, insert one row per EVERY client in the game
	INSERT INTO #results (ClientID, ClientName, TeamLogID, Team, Score)
	SELECT c.ClientID, c.ClientName, c.TeamLogID, Calculations.fnGetTeamColor(c.TeamLogID), IsNull(c.Score, 0)
	FROM CalculatedData.Game g
		LEFT JOIN CalculatedData.Client c ON c.fkGameID = g.GameID
	WHERE g.GameID = @pGameID

	-- Now, update the kill and death totals for each client row
	UPDATE #results SET Kills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
	)
	
	UPDATE #results SET Deaths = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkVictimClientID = ClientID
	)

	UPDATE #results SET TeamKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
			INNER JOIN CalculatedData.Client c1 ON c1.ClientID = k.fkVictimClientID
			INNER JOIN CalculatedData.Client c2 ON c2.ClientID = k.fkKillerClientID
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = #results.ClientID
			AND c1.TeamLogID = c2.TeamLogID
	)

	UPDATE #results SET SelfKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.fkVictimClientID = ClientID
	)
	
	UPDATE #results SET CarrierKills = (
		SELECT COUNT(*)
		FROM CalculatedData.[Kill] k
		WHERE k.fkGameID = @pGameID
			AND k.fkKillerClientID = ClientID
			AND k.IsCarrierKill = 1
	)

	--Now, update the flag totals
	UPDATE #results SET FlagRecoveries = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
			WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagRecovery = 1
	)

	UPDATE #results SET FlagSteals = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagSteal = 1
	)

	UPDATE #results SET FlagPickups = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagPickup = 1
	)

	UPDATE #results SET FlagCaptures = (
		SELECT COUNT(*)
		FROM CalculatedData.ClientToItem ci
		WHERE ci.fkGameID = @pGameID
			AND ci.fkClientID = ClientID
			AND ci.IsFlagCapture = 1
	)

	-- Remove non-important clients from results
	DELETE
	FROM #results
	WHERE clientID IN (
		SELECT c.clientID
		FROM CalculatedData.Client c
		WHERE c.fkGameID = @pGameID
			AND c.IsFinalClient = 0
	) AND FlagCaptures = 0;

	-- Since all these vars are either int parameters or built in this SP,
	-- there shouldn''t be any dynamic SQL injection risk here.
	-- We want to select the top x rows with an n offset from the top,
	-- according to whatever the chosen ordering is.
	SET @Query = 
		''SELECT TOP '' + CAST(@pLimitRows AS varchar) + '' r.* '' +
		''FROM #results r '' +
		''WHERE ClientID NOT IN ( '' +
		''	SELECT TOP '' + CAST(@pStartRow AS varchar) + '' ri.ClientID '' + 
		''	FROM #results ri '' +
		''	ORDER BY ri.'' + @SortText + '' '' + @OrderText + '' '' +
		'') '' +
		''ORDER BY '' + @SortText + '' '' + @OrderText
	EXEC(@Query)

	-- Set the output par to the count
	SET @pTotalRows = @@ROWCOUNT
END
' 
END
GO
