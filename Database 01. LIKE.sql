-- LIKE - setir tipli datalari daha deqiq sechmek uchun
-- % - istenilen sayda simvol
-- _ - istenilen 1 simvol
-- [abc] - bu simvollardan her hansi biri
-- [a-f] - bu araliqda her hansi bir simvol
-- [^abc] - gosterilen simvollardan hech biri

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE 'A%'

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE '_a%'

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE '[FD]%'

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE '[^FD]%'

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE '[F-M]%'

--SELECT [Name], Category, Pages, Topic
--FROM Books_En
--WHERE [Name] LIKE '__[a-u]%'

--SELECT [Name], [Category], [Pages], [Topic]
--FROM Books_En
--WHERE [Name] LIKE '%[0-9]%'