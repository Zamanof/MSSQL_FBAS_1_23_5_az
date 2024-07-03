/*
CREATE [CLUSTERED | NONCLUSTERED] INDEX <index_name>
ON <table_name> | <view_name>
(field_name1 [ASC | DESC],
...)
*/

USE [master]

GO

CREATE DATABASE Test

GO

USE [Test] 

GO

CREATE TABLE TableInHeap(
Id int NOT NULL,
Field1 char(36) NOT NULL,
Field2 char(216) NOT NULL,
)

GO

--CREATE PROC ShowInfo_TableInHeap
--AS
--BEGIN
--	SELECT OBJECT_NAME(object_id) AS table_name,
--			[name] AS index_name, [type_desc]
--	FROM sys.indexes
--	WHERE object_id = OBJECT_ID(N'TableInHeap')

--	SELECT index_type_desc, page_count, record_count, avg_page_space_used_in_percent
--	FROM sys.dm_db_index_physical_stats(DB_ID(N'Test'), 
--	OBJECT_ID(N'TableInHeap'), NULL, NULL, 'DETAILED')

--	EXEC dbo.sp_spaceused N'TableInHeap'
--END

GO

EXEC ShowInfo_TableInHeap

--INSERT INTO TableInHeap(Id, Field1, Field2)
--VALUES(1, 'a', 'b')

--DECLARE @i AS int = 31
--WHILE @i < 3000000
--BEGIN
--	INSERT INTO TableInHeap(Id, Field1, Field2)
--	VALUES(@i, 'a', 'b')
--	SET @i += 1
--END

--CREATE CLUSTERED INDEX Index1
--ON TableInHeap(Id)

--DECLARE @StartTime datetime2, @EndTime datetime2
--SET @StartTime = SYSDATETIME()

--SELECT * 
--FROM TableInHeap
--WHERE Id = 2999990

--SET @EndTime = SYSDATETIME()

--SELECT DATEDIFF(NANOSECOND, @StartTime, @EndTime) AS [Duration in nanoseconds]

-- without index - 72993900 nanoseconds
-- with index - 1999200 nanoseconds