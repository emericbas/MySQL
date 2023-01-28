-- Yorum satiri===> This is for comment line
-- bu da 2. yorum satiri

/*
yorum  This is also comment paragraph
paragrafi
ornegi
*/
USE sys;   -- use istedigin kadar calistirilabilir
-- NOTE= firstly we should select to do work place and database
-- NOTE= If you would like to use different database ,we should use ===> CREATE DATABASE nameOfTheDataBase

/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

CREATE TABLE ogrenciler1(
id CHAR(4),
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE
);

DROP TABLE ogrenciler1;

SELECT * FROM ogrenciler1;

CREATE TABLE ogrenciler1(
id CHAR(4),
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE
);

SELECT * FROM ogrenciler1; -- * hepsini sec demek ,Tabloyu da gorebilirsin,select komutu istedigin kadar calistirilir
/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/
CREATE TABLE tedarikciler (
tedarikci_id CHAR(4),
tedarikci_ismi VARCHAR (30),
ulasim_tarihi DATE,
tedarikci_adresi VARCHAR(100)
);

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.
CREATE TABLE ogrenci_derece
AS
SELECT isim, not_ortalamasi
FROM ogrenciler1;
SELECT * FROM ogrenci_derece; -- tabloyu gorebiliriz
/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/
CREATE TABLE  tedarikciler_son
AS 
SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler;
SELECT * FROM tedarikciler_son;
 use sys;
