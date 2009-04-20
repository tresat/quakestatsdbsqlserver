/****** Object:  UserDefinedFunction [Calculations].[fnGetNextGame]    Script Date: 04/19/2009 22:48:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetNextGame]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Links a game to the next game; relies on previous game linking already being done.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetNextGame] 
(
	-- Add the parameters for the function here
	@GameID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	SELECT @Result = ng.GameID
	FROM CalculatedData.Game g
		INNER JOIN CalculatedData.Game ng ON ng.fkPreviousGameID = g.GameID

	-- Return the result of the function
	RETURN @Result
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetNextGame]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/22/09
-- Description:	Links a game to the next game; relies on previous game linking already being done.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetNextGame] 
(
	-- Add the parameters for the function here
	@GameID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result int

	SELECT @Result = ng.GameID
	FROM CalculatedData.Game g
		INNER JOIN CalculatedData.Game ng ON ng.fkPreviousGameID = g.GameID

	-- Return the result of the function
	RETURN @Result
END
' 
END
GO
