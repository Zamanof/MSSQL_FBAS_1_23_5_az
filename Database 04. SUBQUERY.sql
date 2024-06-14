-- Subquery (Alt sorgular)

-- Alt sorqular SELECT, FROM, WHERE komandalarindan biri uchun yazila
-- biler. Korelyasiya olunan (Elaqeli) 
-- ve Korelyasiya olunmayan (elaqesiz)
-- altsorqular ola biler
-- 1, 2, 4 elaqesiz altsorqulardir - yeni altsorqunun neticesi esas sorqudan asili deyil
-- 3 elaqeli altsorqudur - yeni altsorqunun neticesi esas sorqudan asilidir

-- 1. 

SELECT Id, FirstName, LastName, Age, Gender, [Group]
FROM Students
WHERE Age = (SELECT MIN(Age) FROM Students)

-- 2.

SELECT Id, FirstName, LastName, Age, Gender, [Group]
FROM Students
WHERE Age > (SELECT AVG(Age) FROM Students)
ORDER BY Age

-- 3.
SELECT DISTINCT [Group], 
				(SELECT AVG(Age) 
				 FROM Students AS SubStud
				 WHERE  SubStud.[Group] = Stud.[Group])AS AvgAge
FROM Students AS Stud

-- 4.

SELECT *
FROM (SELECT Id, FirstName, LastName, Age
		FROM Students
		WHERE Age > 50) AS Stud


