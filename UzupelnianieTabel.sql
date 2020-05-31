INSERT INTO `kraj` (`id_kraj`, `nazwa`) VALUES (1, 'Polska');

INSERT INTO `kraj` (`id_kraj`, `nazwa`) VALUES (2, 'Anglia'), (3, 'Niemcy');

INSERT INTO `miasto` (`id_miasto`, `nazwa`) VALUES (1,  'Warszawa'), (2, 'Gdynia'), (3, 'Londyn'), (4, 'Berlin');

INSERT INTO `jezyk` (`id_jezyk`, `nazwa`) VALUES (1,  'polski'), (2, 'angielski'), (3, 'niemiecki');

INSERT INTO `adres` (`id_adres`, `ulica`, `numer`, `id_kraj`, `id_miasto`) VALUES (1,  'Polna', 15, 1, 1), (2,  'Baker Street', 9, 2, 3),(3,  'Rotstrasse', 3, 3, 4),(4,  'Grunwaldzka', 134, 1, 2);

INSERT INTO `status` (`id_status`, `nazwa`) VALUES (1,  'Zajety'), (2, 'Zarezerwowany'), (3, 'Dostepny');

INSERT INTO `klient` (`id_klient`, `nazwa`) VALUES (1,  'osoba'), (2, 'firma');

INSERT INTO `osoba` (`id_osoba`, `id_klient`, `imie`, `nazwisko`, `data_dolaczenia`, `numer_karty_kredytowej`, `wiek`, `id_adres`, `id_jezyk`) VALUES
(1, 1, 'Jan', 'Kowalski', '2020-05-11', 1234567, 22, 1, 1),
(2, 1, 'Piotr', 'Nowak', '2020-05-12', 234235, 21, 2, 2),
(3, 1, 'Weronika', 'Kowalska', '2020-05-13', 31455, 25, 3, 3);

INSERT INTO `firma` (`id_firma`, `id_klient`, `nazwa`, `data_dolaczenia`, `id_adres`, `id_jezyk`, `NIP`) VALUES
(1, 2, 'Booking', '2020-05-11', 1, 1, 1234122),
(2, 2, 'GoodSolutions', '2020-05-12', 2, 2, 123123),
(3, 2, 'RandomFirma', '2020-05-13', 3, 3, 123123);

INSERT INTO `usluga` (`id_usluga`, `nazwa`) VALUES (1,  'nocleg'), (2, 'atrakcja');

INSERT INTO `rodzaje_placowek` (`id_rodzaj`, `nazwa`) VALUES (1,  'hotel'), (2, 'motel'), (3, 'agroturystyka'), (4, 'schronisko');

INSERT INTO `ocena` (`id_ocena`, `tekst`, `ocena_od_1_do_10`, `id_klient`, `id_usluga`) VALUES (1,  'najlepszy hotel w jakim bylam!', 9, 1, 1), (2,  'Nieprzyjemna obluga, wiecej nie wroce', 2, 1, 1);

INSERT INTO `placowka` (`id_placowka`, `nazwa`, `ilosc_miejsc`, `jezyk_glowny`, `id_adres`, `id_oferta`, `id_rodzaj`, `czy_przyjazny_dzieciom`, `czy_przyjazny_zwierzetom`, `ile_gwiazdek`, `id_usluga`) VALUES
(1, 'Wrzosowy Zakatek', 100, 1, 1, 0, 3, true, false, 2, 2),
(2, 'Hotel 23', 25, 2, 2, 0, 1, true, true, 5, 2),
(3, 'Motel na rogu', 70, 3, 3, 0, 2, false, true, 3, 2);

INSERT INTO `pokoje` (`id_pokoj`, `ilosc_miejsc`, `ilosc_lozek_jednoosobowych`, `ilosc_lozek_dwuosobowych`, `czy_z_tarasem`, `czy_z_lazienka`, `cena_za_noc_za_osobe`, `cena_za_noc_za_pokoj`, `id_placowka`) VALUES
(1, 2, 0, 1, true, true, 100, 200, 2),
(2, 10, 4, 3, false, true, 10, 100, 1),
(3, 15, 9, 3, false, true, 15, 150, 1),
(4, 3, 1, 1, false, true, 30, 90, 3);

INSERT INTO `atrakcja` (`id_atrakcja`, `nazwa`, `czas_trwania`, `cena`, `jezyk_glowny`, `miasto`, `id_usluga`) VALUES 
(1,  'splyw kajakowy', '2h', 100, 1, 1, 2),
(2,  'przejazdzka na wielbladach', '5h', 500, 2, 3, 2),
(3,  'skok ze spadochronem', '1h', 1000, 1, 2, 2);

INSERT INTO `rezerwacja` (`id_rezerwacja`, `nazwisko_na_kogo_rezerwacja`, `id_osoba`, `id_pokoj`, `id_placowka`, `data_zlozenia_rezerwacji`, `data_poczatku_pobytu`, `data_konca_pobytu`, `ilosc_miejsc`, `id_status`) VALUES 
(1,  'Kowalski', 1, 1, 1, '2020-05-13', '2020-05-16', '2020-05-19', 3, 2),
(2,  'Nowak', 2, 2, 1, '2020-05-13', '2020-05-16', '2020-05-19', 1, 1),
(3,  'Kowalska', 1, 3, 1, '2020-05-13', '2020-05-16', '2020-05-19', 5, 2);

INSERT INTO `atrakcje_jezyki` (`id_atrakcja`, `id_jezyk`) VALUES (1,  2), (2, 1);

INSERT INTO `placowki_jezyki` (`id_placowka`, `id_jezyk`) VALUES (1,  2), (2, 1);

INSERT INTO `placowka_atrakcja` (`id_placowki`, `atrakcja`) VALUES (1,  2), (2, 1);

INSERT INTO `rezerwacja` (`id_rezerwacja`, `nazwisko_na_kogo_rezerwacja`, `id_osoba`, `id_pokoj`, `id_placowka`, `data_zlozenia_rezerwacji`, `data_poczatku_pobytu`, `data_konca_pobytu`, `ilosc_miejsc`, `id_status`) VALUES 
(4,  'Kowalski', 1, 1, 1, '2020-05-11', '2020-05-16', '2020-05-19', 3, 2);

