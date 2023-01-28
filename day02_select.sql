/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/
CREATE TABLE meslek_lisesi (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
SELECT * FROM meslek_lisesi;
INSERT INTO meslek_lisesi VALUE('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUE('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUE('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');
select *from meslek_lisesi;
-- Q1 DERECESU 90'DAN YUKSEK OLAN OGRENCILERIN TUM BILGILERINI GETIRIN
SELECT *
FROM meslek_lisesi
WHERE derece>90;
-- Q2 DERECESI 80'DEN KUCUK OLANLARIN ISIMLERINI GETIR
SELECT isim
FROM meslek_lisesi
WHERE derece <80;

-- Q3  ADRESI ANKARA OLAN  OGRENCILERIN  ISIM VE DERECE BILGILERINI GETIR
SELECT isim,derece
FROM meslek_lisesi
WHERE adres='Ankara';
 
-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.
SELECT isim,adres
FROM meslek_lisesi
where okul_no='1005';

-- Q5 DERECESI 70 ILE 80 ARASINDA OLAN OGRENCILERIN OKUL NO VE ADRESINI GETIR
SELECT okul_no,adres
FROM meslek_lisesi
WHERE 70<derece AND derece<80;

-- **************************************************************
-- *************************************************************************
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUE (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUE (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUE (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUE (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUE (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUE (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUE (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;

-- Q1: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listeleyin.
SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu>80;
/*-------------------------------------------------------------------------
Q2: Adresi Ankara olan ogrencilerin isim ve adres bilgilerini listeleyin.
---------------------------------------------------------------------------*/
SELECT isim,adres
from  ogretmen_lisesi
where adres='Ankara';
/*-------------------------------------------------------------------------
Q3: id'si 114 olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/
SELECT *
from  ogretmen_lisesi
where id=114;
/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.

-- BETWEEN command is used to select data within given range.The data can be numbers,text or dates
-- Between command inclusive:begin and end data are included(100,200)

-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 OR deger2;
=========================================================================================*/
/*==========================AND KEYWORD (ve) Operatoru kullanimi==================================
The AND command is used with WHERE to only include rows where both conditions are ture
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
/*-------------------------------------------------------------------------
Q4: Sinav notu 70ile 80 arasinadki,sinirlar dahil  olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *
FROM ogretmen_lisesi
WHERE sinav_notu 
BETWEEN 70 AND 80;

/*-------------------------------------------------------------------------
Q5: Muhammet Talha ve Murat arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/
SELECT isim
FROM ogretmen_lisesi
WHERE isim
BETWEEN 'Muhammet Talha' AND'Murat' ;
-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.
/*-------------------------------------------------------------------------
Q6: Ankara ile Corum arasinda olan ogrencilerin isimlerini ,adreslerini listeleyin.
---------------------------------------------------------------------------*/
SELECT isim,adres
FROM ogretmen_lisesi
WHERE adres
BETWEEN 'Ankara' AND'Corum' ;-- listeye eklenme sirasina gore yazdirdi 
-- **************************************************************
CREATE TABLE personel(
id char(5),
isim varchar(50),
maas int
);
INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel  VALUES('10006','Ayse Can',5600);
INSERT INTO personel   VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel  VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);
SELECT * FROM personel;
/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE id
BETWEEN '10005' AND '10009';
/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel
Where isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';
/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel
Where isim
BETWEEN 'Ahmet' AND 'Ayse Cano';
/*-------------------------------------------------------------------------
Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/
SELECT id
FROM personel
WHERE maas=7000 OR isim='Ayse';
/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE id= 10001 OR  10005 OR 10008  ;

/*================================== SELECT-IN ===========================================
THE IN commands allows you to specify multiple values in A WHERE  clause. 
It is like OR command. We can select with IN multiple conditions

IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

/*-------------------------------------------------------------------------
Q12: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE id
IN('10001','10005','10008');
/*-------------------------------------------------------------------------
Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE maas
IN(7000,12000);
/*================================== SELECT-LIKE ========================================
-- The LIKE operator is used in WHERE clause to search for specified pattern in a column.
--There are two symbol often to used with LIKE
1-The percent sign %===>> the meaninig of this reresent to zero ,one or multiple characters
2- The underscore sign _ represent to one,single character
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a%';
/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '%ayse%';
/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '%n';
 
/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '_e%';

/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '_e%' AND isim LIKE '%Y%';

/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim NOT LIKE '%A%' ;

/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE maas  LIKE '_____' ;

/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a_____a%' ;






