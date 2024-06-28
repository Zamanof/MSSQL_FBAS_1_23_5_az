-- Stored Procedure (SP) - saxlanilan procedurlar
/*
SP girish ve chixish parametrlerine malik olan
adlandirilmish sorqular blokudur.

SP deyer olaraq sehvin kodunu qaytarir.
SP melumatlarda deyishiklikler etmek uchun nezerde tutulub

SP ile ede bilecyimiz emeliyyatlar:
+ girish parametri vasitisi ile SP-ye melumat oturmek
	ve alinan neticeleri lazim gelerse chixish parametrler
	vasitesi ile geri qaytarmaq
+ Bitmish sorgulardan qrupunu client application-a qaytarmaq
+ table-larda deyishiklikler etmek
+ table-larda index-ler yaratmaq ve onlari silmek

SP ustunluyu
+ T-SQL sorqunun Encapsulation
+ DB-in daha da tehlukesiz idare olunmasi
+ Istifadechiye proqramda daha universal girish seviyyesi temin  edir
+ planlama neticesinde mehsuldarliq yukselir ve kod defelerle
	tekraren istifade oluna bilir

SP-da demek olar ki, butun T-SQL instruksiyalar yerine yetirile biler:
 + USE <db_name> istifade edile bilmez
 + AGGREGATE, RULE, DEFAULT komandalri uchun CREATE istifade etmek ve
	CREATE FUNCTION, CREATE TRIGGER, CREATE PROCEDURE, ve CREATE VIEW
	komandalarini yerine yetirmek olmaz
+ CREARE, ALTER, DROP instruksiyalarinin komeyi ile table, index yaratmaq, 
	deyishmek ve silmek olar

CREATE PROCEDURE proc_name
[param1 AS data_type [OUTPUT], ... ]
AS
BEGIN
	procedure_body
END

procedurun yerine yetirlmesi:
EXEC proc_name [param1 AS data_type [OUTPUT], ... ]
*/

USE Library

--CREATE PROCEDURE TakenBooks
--AS
--BEGIN
--	SELECT S.FirstName, S.LastName, B.[Name]
--	FROM Students AS S
--	JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	JOIN Books AS B
--	ON B.Id = SC.Id_Book
--	WHERE SC.DateIn IS NULL
--END

 --EXEC TakenBooks

--ALTER PROCEDURE TakenBooks
--@group AS nvarchar(50)
--AS
--BEGIN
--	SELECT S.FirstName, S.LastName, G.[Name], B.[Name]
--	FROM Students AS S
--	JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	JOIN Books AS B
--	ON B.Id = SC.Id_Book
--	JOIN Groups AS G
--	ON S.Id_Group = G.Id
--	WHERE SC.DateIn IS NULL AND G.[Name] = @group
--END

--DECLARE @group_name AS nvarchar(50)
--SET @group_name = '18P2' 

--EXEC TakenBooks @group_name
--EXEC TakenBooks '18A'

--ALTER PROC TakenBooks
--@group_name AS nvarchar(50),
--@count_students AS int OUTPUT
--AS
--BEGIN
--	SELECT S.FirstName, S.LastName, G.[Name], B.[Name]
--	FROM Students AS S
--	JOIN S_Cards AS SC
--	ON S.Id = SC.Id_Student
--	JOIN Books AS B
--	ON B.Id = SC.Id_Book
--	JOIN Groups AS G
--	ON S.Id_Group = G.Id
--	WHERE SC.DateIn IS NULL AND G.[Name] = @group_name
--	SET @count_students = @@ROWCOUNT
--END


--DECLARE @group_name AS nvarchar(50), @st_count AS int
--SET @group_name = '18P2' 

--EXEC TakenBooks @group_name, @st_count OUTPUT

--SELECT @st_count AS TakenBookStudentsCount


--CREATE PROC NeedCall
--@stud_id AS int
--AS
--BEGIN
--	DECLARE @books_count int = 0
--	SELECT @books_count = COUNT(*)
--	FROM S_Cards
--	WHERE S_Cards.Id_Student = @stud_id AND S_Cards.DateIn IS NULL
--	IF @books_count > 0
--	BEGIN
--		PRINT 'CALL!!!'
--		PRINT 'This student (' 
--				+ CAST(@stud_id AS nvarchar(5))
--				+ ') should return '
--				+ CAST(@books_count AS nvarchar(5))
--				+ ' books'
--	END
--END


--DECLARE @id AS int = 2

--WHILE @id <= 25
--BEGIN
--	EXEC NeedCall @id
--	SET @id += 1
--END