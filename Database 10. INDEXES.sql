/*
	Indeksler(Index)

	BD melumatlar faylinda melumatlar( verilenler) ardicil veziyyetde saxlanilir (hem fiziki,hem mentiqi).


	Verilenlerin fiziki strukturu.

	SQL Server  melumatlari sehifeler sheklinde saxlayir.Sehife (page) –yalniz bir obyekte mexsus olan,
	hecmi 8 kb olan melumatlar blokudur.(meselen,cedvel)

	Sehifeler ekstentlerde birleshir.Ekstent(extent) -8 ardicil sehife.
	Ekstentleri qarishiq ve bircinslilerer bolurler.Qarishiq ekstentler oz 
	daxilinde muxtelif obyektlerin sehifelerini saxlaya bilir.
	Bircinsli ekstentler ise,oz daxilinde bir obyektin sehifesini saxlayir.
      Obyekt uchun birinci sehife yaradilanda o qarishiq ektentde yerleshir.
  Lakin,eger obyekte 8-den artiq sayda sehife ayirmaq lazimdirsa onda novbeti 
  sehifeler uchun bircinsli ekstent ayrilir.



	

	---------------------------------------------------------------------------------------------------------

	Melumatlarin mentiqi strukturu.

	SQL Server  cedvel melumatlarini topa ya da,balanslashdirilmish toplu sheklinde yerleshdirir.


	Yigin  (Heap)

	Yigin —sehifeler ve ekstentlerin qeyri-ardicil destidir.
	Yigindaki melumatlar hech bir mentiqi teshkilatlanmaya malik deyiller. 

	Her bir cedvel uchun en azi bir sehife  IAM (Index Allocation Map)ayrilir.
	Bu sehife mehz bu cedvele mexsus olan sehife ve ekstentleri daxilinde saxlayir.

	SQL Server yigindaki (topadaki)  melumatlari yalniz butun yigina,daha deqiq desek butun IAM  
	sehifelere baxib tapa biler(hetta sorguya yalniz bir setri chixartmaq lazimdirsa da).
	
	Yiginda yeni setirlerin yerleshdirilmesi musteqil olaraq bash verir. SQL Server yeni 
	setri movcud sehifede saxlaya biler(eger sehife dolmayibsa).Ve ya obyekt uchun yeni sehife ya da,ekstent ayira biler.
	Vaxt kechdikce yiginlar fraqmenteshe biler.
	
	
	Balanslashdirilmish “agac ” (Balanced tree)

	eger cedvelde klasterleshdirilmish Indeks varsa,cedvel balanslashdirilmish “agac” (toplu) kimi qurulur.

	Indeks- Verilenlere olan muvafiq istinadlarla birge cedvelin unikal anlamlarinin toplusudur.
  Indeksler cedvellerin bendleri ve teqdimatlar uchun yaradilir.
Indekslerin esas ustunluyu  suretli axtarishidir.chunki,toplu uzre axtarish topada(yiginda) 
elementlerin yerbeyer  edilmesinden daha tez heyata kechirilir.
	 
	
	Agac bashlangic  sehifeden ve son sehifelerden ibaretdir.Bashlangic sehifelerde diger bashlangic cedvellerin 
	unvanlari ya da,son sehifelerin unvanlari yerleshir.
Son sehifelerde melumatlar(verilenler)saxlanilir(eger bu toplu klasterleshdirilmish Indeksdendirse)
Klasterleshdirilmish Indeksi unikal sutunun ichine yerleshdirmek vacib deyil
.Siz Indeksi qeyri-unikal  sutuna elave etseniz onda SQL server anlami yene de unikallashdiracaq 
(ona siralama nomresini elave etmekle siralama nomresinin hecmi 4 bayt olacaq)
Bir cedvele yalniz bir klaster Indeksi ve istenilen sayda qeyri-klaster Indeksleri elave etmek olar.
Klasterleshdirilmish ve klasterleshdirilmemish Indeksler balanslashdirilmish toplunun eyni 
strukturuna malikdir.Yalniz bir ferq var: klasterleshdirilmemish Indeksin sonuncu seviyyesi melumatlarin sehifeleri evezine Indekslerin sehifelerinden ibaretdir.
Indeksin sehifesindeki her setirde klasterleshdirmemish achar anlami ve setir gostericisi var.
eger klasterleshdirlmemish Indeks daxilinde  klasterli Indeks olan cedvele 
elave edilirse onda setire olan gosterici nishan klasterli Indeksin acharidir.
eger klasterleshdirilmemish Indeks cedvele topa sheklinde elave edilirse (klasterli Indeks yoxdur) 
onda setir uchun gosterici nishan melumatlarin yerleshdiyi topanin sehifesindeki setire olan istinaddir.


	
	---------------------------------------------------------------------------------------------------------

	Sintaksis:
	CREATE [CLUSTERED | NONCLUSTERED] INDEX ad 
	ON table or view
	(sahenin adi 1 [ASC | DESC], sahenin adi 2, ...)

*/

-- BD-nin yaradilmasi:
--CREATE DATABASE Test;
--GO

--USE Test;
--GO

---- Topa sheklinde cedvelin yaradilmasi:
--CREATE TABLE dbo.TableInHeap ( 
--	Id INT NOT NULL,
--	Field1 CHAR(36) NOT NULL,
--	Field2 CHAR(216) NOT NULL 
--); 
--GO

-- Bir neche emrin(komandanin)  bir prosedurla birleshmesi,chunki,sonra onlari bir neche defe chagirmaq lazim olacaq.
--Prosedur cedvel melumatlarinin saxlanilmasi haqda informasiyanin gosterilmesini heyata kechirir.

--CREATE PROCEDURE ShowInfo_TableInHeap
--AS
--BEGIN
--	-- Cedvelin gosterilmesi,onun Indeksinin,tipinin gosterilmesi(topa ya Indeks)
--	SELECT OBJECT_NAME(object_id) AS table_name, [name] AS index_name, [type], [type_desc]
--	FROM sys.indexes
--	WHERE object_id = OBJECT_ID(N'dbo.TableInHeap'); 
--	--Cedvelin tipinin,sehifelerin miqdarinin,yazilarin miqdarinin ve bu cedvel uchun melumatlarla doldurulmanin orta faizi:
--	SELECT index_type_desc, page_count, record_count, avg_page_space_used_in_percent
--	FROM sys.dm_db_index_physical_stats (DB_ID(N'Test'), OBJECT_ID(N'TableInHeap'), NULL, NULL , 'DETAILED');
--	-- Cedvelin adinin,yazilarin miqdarinin,verilen yerler uchun istifade olunan, 
--	-- rezerv edilen yerlerin gosterilmesi,cedvelde melumat saxlanilmasi haqda informasiyanin gosterilmesi 
--	--Indeks altinda istifade olunan yer,istifade olunmamish yer:
--	EXEC dbo.sp_spaceused N'TableInHeap'; 
--END
GO

-- Cedvelde melumatin saxlanilmasi haqda informasiyanin gosterilmesi
--EXEC ShowInfo_TableInHeap;

-- Ilk yazinin cedvele daxil edilmesi:
--INSERT INTO TableInHeap (Id, Field1, Field2)
--VALUES (1, 'a', 'b'); 

--Cedvelde melumat saxlanmasi haqda informasiyanin gosterilmesi 
-- Diqqet yetirin ki, cemi 72 kb rezerv edilsin,bu ise,9 sehifedir:
-- Birinci ekstentin 8 sehifesi ve 1 IAM sehifesi
--EXEC ShowInfo_TableInHeap;

-- Daha 29 yazinin elave edilmesi:
--DECLARE @i AS int = 1;
--WHILE @i < 30
--BEGIN
--	SET @i = @i + 1;
--	INSERT INTO TableInHeap (Id, Field1, Field2)
--	VALUES (@i, 'a', 'b');
--END

--  Cedvelde melumatlarin saxlanmasi haqda informasiyanin gosterilmesi
-- Diqqet yetirin ki,birinci sehife tam doldurulsun.
--EXEC ShowInfo_TableInHeap;
 
-- Daha bir yazinin cedvele elave edilmesi
--INSERT INTO TableInHeap (Id, Field1, Field2)
--VALUES (31, 'a', 'b'); 

-- Cedvelde melumatlarin(verilenlerin) saxlanmasi haqda informasiyanin gosterilmesi
-- Diqqet yetirin ki, 2-ci sehife elave olunsun
--EXEC ShowInfo_TableInHeap;
GO


-- Daha 3 milyon yazinin elave edilmesi
--DECLARE @i AS int = 31;
--WHILE @i < 3000000
--BEGIN
--	SET @i = @i + 1;
--	INSERT INTO TableInHeap (Id, Field1, Field2)
--	VALUES (@i, 'a', 'b');
--END; 

-- Topa sheklinde olan cedvelden bir yazinin sechilmesi

--DECLARE @EndTime datetime
--DECLARE @StartTime datetime 
--SELECT @StartTime=SYSDATETIME()


--SELECT * FROM TableInHeap
--WHERE Id = 3000002;

--  Id sutununa klaster Indeksini elave edirik
-- Indi cedvel balanslashdirilmish “agac” formasinda olacaq
-- Bu daha tez axtarishi temin edir 
--CREATE CLUSTERED INDEX Index1 
--ON TableInHeap (Id)
	
--INSERT INTO TableInHeap (Id, Field1, Field2)
--VALUES (3000003, 'a', 'b'); 
  
--SELECT @EndTime=SYSDATETIME()

----This will return execution time of your query
--SELECT DATEDIFF(NANOSECOND,@StartTime,@EndTime) AS [Duration in nanosecs] 