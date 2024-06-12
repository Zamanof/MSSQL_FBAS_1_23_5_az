-- Single line comment
/*
Multi Line
Comment

*/
USE Students

-- https://learn.microsoft.com/en-us/sql/t-sql/statements/statements?view=sql-server-ver16

-- SELECT - verilenlerin sechilmesi
-- FROM -	verilenlerin menbeyi

--SELECT *
--FROM Students

--SELECT Age, FirstName, LastName
--FROM Students

-- alias
--SELECT 2024 - Age AS BornYear
--FROM Students

--SELECT 2024 - Age AS [Born Year]
--FROM Students

--SELECT FirstName + ' ' + LastName AS FullName
--FROM Students

--SELECT [Group]
--FROM Students

-- DISTINCT - tekrarlnan melumatlari, unikal olaraq 
-- sechmeye imkan verir
--SELECT DISTINCT [Group]
--FROM Students


-- ORDER BY - cheshidleme (sort)
-- ASC - (by default) azdan->choxa, DESC - choxdan->aza
--SELECT *
--FROM Students
--ORDER BY FirstName

--SELECT *
--FROM Students
--ORDER BY FirstName ASC, Age DESC

-- WHERE - sverilenlerin mueyyen shertler esasinda sechilmesi
-- = - Equal, != (<>) - not equal,
-- >, >=, <, <=

SELECT FirstName, LastName, [Group]
FROM Students
WHERE [Group] = 'A8'
ORDER BY LastName

--SELECT *
--FROM Students
--WHERE Age <= 55

--SELECT *
--FROM Students
--WHERE FirstName != '־כüדא'

-- AND, OR, NOT
--SELECT *
--FROM Students
--WHERE FirstName = '־כüדא' AND Age < 70

--SELECT *
--FROM Students
--WHERE FirstName = '־כüדא' OR Age < 70

--SELECT *
--FROM Students
--WHERE NOT FirstName = '־כüדא' OR Age < 70

-- IS NULL, IS NOT NULL - NULL deyerin yoxlanilmasi

--SELECT *
--FROM Students
--WHERE [Group] IS NULL

-- IN, BETWEEN

--SELECT *
--FROM Students
--WHERE Age >= 58 AND Age <= 80

--SELECT *
--FROM Students
--WHERE Age BETWEEN 58 AND 80

--SELECT *
--FROM Students
--WHERE FirstName = '־כüדא' OR FirstName = 'Þנטי'

--SELECT *
--FROM Students
--WHERE FirstName IN('־כüדא', 'Þנטי')