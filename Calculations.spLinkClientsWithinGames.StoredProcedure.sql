/****** Object:  StoredProcedure [Calculations].[spLinkClientsWithinGames]    Script Date: 04/19/2009 22:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkClientsWithinGames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/23/09
-- Description:	Within each game, links clients to next/previous client, as far as can be established.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkClientsWithinGames]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Don''t worry about name matching here, or team matching.  We want a client to 
		have its next/previous client linked to what it changed to/became.  So client1
		could be nexted by client2, and both be on different teams.  This is fine. */

	UPDATE CalculatedData.Client
	SET fkNextClientID = (
		SELECT nc.ClientID
		FROM CalculatedData.Client nc
		WHERE nc.fkGameID = c.fkGameID
			AND nc.ClientLogID = c.ClientLogID
			AND nc.ClientFirstAppearLineNumber = c.ClientEndLineNumber
	)
	FROM CalculatedData.Client c

	UPDATE CalculatedData.Client
	SET fkPreviousClientID = (
		SELECT pc.ClientID
		FROM CalculatedData.Client pc
		WHERE pc.fkGameID = c.fkGameID
			AND pc.ClientLogID = c.ClientLogID
			AND pc.ClientEndLineNumber = c.ClientFirstAppearLineNumber
	)
	FROM CalculatedData.Client c
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkClientsWithinGames]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/23/09
-- Description:	Within each game, links clients to next/previous client, as far as can be established.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkClientsWithinGames]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Don''t worry about name matching here, or team matching.  We want a client to 
		have its next/previous client linked to what it changed to/became.  So client1
		could be nexted by client2, and both be on different teams.  This is fine. */

	UPDATE CalculatedData.Client
	SET fkNextClientID = (
		SELECT nc.ClientID
		FROM CalculatedData.Client nc
		WHERE nc.fkGameID = c.fkGameID
			AND nc.ClientLogID = c.ClientLogID
			AND nc.ClientFirstAppearLineNumber = c.ClientEndLineNumber
	)
	FROM CalculatedData.Client c

	UPDATE CalculatedData.Client
	SET fkPreviousClientID = (
		SELECT pc.ClientID
		FROM CalculatedData.Client pc
		WHERE pc.fkGameID = c.fkGameID
			AND pc.ClientLogID = c.ClientLogID
			AND pc.ClientEndLineNumber = c.ClientFirstAppearLineNumber
	)
	FROM CalculatedData.Client c
END
' 
END
GO
