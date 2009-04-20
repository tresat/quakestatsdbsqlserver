/****** Object:  StoredProcedure [Calculations].[spLinkServerUppages]    Script Date: 04/19/2009 22:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkServerUppages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/19/09
-- Description:	Links adjacent server uppages.  No dependencies.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkServerUppages]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Set the previous uppage ID = to the ID of the uppage where the start
		game delimiter line is the largest possible prior to the current
		uppage''s start game delimiter line, and the gdl represents the first
		line in an uppage. */
	UPDATE CalculatedData.ServerUppage
	SET fkPreviousServerUppageID = (
		SELECT sup.ServerUppageID
		FROM CalculatedData.ServerUppage sup
		WHERE sup.fkBeginGameDelimiterLineNumber = (
			SELECT Max(gdl.LineNumber)
			FROM LogFileData.GameDelimiterLine gdl
			WHERE gdl.IsFirstLineInUppage = 1
				AND gdl.LineNumber < su.fkBeginGameDelimiterLineNumber
		)
	)
	FROM CalculatedData.ServerUppage su

	/* And just reverse the signs here, the same logic will work. */
	UPDATE CalculatedData.ServerUppage
	SET fkNextServerUppageID = (
		SELECT sun.ServerUppageID
		FROM CalculatedData.ServerUppage sun
		WHERE sun.fkBeginGameDelimiterLineNumber = (
			SELECT Min(gdl.LineNumber)
			FROM LogFileData.GameDelimiterLine gdl
			WHERE gdl.IsFirstLineInUppage = 1
				AND gdl.LineNumber > su.fkBeginGameDelimiterLineNumber
		)
	)
	FROM CalculatedData.ServerUppage su
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[spLinkServerUppages]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 4/19/09
-- Description:	Links adjacent server uppages.  No dependencies.
-- =============================================
CREATE PROCEDURE [Calculations].[spLinkServerUppages]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/* Set the previous uppage ID = to the ID of the uppage where the start
		game delimiter line is the largest possible prior to the current
		uppage''s start game delimiter line, and the gdl represents the first
		line in an uppage. */
	UPDATE CalculatedData.ServerUppage
	SET fkPreviousServerUppageID = (
		SELECT sup.ServerUppageID
		FROM CalculatedData.ServerUppage sup
		WHERE sup.fkBeginGameDelimiterLineNumber = (
			SELECT Max(gdl.LineNumber)
			FROM LogFileData.GameDelimiterLine gdl
			WHERE gdl.IsFirstLineInUppage = 1
				AND gdl.LineNumber < su.fkBeginGameDelimiterLineNumber
		)
	)
	FROM CalculatedData.ServerUppage su

	/* And just reverse the signs here, the same logic will work. */
	UPDATE CalculatedData.ServerUppage
	SET fkNextServerUppageID = (
		SELECT sun.ServerUppageID
		FROM CalculatedData.ServerUppage sun
		WHERE sun.fkBeginGameDelimiterLineNumber = (
			SELECT Min(gdl.LineNumber)
			FROM LogFileData.GameDelimiterLine gdl
			WHERE gdl.IsFirstLineInUppage = 1
				AND gdl.LineNumber > su.fkBeginGameDelimiterLineNumber
		)
	)
	FROM CalculatedData.ServerUppage su
END
' 
END
GO
