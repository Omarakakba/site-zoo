-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : sam. 24 fév. 2024 à 01:02
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `id` int(11) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `nom_animal` varchar(40) NOT NULL,
  `commentaire` text NOT NULL,
  `id_Especes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `animaux`
--

INSERT INTO `animaux` (`id`, `date_de_naissance`, `nom_animal`, `commentaire`, `id_Especes`) VALUES
(1, '2019-02-13', 'Tigre', 'Le tigre est le plus grand félin.', 1),
(2, '2022-05-23', 'Lion', 'Un lion majestueux', 2),
(3, '2023-01-15', 'Singe', 'Un singe très actif', 3);

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

CREATE TABLE `enclos` (
  `id` varchar(40) NOT NULL,
  `nom_enclos` varchar(40) NOT NULL,
  `capacite_max` int(11) NOT NULL,
  `eau` tinyint(4) NOT NULL,
  `taille` float NOT NULL,
  `id_personnels` int(11) NOT NULL,
  `id_personnels_concerner` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `enclos`
--

INSERT INTO `enclos` (`id`, `nom_enclos`, `capacite_max`, `eau`, `taille`, `id_personnels`, `id_personnels_concerner`) VALUES
('A1', 'Enclos 1', 10, 1, 100.5, 1, 1),
('B1', 'Enclos 2', 15, 0, 150.75, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `especes`
--

CREATE TABLE `especes` (
  `id` int(11) NOT NULL,
  `nom_race` varchar(40) NOT NULL,
  `duree_vie_moyenne` int(11) NOT NULL,
  `aquatique` tinyint(1) NOT NULL,
  `type_nourriture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `especes`
--

INSERT INTO `especes` (`id`, `nom_race`, `duree_vie_moyenne`, `aquatique`, `type_nourriture`) VALUES
(1, 'Tigre', 20, 0, 'Viande'),
(2, 'Lion', 15, 0, 'Viande'),
(3, 'Singe', 25, 0, 'Bambou'),
(4, 'Éléphant', 50, 0, 'Bambou');

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

CREATE TABLE `fonction` (
  `fonction` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`fonction`) VALUES
('employe'),
('patron');

-- --------------------------------------------------------

--
-- Structure de la table `loc_animaux`
--

CREATE TABLE `loc_animaux` (
  `id` int(11) NOT NULL,
  `date_arrive` date NOT NULL,
  `date_sortie` date NOT NULL,
  `id_animaux` int(11) NOT NULL,
  `id_Especes` int(11) NOT NULL DEFAULT '1',
  `id_enclos` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `loc_animaux`
--

INSERT INTO `loc_animaux` (`id`, `date_arrive`, `date_sortie`, `id_animaux`, `id_enclos`) VALUES
(1, '2023-03-01', '2023-06-01', 1, 'A1'),
(2, '2023-05-15', '2023-08-15', 2, 'B1');

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

CREATE TABLE `personnels` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(70) NOT NULL,
  `salaire` decimal(10,0) NOT NULL,
  `fonction` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `login`, `password`, `salaire`, `fonction`) VALUES
(1, 'Dupont', 'Jean', 'jean123', 'motdepasse1', '2500', 'patron'),
(2, 'Martin', 'Sophie', 'sophie456', 'motdepasse2', '1800', 'employe'),
(3, 'Dubois', 'Pierre', 'pierre789', 'motdepasse3', '2000', 'employe');

-- --------------------------------------------------------

--
-- Structure de la table `type_nourr`
--

CREATE TABLE `type_nourr` (
  `type_nourriture` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_nourr`
--

INSERT INTO `type_nourr` (`type_nourriture`) VALUES
('Bambou'),
('Poisson'),
('Viande');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_Especes` (`id_Especes`);

--
-- Index pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personnels` (`id_personnels`);

--
-- Index pour la table `especes`
--
ALTER TABLE `especes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_nourriture` (`type_nourriture`);

--
-- Index pour la table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`fonction`);

--
-- Index pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_animaux` (`id_animaux`),
  ADD KEY `id_enclos` (`id_enclos`);

--
-- Index pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fonction` (`fonction`);

--
-- Index pour la table `type_nourr`
--
ALTER TABLE `type_nourr`
  ADD PRIMARY KEY (`type_nourriture`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animaux`
--
ALTER TABLE `animaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `especes`
--
ALTER TABLE `especes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `personnels`
--
ALTER TABLE `personnels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `animaux_ibfk_1` FOREIGN KEY (`id_Especes`) REFERENCES `especes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD CONSTRAINT `enclos_ibfk_1` FOREIGN KEY (`id_personnels`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `especes`
--
ALTER TABLE `especes`
  ADD CONSTRAINT `especes_ibfk_1` FOREIGN KEY (`type_nourriture`) REFERENCES `type_nourr` (`type_nourriture`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `loc_animaux`
--
ALTER TABLE `loc_animaux`
  ADD CONSTRAINT `loc_animaux_ibfk_1` FOREIGN KEY (`id_animaux`) REFERENCES `animaux` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loc_animaux_ibfk_2` FOREIGN KEY (`id_enclos`) REFERENCES `enclos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `personnels`
--
ALTER TABLE `personnels`
  ADD CONSTRAINT `personnels_ibfk_1` FOREIGN KEY (`fonction`) REFERENCES `fonction` (`fonction`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
