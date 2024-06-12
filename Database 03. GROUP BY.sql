-- GROUP BY

SELECT Category, [Name], Pages
FROM Books_En

--SELECT  Category, SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category IS NOT NULL 
--GROUP BY Category

--SELECT  Category, Topic, SUM(Pages) AS SumPages
--FROM Books_En
--WHERE Category IS NOT NULL 
--GROUP BY Category, Topic

-- HAVING - 

SELECT  Category, SUM(Pages) AS SumPages
FROM Books_En
WHERE Category IS NOT NULL 
GROUP BY Category
HAVING SUM(Pages) != 0
ORDER BY SumPages