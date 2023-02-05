use sys;
/*============================ DISTINCT ===========================
    DISTINCT cumlecigi bir Sorgu ifadesinde benzer olan kayitlari
    filtrelemek icin kullanilir. Dolayisiyla secilen sutun veya 
    sutunlar icin benzersiz veri iceren satirlar olusturmaya yarar.
    
    Syntax :
    --------
    SELECT DISTINCT field_name1, field_name2,...
    FROM table_name
    
===============================================================*/
select * from isciler;
-- 1) Iscilerin yasadigi sehirleri ve ismi listeleyin
 select DISTINCT  sehir,isim from isciler ; -- sehir ve isimi beraber dusunuyor
 
 -- Group By'da bir fielda gore gruplama yapip, Aggregate Function'lar
-- yardimiyla baska bir field'da islem yapip bize islem yaptigi field'i
-- yeni bir field olarak donduruyor.DISTINCT cumlecigi bir Sorgu ifadesinde
-- benzer olan kayitlari filtrelemek icin kullanilir. DISTINCT komutu bize
-- bir field'daki kayitlarin tek bir ornegini dondurur.
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
 select * from manav;
 
 -- 2) Manav tablosundan Satilan farkli meyve turlerini bir query yazinz
 
 select distinct urun_adi from manav;
 -- 3) Satilan farkli meyve turlerini NULL olmayanlari listeleyen
-- bir query yaziniz
select distinct urun_adi from manav where urun_adi is not null;
-- 4) Satilan farkli meyve turlerini NULL olmayanlari isim sirali
--  listeleyen bir query yaziniz
 select distinct urun_adi from manav where urun_adi is not null order by urun_adi;
-- 5) Kac cesit meyve satildiginin sayisini listeleyen bir query yaziniz
select count(distinct urun_adi) tur_sayisi from manav ;
-- 6) Satilan meyve ve satin alan kisi isimlerinden farkli olan ikilileri listeleyen query yaziniz
select distinct urun_adi, isim from manav;

 