-- Join Tables
-- implicit JOIN - qeyri ashkar birleshdirme

/*
SELECT col1, col2 ...
FROM table1, table2

*/

--SELECT *
--FROM Orders, Customers
--WHERE Orders.CustomerId = Customers.Id


--SELECT Customers.FirstName, Products.ProductName, Orders.ProductCount, Orders.Price
--FROM Orders, Customers, Products
--WHERE Orders.CustomerId = Customers.Id 
--AND Orders.ProductId = Products.Id

---- Alias
--SELECT C.FirstName, P.ProductName, O.ProductCount, O.Price * O.ProductCount AS TotalPrice
--FROM Orders AS O, Customers AS C, Products AS P
--WHERE O.CustomerId = C.Id 
--AND O.ProductId = P.Id


-- Explicit JOIN
-- CROSS JOIN

--SELECT C.FirstName, P.ProductName, O.ProductCount, O.Price * O.ProductCount AS TotalPrice
--FROM Orders AS O 
--CROSS JOIN Customers AS C 
--CROSS JOIN Products AS P
--WHERE O.CustomerId = C.Id AND O.ProductId = P.Id


-- Explicit JOIN
-- INNER JOIN

--SELECT C.FirstName, P.ProductName, O.ProductCount, O.Price * O.ProductCount AS TotalPrice
--FROM Orders AS O 
--INNER JOIN Customers AS C ON C.Id = O.CustomerId
--INNER JOIN Products AS P ON P.Id = O.ProductId


-- Explicit JOIN
-- OUTER JOIN
/*
SELECT col1, col2, ...
FROM table1
{LEFT, RIGHT, FULL} [OUTER] JOIN table2 ON condition1,
{LEFT, RIGHT, FULL} [OUTER] JOIN table3 ON condition2

*/

--SELECT C.FirstName, O.CreatedAt, O.ProductCount, O.Price
--FROM Customers As C
--LEFT JOIN Orders AS O
--ON C.Id = O.CustomerId

--SELECT C.FirstName, O.CreatedAt, O.ProductCount, O.Price
--FROM Customers As C
--LEFT JOIN Orders AS O
--ON C.Id = O.CustomerId
--WHERE O.CustomerId IS NULL

--SELECT O.CreatedAt, O.ProductCount, O.Price, P.ProductName
--FROM Orders AS O 
--RIGHT JOIN Products AS P ON P.Id = O.ProductId


SELECT FirstName, ProductName
FROM Customers AS C
FULL JOIN Orders AS O ON C.Id = O.CustomerId
FULL JOIN Products AS P ON P.Id = O.ProductId
WHERE C.Id IS NULL OR P.Id IS NULL
