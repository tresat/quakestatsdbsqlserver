SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Calculations].[fnGetTeamColor]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		tom
-- Create date: 3/21/09
-- Description:	Returns a name as string from the team log number.
-- =============================================
CREATE FUNCTION [Calculations].[fnGetTeamColor]
(
	@TeamLogID int
)
RETURNS varchar(10)
AS
BEGIN
	RETURN (SELECT CASE @TeamLogID WHEN 1 THEN ''Red''
                                WHEN 2 THEN ''Blue'' 
								ELSE ''UNKNOWN'' END);
END
' 
END
GO
