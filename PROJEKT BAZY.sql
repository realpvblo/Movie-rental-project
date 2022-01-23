/**/

 

/**/

CREATE TABLE  Pracownik
   (
      Pracownik_ID VARCHAR2(50) PRIMARY KEY, 
	   Imię VARCHAR2(30) NOT NULL, 
	   Nazwisko VARCHAR2(50) NOT NULL, 
      Email VARCHAR2(50) DEFAULT 'BRAK',
	   Telefon VARCHAR2(50) UNIQUE, 
	   Stanowisko VARCHAR2(50) 
   );

CREATE TABLE  Klient
   (
      Klient_ID VARCHAR2(50) PRIMARY KEY, 
	   Imię VARCHAR2(30) NOT NULL, 
	   Nazwisko VARCHAR2(50) NOT NULL,
      Email VARCHAR2(50) DEFAULT 'BRAK',
	   Telefon VARCHAR2(50) UNIQUE,
      Wiek NUMBER(3,0),
      CONSTRAINT Ch_Wiek CHECK (Wiek > 18) 
   );

CREATE TABLE  Lokalizacja
   (
      Lokalizacja_ID VARCHAR2(50) PRIMARY KEY, 
	   Miasto VARCHAR2(30) NOT NULL, 
	   Ulica VARCHAR2(50) NOT NULL,
      Godzina_Otwarcia NUMBER(2,0),
	   Godzina_Zamkniecia NUMBER(2,0),
      CONSTRAINT Ch_Godz CHECK (Godzina_Zamkniecia > Godzina_Otwarcia)
   );

CREATE TABLE  Reżyser 
   (
      Reżyser_ID VARCHAR2(50) PRIMARY KEY, 
	   Imię VARCHAR2(30) NOT NULL, 
	   Nazwisko VARCHAR2(50) NOT NULL,
      Data_Urodzenia DATE,
      CONSTRAINT Ch_Data CHECK ('SYSDATE' > 'Data_Urodzenia'),
	   Miejsce_Urodzenia VARCHAR2(50)
   );

CREATE TABLE  Aktor
   (
      Aktor_ID VARCHAR2(50) PRIMARY KEY, 
	   Imię VARCHAR2(30) NOT NULL, 
	   Nazwisko VARCHAR2(50) NOT NULL,
      Data_Urodzenia DATE,
      CONSTRAINT Ch_Data2 CHECK ('SYSDATE' > 'Data_Urodzenia'),
	   Miejsce_Urodzenia VARCHAR2(50)
   );

CREATE TABLE  Film
   (
      Film_ID VARCHAR2(50) PRIMARY KEY, 
	   Reżyser_ID VARCHAR2(30), 
      Aktor_ID VARCHAR2(30), 
	   Tytuł VARCHAR2(50),
      Rok_Produkcji VARCHAR2(50),
	   Gatunek VARCHAR2(50),
      FOREIGN KEY (Reżyser_ID) REFERENCES Reżyser(Reżyser_ID),
      FOREIGN KEY (Aktor_ID) REFERENCES Aktor(Aktor_ID)
   );

CREATE TABLE  Wypozyczenie 
   (
      Wypożyczenie_ID VARCHAR2(50) PRIMARY KEY, 
	   Klient_ID VARCHAR2(50),
	   Pracownik_ID VARCHAR2(50),
      Film_ID VARCHAR2(50),
	   Lokalizacja_ID VARCHAR2(50),
      FOREIGN KEY (Klient_ID) REFERENCES Klient(Klient_ID),
      FOREIGN KEY (Pracownik_ID) REFERENCES Pracownik(Pracownik_ID),
      FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID),
      FOREIGN KEY (Lokalizacja_ID) REFERENCES Lokalizacja(Lokalizacja_ID),
      CHECK (Klient_ID != Pracownik_ID)
   );

/* INSERT PRACOWNIK */

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P01', 'Sebastian', 'Duda', 'sebastianduda@wypozyczalnia.pl', '124-153-123', 'Kasjer');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P02', 'Adam', 'Kowal', 'adamkowal@wypozyczalnia.pl', '152-623-129', 'Kasjer');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P03', 'Wojtek', 'Polak', 'wojtekpolak@wypozyczalnia.pl', '117-133-731', 'Ochroniarz');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P04', 'Michał', 'Nowak', 'michalnowak@wypozyczalnia.pl', '263-162-136', 'Menadżer');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P05', 'Leon', 'Zalewski', 'leonzalewski@wypozyczalnia.pl', '163-123-361', 'Marketer');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P06', 'Piotr', 'Piotrowski', 'piotrpiotrowski@wypozyczalnia.pl', '123-163-123', 'Kasjer');

INSERT INTO Pracownik (Pracownik_ID, Imię, Nazwisko, Email, Telefon, Stanowisko)
VALUES('P07', 'Andrzej', 'Włoch', 'andrzejwloch@wypozyczalnia.pl', '265-162-367', 'Informatyk');

/* INSERT REŻYSER */

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R01', 'Andrzej', 'Gołota', TO_DATE('01/07/1975', 'dd/mm/yyyy'), 'Warszawa');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R02', 'Krzysztof', 'Kołodziej', TO_DATE('23/04/1969', 'dd/mm/yyyy'), 'Olsztyn');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R03', 'Robert', 'Młody', TO_DATE('15/12/1978', 'dd/mm/yyyy'), 'Białystok');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R04', 'Aleksander', 'Korytko', TO_DATE('12/03/1982', 'dd/mm/yyyy'), 'Bielsk-Podlaski');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R05', 'Norbert', 'Kowalski', TO_DATE('20/06/1973', 'dd/mm/yyyy'), 'Szczecin');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R06', 'Kamil', 'Zabrocki', TO_DATE('19/10/1985', 'dd/mm/yyyy'), 'Kraków');

INSERT INTO Reżyser (Reżyser_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('R07', 'Jerzy', 'Baranowicki', TO_DATE('05/11/1977', 'dd/mm/yyyy'), 'Lublin');

/* INSERT KLIENT */

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K01', 'Marek', 'Kowalczyk', 'marekkowalczyk@onet.pl', '532-123-512', '21');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K02', 'Mariusz', 'Górski', 'mariuszgorski@wp.pl', '633-623-234', '43');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K03', 'Kamil', 'Jaworski', 'kamiljaworski@gmail.com', '515-534-612', '35');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K04', 'Grzegorz', 'Duda', 'grzegorzduda@interia.pl', '173-731-413', '19');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K05', 'Olgierd', 'Błaszczyk', 'olgierdblaszczyk@gmail.com', '813-734-513', '31');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K06', 'Gabriel', 'Piotrowski', 'gabrielpiotrowski@wp.pl', '614-531-134', '54');

INSERT INTO Klient (Klient_ID, Imię, Nazwisko, Email, Telefon, Wiek)
VALUES('K07', 'Michał', 'Wojciechowski', 'michalwojciechowski@wp.pl', '643-345-134', '25');

/* INSERT AKTOR */

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A01', 'Bolesław', 'Witkowski', TO_DATE('01/07/1975', 'dd/mm/yyyy'), 'Wrocław');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A02', 'Ludwik', 'Borkowski', TO_DATE('23/04/1969', 'dd/mm/yyyy'), 'Gdańsk');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A03', 'Kordian', 'Zalewski', TO_DATE('15/12/1978', 'dd/mm/yyyy'), 'Poznań');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A04', 'Kornel', 'Krawczyk', TO_DATE('12/03/1982', 'dd/mm/yyyy'), 'Lublin');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A05', 'Emil', 'Kwiatkowski', TO_DATE('20/06/1973', 'dd/mm/yyyy'), 'Bydgoszcz');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A06', 'Albert', 'Kowalczyk', TO_DATE('19/10/1985', 'dd/mm/yyyy'), 'Kraków');

INSERT INTO Aktor (Aktor_ID, Imię, Nazwisko, Data_Urodzenia, Miejsce_Urodzenia)
VALUES('A07', 'Korneliusz', 'Mazur', TO_DATE('05/11/1977', 'dd/mm/yyyy'), 'Toruń');

/* INSERT FILM */

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F01', 'R02', 'A01', 'Boska Komedia', '2005', 'Komedia');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F02', 'R01', 'A03', 'Koszmar Marleny', '2015', 'Dramt');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F03', 'R05', 'A05', 'Zjawa', '2005', 'Horror');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F04', 'R04', 'A02', 'Adam i Ewa', '2005', 'Melodramat');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F05', 'R06', 'A06', 'Szeregowiec Ferdynand', '20012', 'Wojenny');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F06', 'R07', 'A07', 'Wyprawa po klejnot', '2020', 'Fantasy');

INSERT INTO Film (Film_ID, Reżyser_ID, Aktor_ID, Tytuł, Rok_Produkcji, Gatunek)
VALUES('F07', 'R03', 'A04', 'Zwierzaki i ich sekrety', '2008', 'Animowany');

/* INSERT LOKALIZACJA */

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L01', 'Łódź', '1 Maja', '8', '16');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L02', 'Augustów', 'Witosa', '8', '16');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L03', 'Sosnowiec', 'Jana Pawła 2', '9', '16');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L04', 'Radzyń Podlaski', 'Białostocka', '9', '18');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L05', 'Parczew', 'Wierzbowa', '8', '16');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L06', 'Warszawa', 'Adama Mickiewicz', '9', '15');

INSERT INTO Lokalizacja (Lokalizacja_ID, Miasto, Ulica, Godzina_Otwarcia, Godzina_Zamkniecia)
VALUES('L07', 'Gdynia', 'Poleska', '8', '15');

/* INSERT WYPOŻYCZENIE */

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W01', 'K01', 'P01', 'F01', 'L02');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W02', 'K03', 'P03', 'F04', 'L04');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W03', 'K04', 'P06', 'F07', 'L01');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W04', 'K02', 'P05', 'F02', 'L05');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W05', 'K05', 'P02', 'F05', 'L06');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W06', 'K04', 'P07', 'F01', 'L03');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W07', 'K07', 'P04', 'F02', 'L07');

INSERT INTO Wypożyczenie (Wypożyczenie_ID, Klient_ID, Pracownik_ID, Film_ID, Lokalizacja_ID)
VALUES('W08', 'K03', 'P02', 'F03', 'L02');
