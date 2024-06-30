-- Transactions
/*
Tranzaksiya ya hamisi muveffeqiyyetle yerine yetirilen ve yaxud
hech biri yerine yetirilmeyen bir ve ya bir neche emeliyyatdan 
ibaret bir emeliyyatdir.

ACID

A - Atomicity (atomarliq) - Tranzaksiya bir bolunmez emeliyyat 
	hesab olunur. Tranzaksiyad olan emeliyyatlarin ya hamisi 
	muveffeqiyyetle yerine yetirilmelidir ve yaxud hech biri 
	yerine yetirilmeli deyil

C - Consistency (Razilashdirilmish) - Her bir tranzaksiya -
	ister yerine yetmish ister yerine yetmemish Verilenler Bazasini
	razilashdirilmish veziyetde saxlamalidir 
	(DB ve obyektler-in butun mehdudiyyetleri 
	teyin edildiyi veziyyetde qalmalidir)

I - Isolation (izolyasiya) - Her bir tranzaksiya ele 
	yerine yetirilmelidir ki, sanki butun diger tranzaksiyalardan
	ayri olaraq movcuddur

D - Durability (dayaniqliq) - Eger serverde her hansi bir problem
	yashanarsa (server chokub, ishiqlar sonub ve s.), Server berpa
	olunan kimi, bitmish tranzaksiyalar yerine yetirilmish veziyyetde
	qalmalidir, yarim qalmish tranzaksiya ise rollback olunmalidir


SQL - 2 esas tranzaksiya tipi movcuddur
 + Sistem tranzaksiyalar
 + Istifadechi tranzaksiyalari

 SQL Serverde istifadechi tranzaksiyalarinin 3 tipi var
	+ Autocommit (Autofiksasiya) - Her bir komanda ayrica bir tranzaksiya
		kimi qebul edilir, uqurlu yerine yetmesi zamani server ozu autocommit
		edir.
	+ Implicit transactions (Qeyri-ashkar tranzaksiyalar) - Tranzaksiyanin
		bashlanmasini qeyd etmek lazim deyil, amma commit ve ya rollback
		gosterilmelidir. Bu davranishi ishe salmaq uchun 
		- SET_IMPLICIT_TRANSACTIONS ON komandasi yaerine yetirilmelidir.
	+ Explicit transactions (Ashkar tranzaksiyalar) -  istifadechi tranzaksiyanin
		hem bashlanmasini, hem de bitmesini gostermelidir.


Sintaksis:
BEGIN TRANSACTION | BEGIN TRAN - tranzaksiyanin bashlanmasi
COMMIT - tranzaksiyanin fiksaiyasi (uquqrla heyata kechirilibse)
ROLLBACK - tranzaksiyanin redd olunmasi (sehv olduqu halda)
SAVE TRANSACTION - saxlama noqtesinin teqin edilmesi
*/

