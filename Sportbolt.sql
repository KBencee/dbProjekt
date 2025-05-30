DROP DATABASE IF EXISTS sportbolt;

CREATE DATABASE sportbolt DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;

USE sportbolt;

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

CREATE TABLE `Szallito` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nev` varchar(255),
  `telefonszam` varchar(255),
  `orszag` varchar(255)
);

CREATE TABLE `Szallitja` (
  `rendeles_id` int,
  `szallito_id` int,
  `szallitas_ido` datetime
);

ALTER TABLE `Termek` ADD FOREIGN KEY (`gyarto_id`) REFERENCES `Gyarto` (`id`);

ALTER TABLE `Rendeles` ADD FOREIGN KEY (`vasarlo_id`) REFERENCES `Vasarlo` (`id`);

ALTER TABLE `Rendeles_Tartalmaz` ADD FOREIGN KEY (`rendeles_id`) REFERENCES `Rendeles` (`id`);

ALTER TABLE `Rendeles_Tartalmaz` ADD FOREIGN KEY (`termek_id`) REFERENCES `Termek` (`id`);

ALTER TABLE `Szallitja` ADD FOREIGN KEY (`rendeles_id`) REFERENCES `Rendeles` (`id`);

ALTER TABLE `Szallitja` ADD FOREIGN KEY (`szallito_id`) REFERENCES `Szallito` (`id`);

ALTER TABLE `Rendeles_Tartalmaz` ADD PRIMARY KEY (`rendeles_id`, `termek_id`);

ALTER TABLE `Szallitja` ADD PRIMARY KEY (`rendeles_id`, `szallito_id`);
