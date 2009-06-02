IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'udtLogTimestamp' AND ss.name = N'LogFileData')
CREATE TYPE [LogFileData].[udtLogTimestamp] FROM [varchar](7) NOT NULL
GO
