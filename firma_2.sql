CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy(
id_pracownika varchar(5) unique NOT NULL PRIMARY KEY,
Imie varchar(20),
Nazwisko varchar(20),
Adres varchar(20),
Telefon varchar(8)
);
COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela z danymi pracowników';

INSERT INTO ksiegowosc.pracownicy values
('P001','Anna','Jeleń','Kraków','556556556'),
('P002','Jarosław','Nicpoń','Kraków','896536487'),
('P003','Alicja','Śledź','Częstochowa','566741147'),
('P004','Marek','Król','Tarnów','656585614'),
('P005','Andrzej','Długosz','Częstochowa','525748635'),
('P006','Olaf','Bałwan','Kraków','567923012'),
('P007','Janusz','Duda','Warszawa','741852963'),
('P008','Anastazja','Czerny','Tarnów','654987321'),
('P009','Mateusz','Czerny','Tarnów','569831421');
('P010','Malwina','Zawadzka','Częstochowa','641758423');

CREATE TABLE ksiegowosc.godziny(
id_godziny varchar(5) unique NOT NULL PRIMARY KEY,
Data DATE,
Liczba_godzin smallint,
id_pracownika varchar(5) not null references ksiegowosc.pracownicy(id_pracownika)	
);
COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela z danymi dotyczącymi przepracowanych godzin';

INSERT INTO ksiegowosc.godziny values 
('G001','2020-05-05',121,'P001'),
('G002','2020-05-04',168,'P002'),
('G003','2020-05-05',89,'P003'),
('G004','2020-05-10',100,'P004'),
('G005','2020-05-11',61,'P005'),
('G006','2020-05-07',92,'P006'),
('G007','2020-05-14',172,'P007'),
('G008','2020-05-11',23,'P008'),
('G009','2020-05-09',115,'P009'),
('G010','2020-05-06',55,'P010');

CREATE TABLE ksiegowosc.pensja(
id_pensji varchar(5) unique NOT NULL PRIMARY KEY,
stanowisko varchar(25),
kwota float
);
COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela z pensjami pracowników';

INSERT INTO ksiegowosc.pensja values
('PS001','kierownik', 10500),
('PS002','gł.księgowa',9200),
('PS003','asystentka',4200),
('PS004','HR',3100).
('PS005','doradca',2500),
('PS006','kierownik',9999.99),
('PS007','pracownik',5200),
('PS008','asystentka',4100),
('PS009','tester jakości',7500.50)
('PS010','PR',4506);

CREATE TABLE ksiegowosc.premia(
id_premii varchar(5) unique NOT NULL PRIMARY KEY,
rodzaj varchar(15),
kwota float
);
COMMENT ON TABLE ksiegowosc.premia IS 'Tabela z premiami pracowników';

INSERT INTO ksiegowosc.premia values
('PR001','uznaniowa',500),
('PR002','świąteczna',220),
('PR003','zapomoga',150),
('PR004','uznaniowa',350),
('PR005','motywacyjna',150),
('PR006','uznaniowa',250),
('PR007','świąteczna',225),
('PR008','kwartalna',125),
('PR009','okolicznościowa',450),
('PR010','za zasługi',520);

CREATE TABLE ksiegowosc.wynagrodzenie(
id_wynagrodzenia varchar(5) unique NOT NULL PRIMARY KEY,
Data DATE,
id_pracownika NOT NULL references ksiegowosc.pracownicy(id_pracownika),
id_godziny references ksiegowosc.godziny(id_godziny),
id_pensji references ksiegowosc.pensja(id_pensji),
id_premii references ksiegowosc.premia(id_premii);
);
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela z danymi dotyczącymi wynagrodzeń pracowników';

INSERT INTO ksiegowosc.wynagrodzenie
('W001','2020-05-05','P001','G001','PS001','PR001'),
('W002','2020-05-06','P002','G002','PS002','PR002'),
('W003','2020-05-05','P003','G003','PS003','PR003'),
('W004','2020-05-08','P004','G004','PS004','PR004'),
('W005','2020-05-10','P005','G005','PS005','PR005'),
('W006','2020-05-12','P006','G006','PS002','PR001'),
('W007','2020-05-14','P007','G007','PS009','PR004'),
('W008','2020-05-15','P008','G008','PS006','PR002'),
('W009','2020-05-01','P009','G009','PS010','PR009'),
('W010','2020-05-03','P010','G010','PS003','PR010');


--ZAPYTANIA

SELECT kpr.id_pracownika, kpr.Nazwisko FROM ksiegowosc.pracownicy kpr;

SELECT kw.id_pracownika, kp.kwota, kprem.kwota_premii FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kp, ksiegowosc.premia kprem
	WHERE kw.id_pensji = kp.id_pensji AND kw.id_premii = kprem.id_premii AND kpen.kwota + kprem.kwota > 1000;
	
SELECT kw.id_pracownika FROM ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kpen
	WHERE kw.id_pensji=kpen.id_pensji AND kw.id_premii IS NULL and kpen.kwota > 2000;

SELECT * FROM ksiegowosc.pracownicy kpr WHERE kpr.Imie like '%J'

SELECT kpr.Imie, kpr.Nazwisko FROM ksiegowosc.pracownicy kpr WHERE kpr.Nazwisko IN '%n%' AND kpr.Imie like '%a'

SELECT kpr.Imie, kpr.Nazwisko FROM ksiegowosc.pracownicy kpr, ksiegowosc.godziny kgodz
	WHERE kprac.id_pracownika = kgodz.id_pracownika AND kgodz.liczba_godzin > 160;

SELECT kpr.Imie, kpr.Nazwisko FROM ksiegowosc.pracownicy kpr, ksiegowosc.wynagrodzenie kw, ksiegowosc.pensja kpen,
	WHERE kpr.id_pracownika = kw.id_pracownika AND kw.id_pensji = kpen.id_pensji AND kpen.kwota > 1500 AND kpen.kwota <3000;

SELECT kpr.Imie, kpr.Nazwisko FROM ksiegowosc.pracownicy kpr, ksiegowosc.godziny kgodz, ksiegowosc.wynagrodzenia kw
	WHERE kpr.id_pracownika = kw.id_pracownika AND kw.id_godziny = kgodz.id_godziny AND kgodz.liczba_godzin > 160 AND kw.id_premii IS NULL;

SELECT kw.id_pracownika FROM ksiegowosc.pensja kpen, ksiegowosc.wynagrodzenie kw
	WHERE kpen.id_pensji = kw.id_pensji ORDER BY kpen.kwota;
	
SELECT kw.id_pracownika, kpen.kwota, kpr.kwota FROM ksiegowosc.pensja kpen 
	LEFT JOIN ksiegowosc.wynagrodzenie kw ON kpen.id_pensji = kw.id_pensji 
	LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii
ORDER BY kpen.kwota DESC, kpr.kwota DESC;

SELECT COUNT(*) kpen.stanowisko FROM ksiegowosc.pensja AS kpen
	GROUP BY kpen.stanowisko;

SELECT MIN(kpen.kwota), MAX(kpen.kwota) FROM ksiegowosc.pensja kpen 
	WHERE kpen.stanowisko = 'kierownik';

SELECT SUM(COALESCE(kpr.kwota,0))+ SUM(COALESCE(kpen.kwota,0)) AS wynagrodznie FROM ksiegowosc.wynagrodzenie kw 
	LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
	LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii 
	
SELECT SUM(COALESCE(kpr.kwota,0))+ SUM(COALESCE(kpen.kwota,0)) AS wynagrodznie FROM ksiegowosc.wynagrodzenie kw 
	LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji = kpen.id_pensji
	LEFT JOIN ksiegowosc.premia kpr ON kw.id_premii = kpr.id_premii GROUP BY kpen.stanowisko
	
SELECT COUNT(kw.id_premii) FROM ksiegowosc.wynagrodzenia 
	LEFT JOIN ksiegowosc.pensja kpen ON kw.id_pensji=kpen.id_pensji GROUP BY kpen.stanowisko
	
DELETE
FROM  ksiegowosc.wynagrodzenie kw    
USING ksiegowosc.pensja kpen 
WHERE kpen.kwota < 1200 AND kw.id_pensji = kpen.id_pensji 
