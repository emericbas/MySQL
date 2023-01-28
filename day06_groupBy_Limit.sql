/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.Tabloda degismeyip, gecici olarak yazdirirken degistirebiliriz
===============================================================*/
use sys;
CREATE TABLE employees
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);
INSERT INTO employees VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees VALUES(345678901, 'Mine Bulut', 'Izmir');
 select* from employees;
 select employee_id AS id,employee_name AS name, employee_birth_city as city
 from employees;
 
 /* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/  
CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);
SELECT * FROM manav;

-- 1 : Isme gore, alinan urunlerin toplam kilosunu bulup, 
-- isim sirasina gore siralayiniz
select isim, SUM(urun_miktar) AS top_kg
from manav
GROUP BY isim
ORDER BY isim;
-- 2  : Isme gore, alinan urunlerin toplam kilosunu bulup, 
-- isim sirasina gore ters siralayiniz
select isim, SUM(urun_miktar) AS top_kg
from manav
GROUP BY isim
ORDER BY isim desc;

-- 3: bunlari bir de toplam kiloya gore siralayiniz
SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav
GROUP BY isim
ORDER BY top_kg DESC;

-- 4) Urun ismine gore, urunu alan toplam kisi sayisini,
-- kisi sayisina gore siralayiniz.
select urun_adi ,count(isim) kisi_sayisi
from manav
 group by urun_adi
 order by kisi_sayisi;

-- 5) Alinan kilo miktarina gore musteri sayisini , urun_miktar ini ters sirasina gore listeleyiniz.
select urun_miktar, count(isim) kisi_sayisi
from manav
group by urun_miktar
order by urun_miktar desc;


-- 6) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi,count(isim) kisi_sayisi
from manav
where urun_adi is not null
group by urun_adi
order by urun_adi;

-- 7) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore siralayarak
-- listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
select urun_adi ,max(urun_miktar) max_kilo, min(urun_miktar) min_kilo
from manav
where urun_adi is not null
group by urun_adi
order by max_kilo desc; -- en fazla urune gore siralasin

-- 8) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.
select isim,urun_adi, sum(urun_miktar) top_kg
from manav
group by isim,urun_adi
order by isim desc, urun_adi;


-- 9) Satilan meyvenin 4 harfli olmasina (urun_adi) gore urun alan kisi sayisini,
-- urun_adi NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL'i 4 karakter dusunme, o hicliktir
select urun_adi,count(isim) kisi_sayisi
from manav
where urun_adi like'____'
group by urun_adi
order by urun_adi;
