-- UNION, EXCEPT, INTERSECT

-- UNION - iki cedvelden eyni sayda 
-- ve eyni tipde olan columnlarin datalarini shaquli birleshdirir
-- tekrar datalari gostermir

-- UNION ALL - iki cedvelden eyni sayda 
-- ve eyni tipde olan columnlarin datalarini shaquli birleshdirir
-- tekrar datalari da gosterir

SELECT FirstName, LastName
FROM Customers
UNION
SELECT FirstName, LastName
FROM Employees


SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum
FROM Customers
WHERE AccountSum < 3000
UNION
SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum
FROM Customers
WHERE AccountSum > 3000

-- EXCEPT - Cedvellerin ferqi. Yeni birinci cedvelde olub ikinci cedvelde
-- olmayan datalari gosterir

SELECT FirstName, LastName
FROM Customers
EXCEPT
SELECT FirstName, LastName
FROM Employees

SELECT FirstName, LastName
FROM Employees
EXCEPT
SELECT FirstName, LastName
FROM Customers


-- INTERSECT - Cedvellerin keshismes. 
-- Yeni her iki cedvelde ust-uste dushen datalari qaytarir
SELECT FirstName, LastName
FROM Employees
INTERSECT
SELECT FirstName, LastName
FROM Customers