CREATE TABLE `Termek` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nev` varchar(255),
  `marka` varchar(255),
  `meret` varchar(255),
  `ar` int,
  `gyarto_id` int
);

CREATE TABLE `Gyarto` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nev` varchar(255),
  `orszag` varchar(255)
);

CREATE TABLE `Vasarlo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nev` varchar(255),
  `email_cim` varchar(255),
  `telefonszam` varchar(255)
);

CREATE TABLE `Rendeles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `vasarlo_id` int,
  `datum` date
);

CREATE TABLE `Rendeles_Tartalmaz` (
  `rendeles_id` int,
  `termek_id` int,
  `darabszam` int
);

ALTER TABLE `Termek` ADD FOREIGN KEY (`gyarto_id`) REFERENCES `Gyarto` (`id`);

ALTER TABLE `Rendeles` ADD FOREIGN KEY (`vasarlo_id`) REFERENCES `Vasarlo` (`id`);

ALTER TABLE `Rendeles_Tartalmaz` ADD FOREIGN KEY (`rendeles_id`) REFERENCES `Rendeles` (`id`);

ALTER TABLE `Rendeles_Tartalmaz` ADD FOREIGN KEY (`termek_id`) REFERENCES `Termek` (`id`);
