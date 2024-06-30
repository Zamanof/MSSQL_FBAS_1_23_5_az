--CREATE DATABASE Blog

--GO

--USE Blog

--GO

--CREATE TABLE Users(
--Id int PRIMARY KEY IDENTITY(1, 1),
--LoginName nvarchar(50) NOT NULL UNIQUE,
--Pswd nvarchar(100) NOT NULL,
--Raiting float NOT NULL DEFAULT(0)
--)

--GO

--CREATE TABLE Posts(
--Id int PRIMARY KEY IDENTITY(1, 1),
--IdUser int NOT NULL FOREIGN KEY REFERENCES Users(Id),
--Msg nvarchar(MAX) NOT NULL,
--DatePost datetime2 NOT NULL DEFAULT(SYSDATETIME()),
--Rating float NOT NULL DEFAULT(0)
--)

--GO 

--CREATE TABLE Comment(
--Id int PRIMARY KEY IDENTITY(1, 1),
--IdUser int NOT NULL FOREIGN KEY REFERENCES Users(Id),
--IdPost int NOT NULL FOREIGN KEY REFERENCES Posts(Id),
--Msg nvarchar(MAX) NOT NULL,
--DateComment datetime2 NOT NULL DEFAULT(SYSDATETIME()),
--Rating float NOT NULL DEFAULT(0)
--)

--GO

--CREATE TABLE PostRaiting(
--IdPost int NOT NULL FOREIGN KEY REFERENCES Posts(Id),
--IdUser int NOT NULL FOREIGN KEY REFERENCES Users(Id),
--Mark int NOT NULL,
--CONSTRAINT UQ_PostRaiting UNIQUE(IdPost, IdUser)
--)

--GO

--CREATE TABLE CommentRaiting(
--IdComment int NOT NULL FOREIGN KEY REFERENCES Comment(Id),
--IdUser int NOT NULL FOREIGN KEY REFERENCES Users(Id),
--Mark int NOT NULL,
--CONSTRAINT UQ_CommentRaiting UNIQUE(IdComment, IdUser)
--)

GO

SET IDENTITY_INSERT Users ON
INSERT INTO Users (Id, LoginName, Pswd, Raiting)
VALUES	(1, 'User1', 'Pswd1', 4.5),
		(2, 'User2', 'Pswd12', 3),
		(3, 'User3', 'Pswd3', 0)
SET IDENTITY_INSERT Users OFF

GO

SET IDENTITY_INSERT Posts ON
INSERT INTO Posts(Id, IdUser, Msg, Rating)
VALUES	(1, 1, 'Post_1_1', 4.5),
		(2, 1, 'Post_1_2', 4.5),
		(3, 2, 'Post_2_1', 2),
		(4, 2, 'Post_2_2', 4)
SET IDENTITY_INSERT Posts OFF

GO
GO
SET IDENTITY_INSERT Comment ON;
INSERT INTO Comment (Id, IdUser, IdPost, Msg)
VALUES (1, 3, 1, N'Message_3_1_1'), (2, 3, 2, N'Message_3_2_1'), (3, 2, 1, N'Message_2_1_1'), 
(4, 2, 2, N'Message_2_2_1'), (5, 1, 1, N'Message_1_1_1'), (6, 1, 3, N'Message_1_3_1'), 
(7, 3, 1, N'Message_3_1_2'), (8, 2, 3, N'Message_2_3_1'), (9, 1, 2, N'Message_2_2_1');
SET IDENTITY_INSERT Comment OFF;
GO
INSERT INTO PostRaiting (IdUser, IdPost, Mark)
VALUES	(3, 1, 4), 
		(3, 2, 5), 
		(3, 3, 1), 
		(3, 4, 4), 
		(2, 1, 5), 
		(2, 2, 4), 
		(2, 3, 3), 
		(2, 4, 4);
GO
