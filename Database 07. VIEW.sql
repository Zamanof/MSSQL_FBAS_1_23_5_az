--Teqdimatlar (View)

/*	Teqdimatlar (View) Ц adlandirilmish sorgunu tesvir eden virtual cedveldi.
	Yeni ki, teqdimatin terkibi melumatlar esasinda dinamik olaraq hesablanir, 
	hansilar ki, teqdimata muraciet olunan zaman bash verir 
	hemen anda real cedvellere yerleshir.

	Teqdimatlar baza cedvelleri kimi yalniz real cedvellerden istifade ede bilerler.

	Teqdimatdan SELECT  sorusunun vasitesi ile sechim etmek olar. 
	Hemchinin teqdimatlara modifikasiya sorgularini tetbiq etmekolar.


	Teqdimatlarin vasitesi ile baza cedvelinin melumatlarini deyishmek olar, 
	ashaqidaki qaydalara riayyet olunmaq sherti ile:
	+ DML-instruksiyalari (INSERT, UPDATE и DELETE) bir defeye
	bir cedvele esaslanmalidirlar, teqdimatin neche cedvele esaslanmasinin ehemiyyeti yoxdur.
	+ Teqdimatin sutunlari cedvellerin sutunlarina birbasha esaslanmalidirlar 
	ve hesablanan mena olmamalidirlar.

	+ UNION/UNION ALL, CROSS JOIN, EXCEPT или INTERSECT 
	operatorlarinin vasitesi ile formalashan teqdimat sutununu modifikasiya etmek olmaz.
	+ Menasi qruplashma neticesinde alinan, meselen, 
	DISTINCT, GROUP BY и HAVING elavelerinin istifadesi 
	neticesinde alinan teqdimatin sutununu modifikasiya etmek olmaz. 


	 SQL-de teqdimatlar melumat bazasina daxil olan 
	 sorgularin saxlanmasi ve tekrar istifade olunmasi uchun istifade olunur.	
	 Belelikle, murekkeb mentiqi inkapsullashdirma olaraq 
	 ve onu melumat bazasinda mueyyen ad altinda gelecekde istifade uchun saxlamaq olar.
	 Hemchinin teqdimatlarin vasitesi ile melumatlara girish huquqlarini 
	 rahat shekilde teqdim etmek olar.


	Sintaksis:

	CREATE VIEW view_name 
	[WITH SCHEMABINDING]
	AS
	SELECT ...

	ALTER VIEW view_name AS
	SELECT ...

	DROP VIEW view_name 


	SCHEMABINDING
	eger SCHEMABINDING arqumenti gosterilmishdirse, cedveli ve yaxud cedvelleri bele usulla deyishmek olmaz, 
	hansi ki, teqdimatin mueyyen edilmesine tesir gostere biler.
	once cedvelden olan asililiqlari yigmaq uchun, hansini ki deyishmek lazimdir, 
	teqdimatin ozunu deyishmek ve yaxud silmek lazimdir. 
	SCHEMABINDING arqumentinden istifade eden zaman 
	select_statement instruksiyasi cedvelerin, teqdimatlarin ve yaxud istifadechi funksiyalarinin 
	ikikomponentli adlarini (schema.object) daxil etmelidir. 
	Instruksiyada gosterilen butun obyektler bir melumat bazasinda yerleshmelidirler.
*/

--CREATE VIEW StudInfo
--AS
--SELECT S.FirstName, S.LastName, G.[Name] AS GroupName
--FROM Students AS S
--JOIN Groups AS G
--ON S.Id_Group = G.Id


--ALTER VIEW StudInfo
--AS
--SELECT S.Id, S.FirstName, S.LastName, G.[Name] AS GroupName, F.[Name] AS FacultyNAme
--FROM Students AS S
--JOIN Groups AS G
--ON S.Id_Group = G.Id
--JOIN Faculties AS F
--ON F.Id = G.Id_Faculty


--SELECT * 
--FROM StudInfo


--UPDATE StudInfo
--SET FirstName = 'Kolba'
--WHERE Id = 3


-- ERROR:  View or function 'StudInfo' is not updatable because the modification affects multiple base tables
--UPDATE StudInfo
--SET FirstName = 'Olga', GroupName = 'FBEN_1226' 
--WHERE Id = 3

--EXEC sp_rename 'dbo.Students.Name', 'FirstName', 'COLUMN'

--ALTER VIEW dbo.StudInfo
--WITH SCHEMABINDING
--AS
--SELECT S.Id, S.FirstName, S.LastName, G.[Name] AS GroupName, F.[Name] AS FacultyNAme
--FROM dbo.Students AS S
--JOIN dbo.Groups AS G
--ON S.Id_Group = G.Id
--JOIN dbo.Faculties AS F
--ON F.Id = G.Id_Faculty

--EXEC sp_rename 'dbo.Students.FirstName', 'Name', 'COLUMN'

--ALTER TABLE Students
--DROP COLUMN LastName


--DROP VIEW StudInfo

-- table-lar haqqinda melumat
--SELECT *
--FROM INFORMATION_SCHEMA.TABLES

--SELECT *
--FROM sys.tables


-- view-lar haqqinda melumat
--SELECT *
--FROM INFORMATION_SCHEMA.VIEWS

--SELECT *
--FROM sys.views

-- constraint-lar haqqinda melumat
--SELECT *
--FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS

--SELECT *
--FROM sys.key_constraints

SELECT *
FROM sys.foreign_keys

--SELECT *
--FROM sys.default_constraints

--SELECT *
--FROM sys.check_constraints


-- column-lar haqqinda melumat
--SELECT *
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'Books'

--SELECT *
--FROM sys.columns
--JOIN sys.tables
--ON sys.columns.object_id = sys.tables.object_id
--WHERE sys.tables.[name] = 'Books'

