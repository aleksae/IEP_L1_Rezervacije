CREATE TABLE Hotel (
	IdHot			INTEGER,
	Naziv			VARCHAR(50)
);

CREATE TABLE Cenovnik (
	IdHot			INTEGER,
	TipSobe			CHAR,
	CenaPoNocenju	REAL
);

CREATE TABLE Soba (
	IdSob			INTEGER,
	BrojSobe		INTEGER,
	BrojKreveta		INTEGER,
	Tip				CHAR,
	IdHot 			INTEGER
);

CREATE TABLE Korisnik (
	IdKor  			INTEGER,
	ImePrezime		VARCHAR(50)
);

CREATE TABLE Rezervacija (
	IdRez			INTEGER,
	DatumOd   		CHAR(10),
	DatumDo			CHAR(10),
	BrNocenja		INTEGER,
	OsnovnaCena		REAL,
	Status			CHAR,
	IdKor 			INTEGER,
	IdSob 			INTEGER	
);

CREATE TABLE Uplata (
	IdUpl			INTEGER,
	Datum 			CHAR(10),
	Iznos			REAL,
	IdRez			INTEGER
);

CREATE TABLE Kupon (
	IdKup			INTEGER,
	Popust 			REAL,
	MaksBrUpotreba	INTEGER
);

CREATE TABLE primenjujeSe (
	IdKup			INTEGER,
	IdRez			INTEGER
);



-- Hotel
INSERT INTO Hotel( IdHot, Naziv) VALUES( 1, 'Hotel 1');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 2, 'Hotel 2');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 3, 'Hotel 3');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 4, 'Hotel 4');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 5, 'Hotel 5');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 6, 'Hotel 6');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 7, 'Hotel 7');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 8, 'Hotel 8');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 9, 'Hotel 9');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 10, 'Hotel 10');
INSERT INTO Hotel( IdHot, Naziv) VALUES( 11, 'Hotel 11');

-- Cenovnik
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 1, 'L', 110.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 1, 'S', 100.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 1, 'E', 90.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 2, 'L', 220.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 2, 'S', 200.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 2, 'E', 180.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 3, 'L', 330.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 3, 'S', 300.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 3, 'E', 270.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 4, 'L', 440.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 4, 'S', 400.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 4, 'E', 360.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 5, 'L', 550.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 5, 'S', 500.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 5, 'E', 450.0);

INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 6, 'L', 660.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 6, 'S', 600.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 7, 'L', 770.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 7, 'S', 700.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 8, 'L', 880.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 8, 'S', 800.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 9, 'L', 990.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 9, 'S', 900.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 10, 'L', 550.0);
INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 10, 'S', 500.0);

INSERT INTO Cenovnik( IdHot, TipSobe, CenaPoNocenju) VALUES( 11, 'E', 300.0);

-- Soba
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 1, 1, 2, 'L', 1);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 2, 2, 1, 'L', 1);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 3, 3, 2, 'S', 1);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 4, 4, 4, 'S', 1);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 5, 1, 2, 'L', 2);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 6, 2, 1, 'L', 2);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 7, 3, 2, 'S', 2);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 8, 4, 4, 'E', 2);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 9, 1, 2, 'L', 3);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 10, 2, 2, 'S', 3);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 11, 3, 2, 'S', 3);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 12, 4, 4, 'E', 3);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 13, 1, 2, 'L', 4);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 14, 2, 2, 'S', 4);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 15, 3, 3, 'S', 4);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 16, 4, 3, 'E', 4);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 17, 1, 2, 'L', 5);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 18, 2, 2, 'L', 5);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 19, 3, 2, 'E', 5);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 20, 4, 4, 'E', 5);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 21, 1, 2, 'L', 6);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 22, 2, 3, 'S', 6);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 23, 1, 2, 'L', 7);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 24, 2, 1, 'L', 7);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 25, 1, 2, 'S', 8);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 26, 2, 3, 'S', 8);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 27, 1, 2, 'S', 9);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 28, 2, 2, 'L', 9);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 29, 1, 2, 'L', 10);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 30, 2, 4, 'S', 10);

INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 31, 1, 5, 'S', 11);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 32, 2, 3, 'S', 11);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 33, 3, 2, 'E', 11);
INSERT INTO Soba (IdSob, BrojSobe, BrojKreveta, Tip, IdHot) VALUES( 34, 4, 2, 'L', 11);


-- Korisnik
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 1, 'Milica Miskovic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 2, 'Sanja Pesic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 3, 'Petar Radojevic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 4, 'Vladimir Ogrizovic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 5, 'Milovan Misic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 6, 'Marko Kostic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 7, 'Veljko Ostojic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 8, 'Mira Jovic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 9, 'Milan Ivanovic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 10, 'Jelena Milic');
INSERT INTO Korisnik( IdKor, ImePrezime) VALUES( 11, 'Jovana Mislosevic');

-- Rezervacija
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 1, '2022-01-02', '2022-01-12', 10, 1000, 'R', 1, 3);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 2, '2022-02-02', '2022-02-12', 10, 1400, 'R', 2, 4);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 3, '2022-01-12', '2022-01-17', 5, 500, 'R', 1, 1);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 4, '2022-02-12', '2022-02-15', 3, 1700, 'P', 2, 7);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 5, '2022-01-22', '2022-02-12', 21, 1000, 'R', 1, 2);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 6, '2022-08-28', '2022-08-30', 2, 1000, 'R', 3, 21);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 7, '2022-09-02', '2022-09-17', 15, 2500, 'R', 5, 23);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 8, '2022-11-02', '2022-11-12', 10, 700, 'O', 6, 26);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 9, '2022-10-02', '2022-10-18', 16, 800, 'R', 3, 16);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 10, '2022-10-03', '2022-10-07', 4, 900, 'R', 7, 19);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 11, '2022-10-29', '2022-10-31', 2, 1000, 'R', 8, 12);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 12, '2022-11-24', '2022-11-27', 3, 1100, 'R', 1, 9);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 13, '2022-01-17', '2022-01-22', 5, 1500, 'P', 1, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 14, '2022-03-05', '2022-03-10', 5, 500, 'P', 2, 7);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 15, '2022-11-12', '2022-11-15', 3, 300, 'R', 6, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 16, '2022-11-17', '2022-11-20', 3, 300, 'R', 6, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 17, '2022-11-20', '2022-11-30', 10, 2000, 'R', 6, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 18, '2023-01-27', '2023-01-30', 3, 620, 'P', 10, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 19, '2022-11-22', '2022-11-28', 6, 2800, 'O', 6, 31);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 20, '2022-12-22', '2022-12-26', 4, 2000, 'O', 11, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 21, '2022-12-26', '2022-12-29', 3, 1800, 'R', 10, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 22, '2022-12-29', '2023-01-01', 3, 1770, 'P', 11, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 23, '2023-01-01', '2023-01-12', 11, 2200, 'R', 10, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 24, '2023-02-01', '2023-02-22', 21, 3900, 'P', 10, 33);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 25, '2023-02-01', '2023-02-22', 21, 4000, 'O', 10, 34);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 26, '2022-10-15', '2022-10-17', 2, 900, 'R', 10, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 27, '2022-10-17', '2022-10-24', 7, 3500, 'R', 10, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 28, '2022-10-24', '2022-11-03', 10, 6000, 'R', 10, 30);
INSERT INTO Rezervacija (IdRez, DatumOd, DatumDo, BrNocenja, OsnovnaCena, Status, IdKor, IdSob) VALUES( 29, '2022-11-03', '2022-11-05', 2, 1100, 'O', 10, 30);


-- Uplata
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 1, '2021-12-05', 100, 1);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 2, '2021-12-05', 1000, 2);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 3, '2021-12-13', 1000, 4);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 4, '2021-12-20', 1000, 7);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 5, '2023-01-22', 1000, 7);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 6, '2023-01-24', 1000, 7);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 7, '2023-01-25', 1000, 7);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 8, '2023-01-26', 1000, 7);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 9, '2021-12-06', 1000, 2);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 10, '2021-12-07', 1000, 2);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 11, '2021-12-08', 1000, 2);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 12, '2021-12-14', 700, 4);
INSERT INTO Uplata (IdUpl, Datum, Iznos, IdRez) VALUES( 13, '2021-12-15', 1000, 4);

-- Kupon
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 1, 10.0, 2);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 2, 12.0, 3);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 3, 15.0, 1);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 4, 25.0, 10);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 5, 25.1, 7);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 6, 17.0, 5);
INSERT INTO Kupon (IdKup, Popust, MaksBrUpotreba) VALUES( 7, 1.0, 5);


-- primenjujeSe
INSERT INTO primenjujeSe( IdKup, IdRez) VALUES( 1, 1);
INSERT INTO primenjujeSe( IdKup, IdRez) VALUES( 1, 2);
INSERT INTO primenjujeSe( IdKup, IdRez) VALUES( 3, 5);
INSERT INTO primenjujeSe( IdKup, IdRez) VALUES( 5, 18);
INSERT INTO primenjujeSe( IdKup, IdRez) VALUES( 4, 19);

