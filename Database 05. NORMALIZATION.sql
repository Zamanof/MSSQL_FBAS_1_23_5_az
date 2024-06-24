-- Normalization

-- Normallashmamish DB-lerin elametleri
--		Cedvel birden chox element(varliq, obyekt) haqqinda melumat saxlayir
--		Cedvelde tekrarlanan setirler var
--		Sutunlar tekrarlanan informasiya saxlayir

-- 1NF
-- Cedvelde tekralanan setirler olmamalidir
-- Sutunlarda olan melumatlar atomar(bolunmez) olmalidir
-- Meslen ASA(Fullname) sutunu atomar deyil, mueyyen situasiyalarda bize
-- hem ad, soyad ve ya ata adi ayriliqda lazim ola biler.
-- Daha duzgun olar ki, bu 3 ayri sutun olsun
/*
Atomar olmaya sutun
-------------------------------
|       FullName		| Age |
-------------------------------
| Zamanov Nadir Rasim   | 44  |
-------------------------------

Atomar sutun
---------------------------------------------------
|       FirstName  | LastName   | Patronymic| Age |
---------------------------------------------------
|		Nadir      | Zamanov    |   Rasim   | 44  |
---------------------------------------------------
*/


-- 2NF
-- 2NF onu ehtiva edir ki, 1NF artiq tetbiq olunub ve
-- Achar olmayan sutunlar ilkin achardan asili olmalidir
-- Bu normal formanin menasi odur ki, bir cedvel bir neche, 
-- hetta bir yarim ferqli varliq(entity) haqqinda melumat saxlamli deyil. 
-- Bir cedvel yalniz ve yalniz bir varliq(entity) haqqinda melumat saxlaya biler
-- Design patternlerde olan S - Single Responsibility ideyasi


-- 3NF
-- 3NF onu ehtiva edir ki, 1NF ve 2NF artiq tetbiq olunub ve
-- Achar olmayan sutunlar yalniz ve yalniz ilkin achardan asili olmalidir

/*
		--------------------------------------------------
		|Id | Product Name | Count | Price | Total Price |
		--------------------------------------------------
		| 1 | Cola		   |   5   |   2   |      10     |
		--------------------------------------------------

*/