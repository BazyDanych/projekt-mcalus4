/*NEGATYWNE*/

/* Adresy, pod którymi nie znajduje sie zadna placowka */
SELECT ulica, numer FROM adres WHERE id_adres NOT IN (SELECT id_adres FROM placowka);

/* Wykaz wszystkich osob ktore zlozyly jakakolwiek rezerwacje, ale poza tymi ktore zlozyly rezerwacje przed podana data */
SELECT imie, nazwisko FROM osoba WHERE id_osoba IN (SELECT id_osoba FROM rezerwacja) AND id_osoba NOT IN (SELECT DISTINCT id_osoba FROM rezerwacja WHERE data_zlozenia_rezerwacji < '2020-05-11');
