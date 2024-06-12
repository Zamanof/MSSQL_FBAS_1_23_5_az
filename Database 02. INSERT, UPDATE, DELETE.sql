-- INSERT

--SELECT *
--FROM Students

/*
INSERT INTO <table_name> [(col1 [,col2, ..., colN])]
VALUES (val1, [val2,..., valN]) 
*/

--INSERT examples
--INSERT INTO dbo.Students(FirstName, LastName, Age, [Group])
--VALUES (N'Hesen', N'Avshar', 15, N'1_23_5')

--INSERT INTO Students(FirstName, LastName, Age, Gender, [Group])
--VALUES (N'Zibeyda', N'Musayeva', 20, N'female', N'1_23_5')

--INSERT INTO dbo.Students(FirstName, LastName, Age, [Group])
--VALUES (N'Ali', N'Aliyev', 33, N'1_23_5')

--SET IDENTITY_INSERT Students ON
--SET IDENTITY_INSERT Students OFF

--INSERT INTO dbo.Students(FirstName, LastName, Age, [Group])
--VALUES (N'Salam', N'Salamzade', 102, N'1_23_5')

-- UPDATE
--UPDATE Students
--SET Age = Age + 1

--UPDATE Students
--SET Age = 18
--WHERE Id = 3

--UPDATE Students
--SET Age = 20, [Group] = 'AABB'
--WHERE Gender = 'female'

-- DELETE
--DELETE FROM Students
--WHERE Id > 25
