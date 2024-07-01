-- Triggers

/*
Triggerler -  her hansi bir hadise (Event) bash veren 
zaman ishe dushen adlandirilmish kod blokudur.

Triggerlerin 3 esas novu var:
	- DML triggers
	- DDL triggers
	- LOG ON triggers
DDL triggerler - serverde ve ya verilenler bazasinda 
DDL Event-ler bash veren zaman ishe dushen triggerlerdir
(CREATE, ALTER, DROP)

LOG ON triggerler - serverde istifadechi seansi qurashdirilan
zaman ishe dushen triggerlerdir

DML triggerler - erverde ve ya verilenler bazasinda 
DML Event-ler bash veren zaman ishe dushen triggerlerdir.
(INSERT, UPDATE, DELETE)

DML triggerlerin istifadesi:
	- INSERT, UPDATE, DELETE emeliyyatlari zamani her hansi
	bir sehvin qarshisini almaq uscun
	- Elaqelendirilmish cedvellerde kaskad emeliyyatlarin 
	yerine yetirilmesi uchun

DML triggerler AFTER ve ya INSTEAD OF triggerler ola biler
		- AFTER - INSERT, UPDATE, DELETE emeliyyatlari heyata kechdikden 
		sonra trigger ishe dushecek
		- INSTEAD OF - INSERT, UPDATE, DELETE emeliyyatlarinin evezine
		yerine yetirilecek komandalar blokudur


Triggerlerin yaradilmasi zamani bezi qaydalar toplusu movcuddur
	- Triggerler muveqqeti cedvellerde yaradila bilmez
	- Triggerler parametr qebul etmir
	- Triggerleri achiq-ashkar ishe salmaq olmaz
	- Triggerler lazim geldikde deyer qaytara biler
	- Bir cedvelde bir emeliyyat uchcun birden artiq 
	INSTEAD OF trigger yaratmaq olmaz
	- Triggerlerde ashaqidaki komandalar istifade edile bilmez
		+ DROP
		+ CREATE
		+ ALTER DATABASE
		+ ALTER TABLE
		+ GRANT
		+ REVOKE

Sintaksis
CREATE TRIGGER <trigger_name> ON <table_name>
{INSTEAD OF | AFTER}
{INSERT | UPDATE | DELETE}
AS
Trigger body
*/

USE [Library]

GO

--CREATE TRIGGER BooksUpdate ON Books
--AFTER UPDATE
--AS
--BEGIN
--	PRINT @@ROWCOUNT
--END

GO

--UPDATE Books
--SET Pages += 1
--WHERE Pages > 400

--CREATE TRIGGER OldBook ON Books
--AFTER INSERT
--AS
--BEGIN 
--	DECLARE @year AS int
--	SELECT @year = YearPress
--	FROM inserted
--	IF (@year < 2010)
--		BEGIN
--			PRINT 'Fuuuu!!! Kohne kitablara bizim kitabxanada yer yoxdu. Qoca telebelere de'
--			ROLLBACK TRAN
--		END
--	ELSE
--		PRINT 'Elaa!!! Bu teze kitabdir. Qoca telebelere ise bizim kitabxanada onsuz da yer yoxdu'
--END

-- Teze kitab daxil edirik
--INSERT INTO Books(Id, [Name], Pages, YearPress, Id_Themes, Id_Category, Id_Author, Id_Press, Quantity)
--VALUES (100, 'C# 12 in Nutshell', 1086, 2023, 2, 14, 15, 2, 256)

-- Kohne kitab daxil etmeye chalisiriq
--INSERT INTO Books(Id, [Name], Pages, YearPress, Id_Themes, Id_Category, Id_Author, Id_Press, Quantity)
--VALUES (105, 'C# 3 in Nutshell', 750, 2007, 2, 14, 15, 2, 256)


--CREATE TRIGGER NotBHV ON Books
--AFTER DELETE
--AS
--BEGIN
--	DECLARE @id_press int
--	SELECT @id_press = Id 
--	FROM Press 
--	WHERE Press.[Name] LIKE 'BHV '
--	IF EXISTS (
--	SELECT * 
--	FROM deleted
--	WHERE Id_Press = @id_press)
--	BEGIN
--		PRINT 'Qadan alim BHV-ye el deyme. O bize babalarimizdan yadigar qalib!'
--		ROLLBACK TRAN
--	END
--	ELSE
--		PRINT 'Silindi eeee'
--END

--DELETE
--FROM Books
--WHERE Id = 6


--CREATE TRIGGER NoInsertLibrarian ON Libs
--INSTEAD OF INSERT
--AS
--BEGIN
--	PRINT 'This is SPARTAAAAAAAA!!! No Pasaran!!!'
--END

--INSERT INTO Libs (Id, FirstName, LastName)
--VALUES (5, 'Xerxes ', 'I')

--DROP TRIGGER NoInsertLibrarian

