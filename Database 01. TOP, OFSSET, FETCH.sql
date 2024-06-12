-- TOP(N) - Ilk N elementi sechir

USE Students

--SELECT TOP(5) *
--FROM Students


---- En yashli telebenin sechilmesi
--SELECT TOP(1)*
--FROM Students
--ORDER BY Age DESC

-- OFFSET(N) ROWS - ilk N elementi burax
-- (ORDER BY ile ve TOP-suz ishleyir)
--SELECT *
--FROM Students
--ORDER BY Age
--OFFSET(5) ROWS

-- FETCH NEXT(N) ROWS ONLY - N sayda ardicil elementi sechir(OFFSET ile birlikde ishleyir)
--SELECT *
--FROM Students
--ORDER BY Age DESC
--OFFSET 10 ROWS
--FETCH NEXT 5 ROWS ONLY