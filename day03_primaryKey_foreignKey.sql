/*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);

=====PRIMARY KEY
-- Primary keys are one of the most important concepts in database table design.
--Almost every database table should have a primary key- chosen by you from the set of candidate keys.
--The main purpose is uniquely identifying records in a table
-- Primary key are unique + not null
primary key never changed 
== FOREIGN KEY===
FK are designed columns that point to primary key of another table
-- A foreign key points to the primary key of another table
--Inputs of FK must be equel to the input of the PK
--Each value of FK must exist in PK of another table
--FK are not actual keys
--PK table (Referenced Table) is called parent table, FK is child table
--CONSTRAINT + name_field ==>> when we connect two tables ,we can call by this name for all data

**********
Example: IRON(batch_id)PRIMARY KEY===>>CHAIR(batch_id)===>>SHOOPING(batch_id)==>>CUSTOMER(batch_id)
if the chair is broken,if we have garanteed ,they can check to follow batch_id(PK)where is the problem caused .PK never changes, so we can't find where problem is
**********
================================================================================================*/
CREATE TABLE students(
id int primary key,
student_name varchar(20) not null,
address varchar(50),
phone varchar(11)unique
);
/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/
create table sehirler(
alan_kodu char(4)Primary Key,
isim varchar(20)not null,
nufus int );

/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/
create table ogretmenler(
id int unique,
isim varchar(25),
brans varchar(10),
cinsiyet varchar(5),
CONSTRAINT id_isim_pk PRIMARY KEY(id,isim));
select * from ogretmenler;
/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/
create table universite_ogrenci_bilgi_sistemi(
giris_yili date,
giris_siralamasi int,
isim varchar(25) not null,
bolum varchar(15),
CONSTRAINT ogrenci_no_pk PRIMARY KEY(giris_yili,giris_siralamasi));
select * from universite_ogrenci_bilgi_sistemi;

/*====================================== FOREIGN KEY ==============================================
=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
Note 1: "Parent Table" olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz 
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir, sonra "Parent Table" silinir.
        
-----Syntax-----
CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
====================================================================================================*/

/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/

create table tedarikci(
tedarikci_id int,
tedarikci_ismi varchar(15),
iletisim_isim varchar(20),
CONSTRAINT tedarikci_pk PRIMARY KEY (tedarikci_id));

create table urunler(
tedarikci_id int,
urun_id int,
CONSTRAINT urunler_fk FOREIGN KEY(tedarikci_id)
REFERENCES tedarikci(tedarikci_id));
/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "not"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/
CREATE TABLE bebeler
(
id INT,
isim VARCHAR(10),
iletisim VARCHAR(10),bebeler,
CONSTRAINT bebeler_pk PRIMARY KEY (id)
);
CREATE TABLE notlar
(
bebe_id INT,
puan INT,
CONSTRAINT notlar_fk FOREIGN KEY (bebe_id)
REFERENCES bebeler (id)
);