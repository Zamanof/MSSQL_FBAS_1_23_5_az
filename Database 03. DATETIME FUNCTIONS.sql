-- Zaman ile ishleme

--SELECT SYSDATETIME() AS CurrentDateTime

--SELECT YEAR(SYSDATETIME()) AS CurrentYear

--SELECT MONTH(SYSDATETIME()) AS CurrentMonth

--SELECT DAY(SYSDATETIME()) AS CurrentDay

SELECT DATEDIFF(YEAR, '19801007', SYSDATETIME()) AS MyAge

SELECT DATEDIFF(YEAR, '20161025', SYSDATETIME()) AS MyStepWorkYear

SELECT DATEDIFF(DAY, '20161025', SYSDATETIME()) AS MyStepWorkDay




