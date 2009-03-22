/****** Object:  UserDefinedDataType [LogFileData].[udtLogTimestamp]    Script Date: 03/22/2009 17:07:47 ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udtLogTimestamp' AND ss.name = N'LogFileData')
CREATE TYPE [LogFileData].[udtLogTimestamp] FROM [varchar](7) NOT NULL
GO
