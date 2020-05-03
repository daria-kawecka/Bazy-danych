CREATE SCHEMA przychodnia;

CREATE TABLE przychodnia.Lekarze(
IDPracownika varchar(6) unique not null PRIMARY KEY,
ImieLekarza varchar(20),
NazwiskoLekarza varchar(20)
);

INSERT INTO przychodnia.Lekarze values
('S1011','Maria','Nowak'),
('S1024','Jan','Kowalski'),
('S1045','Anna','Jabłoński')
('S1034','Marek','Potocki');

CREATE TABLE przychodnia.Pacjenci(
IDPacjenta varchar(6) unique not null PRIMARY KEY,
ImiePacjenta varchar(20),
NazwiskoPacjenta varchar(20)
);

INSERT INTO przychodnia.Pacjenci values
('P100','Anna','Jeleń'),
('P105','Jarosław','Nicpoń'),
('P108','Joanna','Nosek'),
('P120','Jan','Kałuża'),
('P130','Jerzy','Lis'),
('P123','Olga','Nowacka');

CREATE TABLE przychodnia.Zabiegi(
IDZabiegu varchar(6) unique not null PRIMARY KEY,
NazwaZabiegu varchar(15)
);

INSERT INTO przychodnia.Zabiegi values
('Z500','Borowanie'),
('Z496','Lakowanie'),
('Z503','Usuwanie kamienia');

CREATE TABLE przychodnia.Wizyty(
IDWizity varchar(6) unique not null PRIMARY KEY,
DataWizyty Date,
GodzinaWizyty Time,
IDPracownika varchar(6) not null references przychodnia.Lekarze(IDPracownika),
IDPacjenta varchar(6) not null references przychodnia.Pacjenci(IDPacjenta),
IDZabiegu varchar(6) not null references przychodnia.Zabiegi(IDZabiegu)
);

INSERT INTO przychodnia.Wizyty values
('W01','2020-03-12','10:00','P100','S1011','Z500'),
('W02','2020-03-12','13:00','P105','S1011','Z496'),
('W03','2020-03-14','10:00','P108','S1011','Z500'),
('W04','2020-03-16','17:00','P108','S1024','Z503'),
('W05','2020-03-18','09:00','P120','S1045','Z500'),
('W06','2020-03-20','08:00','P130','S1034','Z496'),
('W07','2020-03-12','15:00','P123','S1034','Z503');
