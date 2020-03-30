--pracownicy(id_pracownika, imie, nazwisko, adres, telefon)--
CREATE TABLE pracownicy (
	ID_pracownika serial primary key,
	imie VARCHAR(20) NOT NULL,
	nazwisko VARCHAR(20) NOT NULL,
	adres VARCHAR(30),
	telefon INT
);

--godziny(id_godziny, data, liczba_godzin , id_pracownika)--
CREATE TABLE godziny (
	ID_godziny serial unique primary key,
	dzień date,
	Liczba_Godzin int NOT NULL,
	id_pracownika serial references pracownicy(ID_pracownika)
);
--pensje(id_pensji, stanowisko, kwota, id_premii)
CREATE TABLE pensje (
	ID_pensji serial unique primary key NOT NULL,
	stanowisko VARCHAR(20),
	kwota INT,
	ID_premii INT unique
);
--premie(id_premii, rodzaj, kwota)
CREATE TABLE premie (
 	ID_premii serial primary key,
	rodzaj varchar(20),
	kwota INT
);

ALTER TABLE premie
ADD FOREIGN KEY (ID_premii) REFERENCES pensje(ID_premii);

ALTER TABLE pensje
ADD FOREIGN KEY (ID_pensji) REFERENCES pracownicy(ID_pracownika);


--REKORDY W TABELI PRACOWNICY -- 
INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Jan','Kowalski','Kraków','999123131');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Anna','Nowak','Warszawa','152468435');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Miłosz','Nowak','Kraków','454823333');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Andrzej','Makrela','Częstochowa','123456789');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Mariola','Koźmin','Kraków','987654321');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Jolanta','Zawadzka','Częstochowa','100293128');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Marzena','Jaworska','Kraków','875436941');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Marek','Walczyk','Warszawa','545842169');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Matylda','Czerwińska','Wrocław','523641578');

INSERT INTO pracownicy (imie, nazwisko, adres, telefon) 
VALUES ('Anita','Sadowska','Łódź','456123789');

--REKORDY TABELI GODZINY --
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-03','10');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-08','6');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-03','9');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-03','8');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-04','12');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-06','11');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-03','8');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-03','8');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-04','12');
INSERT INTO godziny(dzień, liczba_godzin)
VALUES ('2020-03-04','8');

--REKORDY TABELI PENSJE--
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('kierownik',9600,1);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('asystentka kier.',4200,2);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('zas. kierownika',8200,3);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('informatyk',8000,4);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('sprzątaczka',3200,5);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('PR Manager',4500,6);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('Analityk',5200,7);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('Asystent z. kier.',4200,8);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('księgowa',3500,9);
INSERT INTO pensje(stanowisko,kwota,ID_premii)
VALUES ('CEO',14200,10);

--REKORDY TABELI PREMIE--
INSERT INTO premie(rodzaj, kwota)
VALUES ('uznaniowa',500);
INSERT INTO premie(rodzaj, kwota)
VALUES ('zadaniowa',250);
INSERT INTO premie(rodzaj, kwota)
VALUES ('zapomoga',400);
INSERT INTO premie(rodzaj, kwota)
VALUES ('świąteczna',250);
INSERT INTO premie(rodzaj, kwota)
VALUES ('motywacyjna',300);
INSERT INTO premie(rodzaj, kwota)
VALUES ('zapomoga',300);
INSERT INTO premie(rodzaj, kwota)
VALUES ('uznaniowa',420);
INSERT INTO premie(rodzaj, kwota)
VALUES ('zadaniowa',150);
INSERT INTO premie(rodzaj, kwota)
VALUES ('kwartalna',1500);
INSERT INTO premie(rodzaj, kwota)
VALUES ('indywidualna',3000);