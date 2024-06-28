-- User Definition Functions (UDF)

/*
UDF - adlandirilmish T_SQL komandalar blokudur.
Parametrler qebul ede bilir ve deyer qaytara bilir (skalyar ve ya table)

Istifadechi funksiyalari neyinse deyishdirilmesi uchun yox, 
hesablamalarin heyata kechirilmesi ve melumatlarin sechilmesi uchun nezerde tutulub

Istifadechi funksiyalarinin Sql Server melumatlarina girish huququ var,
amma onlar DDL-i yerine yetire bilmirler, 
bu, o demekdir ki, onlar cedveller yarada bilmir,cedvelleri, 
indeksleri ve ya istenilen diger obyektleri modifikasiya ede bilmir. 
Onlar hemchinin DML instruksiyalarinin komeyi ile daimi cedvellerde istenilen 
melumatlari deyishdire bilmir.

   IstifadechiIstifadechi terefinden teyin olunan funksiyanin 2 esas tipi movcuddur :
	+ skalyar funksiyalar (chagirish eden terefe yegane anlami qaytarir)
	+ cedvel anlamli funksiyalar(cedveli qaytarir)

	Skalyar funksiyalar Bir anlami qaytaran deyimin meydana gele bildiyi istenilen sorgu yerinde peyda ola biler.

    Cedvel anlamli funksiya T-SQL sorgusunda cedvel neticesinin gozlenildiyi yerde chagirila biler(FROM cumlesinde oldugu kimi)
	Bele funksiyani Exec-in komeyile chagirmaq mumkun deyil


CREATE FUNCTION func_name
(param1 AS data_type [= deafault value],
...
paramN AS data_type [= deafault value]
)
RETURNS return_data_type
AS
BEGIN
	function_body
	RETURN value
END

table tipli deyishenin yaradilmasi
DECLARE @variable_name
	col1 data_type specificator
	col2 data_type specificator
	...
	colN data_type specificator
*/

-- skalyar tipli deyer qaytaran UDF
--CREATE FUNCTION CountBooksForReturn
--(@stud_id AS int)
--RETURNS int
--AS
--BEGIN
--	DECLARE @books_count int = 0
--	SELECT @books_count = COUNT(*)
--	FROM S_Cards
--	WHERE S_Cards.Id_Student = @stud_id AND S_Cards.DateIn IS NULL

--	RETURN @books_count
--END
---- SELECT vasitesi ile
--SELECT dbo.CountBooksForReturn(5) AS BooksCount

-- EXEC vasitesi ile
--DECLARE @count AS int
--EXEC  @count = dbo.CountBooksForReturn 5

--SELECT @count AS BooksCount

--CREATE FUNCTION BookList()
--RETURNS TABLE
--AS
--RETURN(
--	SELECT	B.[Name] AS Book, 
--			A.FirstName + N' ' + A.LastName AS [Author Full Name],
--			C.[Name] AS Category, T.[Name] AS Theme
	
--	FROM Books AS B
--	JOIN Authors AS A
--	ON B.Id_Author = A.Id
--	JOIN Categories AS C
--	ON C.Id = B.Id_Category
--	JOIN Themes AS T
--	ON T.Id = B.Id_Themes	
--	)

--SELECT *
--FROM BookList()


--CREATE FUNCTION Books_By_Authors()
---- qaytarilan cedvelin tipini ve deyisheni teyin edir
--RETURNS @BooksAuthors TABLE (Author nvarchar(25), Books int) 
--AS
--BEGIN
--	-- muveqqeti cedveli elan edirik
--	DECLARE @temp_books TABLE (Author nvarchar(25), Books int) 
--	-- onun daxiline muelliflerin siyahisini, bunlarin kitabxanadan goturulen eserlerinin siyahisini yaziriq
--	INSERT @temp_books
--	SELECT A.FirstName + ' ' + A.LastName, COUNT(SC.Id_Book)
--	FROM Authors AS A INNER JOIN Books AS B
--	ON A.Id = B.Id_Author
--	INNER JOIN S_Cards AS SC
--	ON B.Id = SC.Id_Book
--	GROUP BY A.FirstName, A.LastName;
--	-- ora muelliflerin siyahisini yaziriq
--	INSERT @temp_books	
--	SELECT A.FirstName + ' ' + A.LastName, COUNT(TC.Id_Book)
--	FROM Authors AS A INNER JOIN Books AS B
--	ON A.Id = B.Id_Author
--	INNER JOIN T_Cards AS TC
--	ON B.Id = TC.Id_Book
--	GROUP BY A.FirstName, A.LastName;
--	-- bir dene de muveqqeti cedvel elan edirik
--	DECLARE @temp_books2 TABLE (Author nvarchar(25), Books int);
--	--  onun daxiline birinci muveqqeti cedvelin ichindekilerini yaziriq(bu zaman bir muellifin kitablarinin miqdarini hesablayiriq)
--	INSERT @temp_books2
--	SELECT T.Author, SUM(T.Books)
--	FROM @temp_books AS T
--	GROUP BY T.Author;
--	-- icindekileri qaytarilan deyishene yaziriq
--	INSERT @BooksAuthors
--	SELECT T.Author, T.Books
--	FROM @temp_books2 AS T;
--	RETURN;
--END

--GO


--SELECT * 
--FROM Books_By_Authors();
