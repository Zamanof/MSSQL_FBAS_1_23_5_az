-- EXISTS, ANY, ALL

-- Eger alt sorquya uyqun hech olmas bir dene de yazi varsa True qaytarir
--SELECT FirstName, LastName
--FROM Authors
--WHERE EXISTS(
--			SELECT *
--			FROM Books
--			WHERE Authors.Id = Books.Id_Author)

-- EXISTS ile axtarish IN ile axtarish variantindan daha optimaldir
--SELECT *
--FROM Authors
--WHERE Id IN (SELECT Id_Author FROM Books)

--SELECT DISTINCT FirstName, LastName
--FROM Authors
--JOIN Books
--ON Authors.Id = Books. Id_Author

-- ANY, SOME

--SELECT FirstName, LastName
--FROM Students
--WHERE Id = ANY(SELECT Id_Student FROM S_Cards)

--SELECT FirstName, LastName
--FROM Students
--WHERE Id = SOME(SELECT Id_Student FROM S_Cards)

-- ALL 

SELECT A.FirstName, A.LastName, B.[Name], B.Pages
FROM Authors AS A
JOIN Books AS B 
ON A.Id = B.Id_Author
WHERE B.Pages > ALL(
					SELECT Books.Pages
					FROM Books
					JOIN Press
					ON Books.Id_Press = Press.Id
					WHERE Press.[Name] = N'Piter'
)

SELECT  A.FirstName, A.LastName, B.[Name], B.Pages
FROM Authors AS A
JOIN Books AS B
ON A.Id = B.Id_Author
WHERE B.Pages > (
					SELECT TOP(1) B.Pages
					FROM Books AS B
					JOIN Press AS P
					ON B.Id_Press = P.Id
					WHERE P.[Name] = 'Piter'
					ORDER BY B.Pages DESC
		)
