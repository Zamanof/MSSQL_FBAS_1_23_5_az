-- Cedvellerin yaradilmasi
-- DDL -> CREATE, ALTER, DROP

/*
CREATE TABLE table_name
(
column_name <datatype> [NULL|NOT NULL]
[, ...]
)
*/

/*
Constraints - mehdudiyyetler

PRIMARY KEY - ilkin achar

IDENTITY(seed, increment)

UNIQUE 

DEFAULT(value)

NULL | NOT NULL

CHECK(condition)

Constraintleri yaradarken istifade olunan prefiksler
	PK_ - PRIMARY KEY uchun
	FK_ - FOREIGN KEY uchun
	CK_	- CHECK uchun
	UQ_	- UNIQUE uchun
	DF_ - DEFAULT uchun
*/

/*
[FOREIGN KEY] REFERENCES main_table(main_table_column)
[ON DELETE {CASCADE | NO ACTION | SET NULL | SET DEFAULT}]
[ON UPDATE {CASCADE | NO ACTION | SET NULL | SET DEFAULT}]
*/

-- CONSTRAINT const_name FOREIGN KEY(column_name) REFERENCES main_table(main_table_column)


-- DROP <table_name>

/*
ALTER TABLE table_name [WITH CHECK | WITH NOCHECK]
ADD column_name datatype [column_atributes] |
DROP column_name |
ALTER COLUMN column_name datatype [column_atributes] |
ADD CONSTRAINT constraint |
DROP CONSTRAINT const_name

*/

USE [master]

GO

CREATE DATABASE [MiniInsta]

GO

USE [MiniInsta]

GO

CREATE TABLE [dbo].[Users]
(
[Id] int IDENTITY(1, 1) NOT NULL,
[Login] nvarchar(20) NOT NULL,
[Password] nvarchar(50) NOT NULL,
[IsOpen] bit NOT NULL DEFAULT(1),

CONSTRAINT PK_Users PRIMARY KEY([Id]),
CONSTRAINT CK_Users_Login CHECK([Login] != ''),
CONSTRAINT CK_Users_Password CHECK([Password] != ''),
CONSTRAINT UQ_Users_Login UNIQUE([Login])
)

GO

CREATE TABLE Posts
(
Id int IDENTITY(1,1) NOT NULL,
IdUser int NOT NULL,
[Date] datetime2(7) NOT NULL DEFAULT SYSDATETIME(),
[Text] nvarchar(max) NULL,
ImgPath nvarchar(255) NOT NULL,
CONSTRAINT PK_Posts PRIMARY KEY(Id),
CONSTRAINT FK_Posts_User FOREIGN KEY(IdUser) REFERENCES Users(Id)
						ON DELETE CASCADE 
						ON UPDATE CASCADE
)

GO

CREATE TABLE Tags(
Id int IDENTITY(1,1) NOT NULL,
Tag nvarchar(100) NOT NULL,
CONSTRAINT PK_Tags PRIMARY KEY(Id),
CONSTRAINT CK_Tags_Tag CHECK(Tag != '')
)

GO

CREATE TABLE PostsTags(
IdPost int NOT  NULL,
IdTag int NOT NULL,
CONSTRAINT FK_PostsTags_Post FOREIGN KEY (IdPost) REFERENCES Posts(Id)
							ON DELETE NO ACTION
							ON UPDATE CASCADE,
CONSTRAINT FK_PostsTags_Tag FOREIGN KEY (IdTag) REFERENCES Tags(Id)
							ON DELETE NO ACTION
							ON UPDATE CASCADE
)

GO

ALTER TABLE Users
ADD [Gender] bit  NOT NULL DEFAULT(1)

GO

ALTER TABLE Users
ADD [Birthday] datetime2 NULL

GO

ALTER TABLE Users
ADD CONSTRAINT CK_Users_Birthday CHECK([Birthday] >= '19900101')

GO

ALTER TABLE Users
DROP CONSTRAINT CK_Users_Birthday

GO

ALTER TABLE Users
ADD CONSTRAINT CK_Users_Birthday
CHECK([Birthday] >= '19900101' AND [Birthday] <= SYSDATETIME())



INSERT INTO Users ([Login], [Password])
VALUES(N'mr13', N'P@ss12345')

INSERT INTO Posts ([Text], [IdUser], [ImgPath])
VALUES(N'My First Post', 1, N'D://Images/image1.jpg')

INSERT INTO Tags([Tag])
VALUES (N'#FirstTag')

INSERT INTO Tags([Tag])
VALUES (N'#Selfie')

INSERT INTO PostsTags([IdPost], [IdTag])
VALUES(1,1)

INSERT INTO PostsTags([IdPost], [IdTag])
VALUES(1,2)
