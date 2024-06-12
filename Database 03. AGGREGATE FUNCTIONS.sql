-- Aggregate functions
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver16

-- SUM(column_name) - moterizede gosterilen sutundaki datalarin 
-- cemini qaytarir

SELECT *
FROM Books_En


--SELECT SUM(Pages) AS AllPages
--FROM Books_En

--SELECT SUM(Pages) AS TutorialsPages
--FROM Books_En
--WHERE Category = N'Tutorials'


-- COUNT(*|column_name) - setirlerin sayini qaytarir

--SELECT COUNT(*) AS BookCounts
--FROM Books_En

--SELECT COUNT(DISTINCT Category) AS CategoryCounts
--FROM Books_En


-- AVG(column_name) - gosterilen sutunun ededi ortasini qaytarir

--SELECT AVG(Price) AS PriceAverage
--FROM Books_En

-- MIN, MAX
--SELECT MIN(Price) AS PriceMin
--FROM Books_En

--SELECT MAX(Price) AS PriceMin
--FROM Books_En

