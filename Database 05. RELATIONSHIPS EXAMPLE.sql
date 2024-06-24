-- FOREIGN KEY
-- One to one

--CREATE TABLE Countries(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[Name] nvarchar(50) NOT NULL
--)

--CREATE TABLE Capitals(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[Name] nvarchar(50) NOT NULL,
--[CountryId] int NOT NULL UNIQUE,
--CONSTRAINT FK_Capitals FOREIGN KEY(CountryId) REFERENCES Countries(Id)
--)

-- One to many
--CREATE TABLE Groups(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[Name] nvarchar(50) NOT NULL
--)

--CREATE TABLE Students(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[FirstName] nvarchar(50) NOT NULL,
--[LastName] nvarchar(50) NOT NULL,
--[BirthDate] date NULL,
--[Score] float NOT NULL,
--[GroupId] int REFERENCES Groups(Id)
--)

-- Many to many
--CREATE TABLE Authors(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[FirstName] nvarchar(50) NOT NULL,
--[LastName] nvarchar(50) NOT NULL,
--[BirthDate] date NULL
--)

--CREATE TABLE Books(
--[Id] int PRIMARY KEY IDENTITY(1,1),
--[Name] nvarchar(50) NOT NULL,
--[Genres] nvarchar(50) NOT NULL,
--[Pages] int NOT NULL,
--[Price] money NOT NULL
--)

--CREATE TABLE AuthorsBooks(
--[AuthorId] int NOT NULL,
--[BookId] int NOT NULL,
--CONSTRAINT FK_Author_Id FOREIGN KEY(AuthorId) REFERENCES Authors(Id),
--CONSTRAINT FK_Book_Id FOREIGN KEY(BookId) REFERENCES Books(Id)
--)