-- GROUP BY

--SELECT Category, [Name], Pages
--FROM Books_En

--SELECT  Category, SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category IS NOT NULL 
--GROUP BY Category

--SELECT  Category, Topic, SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category IS NOT NULL 
--GROUP BY Category, Topic

-- HAVING - qrup olunmush datalara yoxlama tetbiq etmek uchundur

--SELECT  Category, SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category IS NOT NULL 
--GROUP BY Category
--HAVING SUM(Pages) != 0
--ORDER BY SumPages


--SELECT  SUM(Pages) AS SumPages, Publisher
--FROM Books_En 
--GROUP BY Publisher
--HAVING SUM(Pages) > 10

--SELECT  AVG(Price) AS AvgPrice, Publisher
--FROM Books_En 
--GROUP BY Publisher
--HAVING AVG(Price) < 10


-- HAVING-de GROUP BY-da gosterilmeyen atributlari istifade etmek olmaz
-- Sehv
--SELECT COUNT(*) AS BookCount, Topic
--FROM Books_En
--GROUP BY Topic
--HAVING COUNT(*) > 50 AND Price>20

-- Duz
--SELECT COUNT(*) AS BookCount, Topic
--FROM Books_En
--WHERE Price > 20
--GROUP BY Topic
--HAVING COUNT(*) > 10

-- Bir aqqreqat funksiyani diger aqqreqat funksiya uchun 
-- parametr kimi istifade etmek olmaz

-- Sehv
--SELECT Topic, MAX(COUNT(*))
--FROM Books_En
--GROUP BY Topic

--SELECT TOP(1)Topic, COUNT(*) AS BookCount
--FROM Books_En
--GROUP BY Topic
--ORDER BY BookCount DESC

