CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
use sys;
-- 1) Isme gore toplam maaslari bulun
select isim,sum(maas) top_maas
from isciler
group by isim;
-- 2) Sehre gore toplam isci sayisini ,sayisinin buykten kucuge  gore bulun
select sehir, count(isim) isci_sayisi
from isciler
group by sehir
order by isci_sayisi desc;
-- 3) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun
select sirket ,count(isim) isci_sayisi
from isciler
where maas>5000
group by sirket;
-- 4) Her sirket icin Min ve Max maasi bulun
select sirket,min(maas) min_maas,max(maas) max_maas
from isciler
group by sirket;
/*======================== HAVING CLAUSE =======================
    HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.
    Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.    
===============================================================*/
-- 1) Sirketlere gore  isci-sayisi 1 'den buyukse 
select  sirket ,count(isim) isci_sayisi
from isciler
group by sirket
HAVING isci_sayisi>1;

-- 2) 	Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz
select isim, sum(maas) toplam_gelir
from isciler
group by isim
having  toplam_gelir>8000;

-- 3) Her sirketin MIN maaslarini eger 4000'den buyukse goster
select sirket, min(maas) min_maas
from isciler
group by sirket
having min_maas>4000; 
-- Yeni create ettigimiz bir field uzerinden filtreleme yaptigimiz icin
-- WHERE cumlecigini kullanamayiz, WHERE cumlecigi sadece tablomuzda var olan
-- field'lar icin bir filtreleme yapar.
-- 4) Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini 
-- ve MAX maasi veren sorgu yaziniz
select sehir, max(maas) max_maas
from isciler
group by sehir
having max_maas<5000;
-- 5) Eger bir sehirde alinan MAX maas 5000'den buyukse sehir ismini
-- ve MAX maasi, sehir isim sirali veren sorgu yaziniz
select sehir ,max(maas) max_maas
from isciler 
group by sehir
having max_maas>5000;
/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.
>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!

-- LIMIT is used to list a specific part of the rows given in the table
-- Listing the number of records we use after the LIMIT command
=========================================*/
-- 1) Isciler tablosundan ilk 5 kaydi getiriniz
select* from isciler limit 5;


-- 2) Isim sirali tablodan ilk 3 kaydi listeleyin.
select * from isciler 
order by isim 
limit 3;
-- 3) Maas sirali tablodan 4. kayittan 6. kayda kadar olan
-- kayitlarin isim ve sehir bilgilerini listeleyin.
select isim,sehir 
from isciler
order by maas
limit 3,3;

-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.
select * from isciler order by maas desc  limit 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listeleyen sorguyu yaziniz.
select isim from isciler order by maas limit 3;
-- 6) Maasi en dusuk 3 kisinin sadece isimlerini,isim sirali listeleyen sorguyu yaziniz.
select isim from isciler order by maas,isim limit 3; 
-- 7) Maasi en dusuk 3 kisinin sadece isimlerini,isim ve sehir sirali listeleyen sorguyu yaziniz.
select isim from isciler order by maas,isim ,sehir limit 3; 
-- 8) Maas'i 4000'den buyuk olan 3 kisinin sehrini ve ismini  siralayiniz.
select sehir,isim from isciler  where maas>4000 limit 3;
-- 8) Maas'i 4000'den buyuk olan 3 kisinin sehrini ve ismini  maas sirali siralayiniz.
select sehir,isim from isciler  where maas>4000 order by maas limit 3;
