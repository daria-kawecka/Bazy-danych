CREATE SCHEMA dostawcy;
CREATE SCHEMA produkty;

CREATE TABLE dostawcy.Miejscowosci(
	Kod_Miejscowosci varchar(6) unique not null PRIMARY KEY,
	Miejscowosc varchar(20)
);

INSERT INTO dostawcy.Miejscowosci values 
('31-435','Kraków'),
('31-342','Kraków'),
('04-242','Lublin'),
('30-243','Tarnów'),
('35-434','Nowy Targ');

CREATE TABLE dostawcy.Dostawcy(
	IdDostawcy varchar(9) unique not null PRIMARY KEY,
	NazwaDostawcy varchar(20),
	Kod_Miejscowosci varchar(6) not null REFERENCES dostawcy.Miejscowosci(Kod_Miejscowosci),
	Ulica varchar(20),
	Numer_bud varchar(10)
);

INSERT INTO dostawcy.Dostawcy values 
('D_MP','Makarony Polskie','31-435','Turystyczna','40'),
('D_LM','Lubelski Makaron','04-242','Piłsudskiego','332a'),
('D_PolP','Polskie przetwory','31-342','Wojska Polskiego','44a'),
('D_PrzeP','Przetwory pomidorowe','30-243','Rolnicza','22/4'),
('D_MS','Małopolskie Smaki','35-434','Mickiewicza','223/77');

CREATE TABLE produkty.Ceny(
	CenaBrutto float not null PRIMARY KEY,
	CenaNetto float
);

INSERT INTO produkty.Ceny values 
(150,130),
(220,200),
(110,89);

CREATE TABLE produkty.Produkty(
	IdProduktu varchar(6) not null unique PRIMARY KEY,
	NazwaProduktu varchar(30),
	CenaBrutto float REFERENCES produkty.Ceny(CenaBrutto)
	IdDostawcy1 varchar(8) not null REFERENCES dostawcy.Dostawcy(IdDostawcy),
	IdDostawcy2 varchar(8) not null REFERENCES dostawcy.Dostawcy(IdDostawcy)
)

INSERT INTO produkty.Produkty values 
('P_MN','Makaron Nitki',150,'D_MP','D_LM'),
('P_KP','Keczup pikantny',220,'D_PolP','D_PrzeP'),
('P_SP','Sos pomidorowy',110,'D_PolP','D_MS');
