/*POZYTYWNE*/
/* Nazwy placowek ktore znajduja sie w Warszawie */
SELECT nazwa FROM placowka WHERE id_adres = (SELECT id_adres FROM adres WHERE id_miasto = (SELECT id_miasto FROM miasto WHERE nazwa = 'Warszawa'));

/* Wykaz wszystkich uzytkownikow serwisu */
SELECT imie, nazwisko FROM osoba;

/* Historia rezerwacji danej osoby */
SELECT nazwisko_na_kogo_rezerwacja, data_zlozenia_rezerwacji FROM rezerwacja WHERE id_osoba = (SELECT id_osoba FROM osoba WHERE imie = 'Jan' AND nazwisko = 'Kowalski');

/* Wykaz atrakcji w danym miescie */
SELECT nazwa, czas_trwania FROM atrakcja WHERE miasto = (SELECT id_miasto FROM miasto WHERE nazwa = 'Warszawa');

/* Wykaz oferty wszystkich placowek */
SELECT nazwa, czy_przyjazny_dzieciom, czy_przyjazny_zwierzetom, ile_gwiazdek FROM placowka;

/* Wykaz uzytkownikow ktorzy dokonali rezerwacji przed podana data */
SELECT imie, nazwisko FROM osoba WHERE id_osoba = (SELECT DISTINCT id_osoba FROM rezerwacja WHERE data_zlozenia_rezerwacji < '2020-05-13');