/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
If we would like to update data(assign a new data), we are usiing UPDATE command
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
========================================================================================*/
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/
use sys;
create table firmalar(
id int ,
isim varchar(20),
iletisim_isim varchar(20),
CONSTRAINT firmalar_pk PRIMARY KEY(id,isim));
/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
INSERT INTO firmalar VALUES
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');
SELECT * FROM firmalar;
-- id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz
UPDATE firmalar SET isim ='KRM' WHERE id=3;


-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
update firmalar set isim='FDS',id=4 WHERE iletisim_isim ='Veli Gul';

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
update firmalar set iletisim_isim='Osman Can' where isim='ACB';

-- Osman Can'i Ayse Can yapalim
update firmalar set iletisim_isim='Ayse Can' where iletisim_isim='Osman Can';
