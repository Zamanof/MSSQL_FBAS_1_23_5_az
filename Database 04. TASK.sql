-- 1. En chox kitab sehifesi olan neshriyyati gosterin (2 usulla)

SELECT TOP(1) SUM(Pages) AS PagesSum, Publisher
FROM Books_En
GROUP BY Publisher
ORDER BY PagesSum DESC
















SELECT TOP(1) (
				SELECT SUM(Pages) AS PagesSum 
				FROM Books_En AS SB 
				WHERE B.Publisher = SB.Publisher) AS PageSum, Publisher
FROM Books_En AS B
ORDER BY PageSum DESC













 

-- 2. Proqramlashdirma uzre en chox kitab chap etmish
-- neshriyyati gosterin (2 usulla)

SELECT TOP(1) COUNT(*) AS BooksCount, Publisher
FROM Books_En
WHERE Topic = N'Programming'
GROUP BY Publisher
ORDER BY BooksCount DESC



-- Anomalies (INSERT, UPDATE, DELETE), Normalization (1NF, 2NF, 3NF)
-- Relations (One to One, One to Many, Many to Many)
-- DDL (CREATE, ALTER, DROP)

-- JOIN, UNION

-- VIEW, UDF, PROCEDURE

-- TRANSACTION

-- TRIGGER










SELECT TOP(1) (
				SELECT COUNT(*) AS BooksCount 
				FROM Books_En AS SB 
				WHERE B.Publisher = SB.Publisher AND Topic = N'Programming') AS BooksCount, Publisher
FROM Books_En AS B
ORDER BY BooksCount DESC












SELECT Publisher, COUNT(*) AS CountBooks
FROM Books_En
WHERE Topic = N'Programming'
GROUP BY Publisher
HAVING COUNT(*) = (
                        SELECT MAX(CountBooks) 
                        FROM (
                               SELECT COUNT(*) AS CountBooks 
							   FROM Books_En 
							   WHERE Topic = N'Programming'
							   GROUP BY Publisher
                             ) AS CountBooks
                        );

















-- 3. En chox tirajla chap edilmish kitabi gosterin (2 usulla)

SELECT TOP(1) [Name], Pressrun
FROM Books_En
ORDER BY Pressrun DESC

















SELECT [Name], Pressrun
FROM Books_En
WHERE Pressrun = (SELECT MAX(Pressrun) FROM Books_En)








