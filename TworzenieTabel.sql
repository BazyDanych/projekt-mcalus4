CREATE TABLE `Osoba` (
	`id_osoba` int NOT NULL,
	`id_klient` int(255) NOT NULL,
	`imie` varchar(255) NOT NULL,
	`nazwisko` varchar(255) NOT NULL,
	`data_dolaczenia` DATE NOT NULL,
	`numer_karty_kredytowej` int(15) NOT NULL,
	`wiek` int(15) NOT NULL,
	`id_adres` int NOT NULL,
	`id_jezyk` int(255) NOT NULL,
	PRIMARY KEY (`id_osoba`)
);

CREATE TABLE `Placowka` (
	`id_placowka` int NOT NULL,
	`nazwa` varchar(255) NOT NULL,
	`ilosc_miejsc` int NOT NULL,
	`jezyk_glowny` int NOT NULL,
	`id_adres` int NOT NULL,
	`id_oferta` int NOT NULL,
	`id_rodzaj` int NOT NULL,
	`czy_przyjazny_dzieciom` int,
	`czy_przyjazny_zwierzetom` int,
	`ile_gwiazdek` int NOT NULL,
	`id_usluga` int,
	PRIMARY KEY (`id_placowka`)
);

CREATE TABLE `Atrakcja` (
	`id_atrakcja` int NOT NULL,
	`nazwa` varchar(255) NOT NULL,
	`czas_trwania` varchar(255) NOT NULL,
	`cena` DECIMAL NOT NULL,
	`jezyk_glowny` int NOT NULL,
	`miasto` int NOT NULL,
	`id_usluga` int,
	PRIMARY KEY (`id_atrakcja`)
);

CREATE TABLE `Rezerwacja` (
	`id_rezerwacja` int NOT NULL,
	`nazwisko_na_kogo_rezerwacja` varchar(255) NOT NULL,
	`id_osoba` int NOT NULL,
	`id_pokoj` int NOT NULL,
	`id_placowka` int NOT NULL,
	`data_zlozenia_rezerwacji` DATE NOT NULL,
	`data_poczatku_pobytu` DATE NOT NULL,
	`data_konca_pobytu` DATE NOT NULL,
	`ilosc_miejsc` int NOT NULL,
	`id_status` int NOT NULL,
	PRIMARY KEY (`id_rezerwacja`)
);

CREATE TABLE `Pokoje` (
	`id_pokoj` int NOT NULL,
	`ilosc_miejsc` int NOT NULL,
	`ilosc_lozek_jednoosobowych` int NOT NULL,
	`ilosc_lozek_dwuosobowych` int NOT NULL,
	`czy_z_tarasem` BOOLEAN NOT NULL,
	`czy_z_lazienka` BOOLEAN NOT NULL,
	`cena_za_noc_za_osobe` DECIMAL NOT NULL,
	`cena_za_noc_za_pokoj` DECIMAL NOT NULL,
	`id_placowka` int NOT NULL,
	PRIMARY KEY (`id_pokoj`)
);

CREATE TABLE `Placowka_Atrakcja` (
	`id_placowki` int NOT NULL,
	`atrakcja` int NOT NULL
);

CREATE TABLE `Firma` (
	`id_firma` int NOT NULL,
	`id_klient` int NOT NULL,
	`nazwa` varchar(255) NOT NULL,
	`data_dolaczenia` DATE NOT NULL,
	`id_adres` int NOT NULL,
	`id_jezyk` int NOT NULL,
	`NIP` int NOT NULL,
	PRIMARY KEY (`id_firma`)
);

CREATE TABLE `Klient` (
	`id_klient` int NOT NULL,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_klient`)
);

CREATE TABLE `Ocena` (
	`id_ocena` int NOT NULL,
	`tekst` varchar(255) NOT NULL,
	`ocena_od_1_do_10` int NOT NULL,
	`id_klient` int NOT NULL,
	`id_usluga` int NOT NULL,
	PRIMARY KEY (`id_ocena`)
);

CREATE TABLE `Usluga` (
	`id_usluga` int NOT NULL,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_usluga`)
);

CREATE TABLE `Adres` (
	`id_adres` INT NOT NULL AUTO_INCREMENT,
	`ulica` varchar(255) NOT NULL,
	`numer` INT(255) NOT NULL,
	`id_kraj` INT NOT NULL,
	`id_miasto` INT NOT NULL,
	PRIMARY KEY (`id_adres`)
);

CREATE TABLE `Miasto` (
	`id_miasto` INT NOT NULL AUTO_INCREMENT,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_miasto`)
);

CREATE TABLE `Kraj` (
	`id_kraj` INT NOT NULL AUTO_INCREMENT,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_kraj`)
);

CREATE TABLE `Rodzaje_placowek` (
	`id_rodzaj` INT NOT NULL AUTO_INCREMENT,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_rodzaj`)
);

CREATE TABLE `Jezyk` (
	`id_jezyk` INT NOT NULL AUTO_INCREMENT,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_jezyk`)
);

CREATE TABLE `atrakcje_jezyki` (
	`id_atrakcja` INT NOT NULL,
	`id_jezyk` INT NOT NULL
);

CREATE TABLE `placowki_jezyki` (
	`id_placowka` INT NOT NULL,
	`id_jezyk` INT NOT NULL
);

CREATE TABLE `Status` (
	`id_status` INT NOT NULL AUTO_INCREMENT,
	`nazwa` varchar(255) NOT NULL,
	PRIMARY KEY (`id_status`)
);

ALTER TABLE `Osoba` ADD CONSTRAINT `Osoba_fk0` FOREIGN KEY (`id_klient`) REFERENCES `Klient`(`id_klient`);

ALTER TABLE `Osoba` ADD CONSTRAINT `Osoba_fk1` FOREIGN KEY (`id_adres`) REFERENCES `Adres`(`id_adres`);

ALTER TABLE `Osoba` ADD CONSTRAINT `Osoba_fk2` FOREIGN KEY (`id_jezyk`) REFERENCES `Jezyk`(`id_jezyk`);

ALTER TABLE `Placowka` ADD CONSTRAINT `Placowka_fk0` FOREIGN KEY (`jezyk_glowny`) REFERENCES `Jezyk`(`id_jezyk`);

ALTER TABLE `Placowka` ADD CONSTRAINT `Placowka_fk1` FOREIGN KEY (`id_adres`) REFERENCES `Adres`(`id_adres`);

ALTER TABLE `Placowka` ADD CONSTRAINT `Placowka_fk3` FOREIGN KEY (`id_rodzaj`) REFERENCES `Rodzaje_placowek`(`id_rodzaj`);

ALTER TABLE `Placowka` ADD CONSTRAINT `Placowka_fk6` FOREIGN KEY (`id_usluga`) REFERENCES `Usluga`(`id_usluga`);

ALTER TABLE `Atrakcja` ADD CONSTRAINT `Atrakcja_fk0` FOREIGN KEY (`jezyk_glowny`) REFERENCES `Jezyk`(`id_jezyk`);

ALTER TABLE `Atrakcja` ADD CONSTRAINT `Atrakcja_fk1` FOREIGN KEY (`miasto`) REFERENCES `Miasto`(`id_miasto`);

ALTER TABLE `Atrakcja` ADD CONSTRAINT `Atrakcja_fk2` FOREIGN KEY (`id_usluga`) REFERENCES `Usluga`(`id_usluga`);

ALTER TABLE `Rezerwacja` ADD CONSTRAINT `Rezerwacja_fk0` FOREIGN KEY (`id_osoba`) REFERENCES `Osoba`(`id_osoba`);

ALTER TABLE `Rezerwacja` ADD CONSTRAINT `Rezerwacja_fk1` FOREIGN KEY (`id_pokoj`) REFERENCES `Pokoje`(`id_pokoj`);

ALTER TABLE `Rezerwacja` ADD CONSTRAINT `Rezerwacja_fk2` FOREIGN KEY (`id_placowka`) REFERENCES `Placowka`(`id_placowka`);

ALTER TABLE `Rezerwacja` ADD CONSTRAINT `Rezerwacja_fk3` FOREIGN KEY (`id_status`) REFERENCES `Status`(`id_status`);

ALTER TABLE `Pokoje` ADD CONSTRAINT `Pokoje_fk0` FOREIGN KEY (`id_placowka`) REFERENCES `Placowka`(`id_placowka`);

ALTER TABLE `Placowka_Atrakcja` ADD CONSTRAINT `Placowka_Atrakcja_fk0` FOREIGN KEY (`id_placowki`) REFERENCES `Placowka`(`id_placowka`);

ALTER TABLE `Placowka_Atrakcja` ADD CONSTRAINT `Placowka_Atrakcja_fk1` FOREIGN KEY (`atrakcja`) REFERENCES `Atrakcja`(`id_atrakcja`);

ALTER TABLE `Firma` ADD CONSTRAINT `Firma_fk0` FOREIGN KEY (`id_klient`) REFERENCES `Klient`(`id_klient`);

ALTER TABLE `Firma` ADD CONSTRAINT `Firma_fk1` FOREIGN KEY (`id_adres`) REFERENCES `Adres`(`id_adres`);

ALTER TABLE `Firma` ADD CONSTRAINT `Firma_fk2` FOREIGN KEY (`id_jezyk`) REFERENCES `Jezyk`(`id_jezyk`);

ALTER TABLE `Ocena` ADD CONSTRAINT `Ocena_fk0` FOREIGN KEY (`id_klient`) REFERENCES `Klient`(`id_klient`);

ALTER TABLE `Ocena` ADD CONSTRAINT `Ocena_fk1` FOREIGN KEY (`id_usluga`) REFERENCES `Usluga`(`id_usluga`);

ALTER TABLE `Adres` ADD CONSTRAINT `Adres_fk0` FOREIGN KEY (`id_kraj`) REFERENCES `Kraj`(`id_kraj`);

ALTER TABLE `Adres` ADD CONSTRAINT `Adres_fk1` FOREIGN KEY (`id_miasto`) REFERENCES `Miasto`(`id_miasto`);

ALTER TABLE `atrakcje_jezyki` ADD CONSTRAINT `atrakcje_jezyki_fk0` FOREIGN KEY (`id_atrakcja`) REFERENCES `Atrakcja`(`id_atrakcja`);

ALTER TABLE `atrakcje_jezyki` ADD CONSTRAINT `atrakcje_jezyki_fk1` FOREIGN KEY (`id_jezyk`) REFERENCES `Jezyk`(`id_jezyk`);

ALTER TABLE `placowki_jezyki` ADD CONSTRAINT `placowki_jezyki_fk0` FOREIGN KEY (`id_placowka`) REFERENCES `Placowka`(`id_placowka`);

ALTER TABLE `placowki_jezyki` ADD CONSTRAINT `placowki_jezyki_fk1` FOREIGN KEY (`id_jezyk`) REFERENCES `Jezyk`(`id_jezyk`);
