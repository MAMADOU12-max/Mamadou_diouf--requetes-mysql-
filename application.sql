-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 mai 2020 à 22:41
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `application`
--

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `numero_chambre` int(11) NOT NULL,
  `categorie` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `numero_departement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`numero_chambre`, `categorie`, `type`, `numero_departement`) VALUES
(1, '2', 'grave', 3),
(2, '4', 'faible', 2),
(3, '1', 'moyen', 2),
(4, '3', 'normal', 1);

-- --------------------------------------------------------

--
-- Structure de la table `departement_medical`
--

CREATE TABLE `departement_medical` (
  `numero_departement` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `departement_medical`
--

INSERT INTO `departement_medical` (`numero_departement`, `nom`) VALUES
(1, 'D1'),
(2, 'D2'),
(3, 'D3'),
(4, 'D4'),
(5, 'D5');

-- --------------------------------------------------------

--
-- Structure de la table `etre_suivi`
--

CREATE TABLE `etre_suivi` (
  `id` int(11) NOT NULL,
  `num_malade` int(11) NOT NULL,
  `numero_medecin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etre_suivi`
--

INSERT INTO `etre_suivi` (`id`, `num_malade`, `numero_medecin`) VALUES
(1, 1, 1),
(2, 5, 3),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `feuilledevolution`
--

CREATE TABLE `feuilledevolution` (
  `numero` int(11) NOT NULL,
  `date` date NOT NULL,
  `num_malade` int(11) NOT NULL,
  `numero_departement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `feuilledevolution`
--

INSERT INTO `feuilledevolution` (`numero`, `date`, `num_malade`, `numero_departement`) VALUES
(1, '2001-05-09', 2, 4),
(2, '2004-04-07', 3, 5),
(3, '2006-07-23', 1, 6),
(4, '2003-02-08', 3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `lit`
--

CREATE TABLE `lit` (
  `id` int(11) NOT NULL,
  `numero_lit` int(11) NOT NULL,
  `numero_chambre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lit`
--

INSERT INTO `lit` (`id`, `numero_lit`, `numero_chambre`) VALUES
(1, 4, 3),
(2, 1, 2),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `malade`
--

CREATE TABLE `malade` (
  `num_malade` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `lieu de naissance` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `malade`
--

INSERT INTO `malade` (`num_malade`, `nom`, `adresse`, `sexe`, `date_de_naissance`, `lieu de naissance`) VALUES
(1, 'modou', 'parcelles', 'h', '1998-02-17', 'Dakar'),
(2, 'habib', 'medina', 'h', '1968-07-18', 'FASs'),
(3, 'malick', 'yoff', 'h', '1977-06-12', 'MBAO'),
(4, 'junior', 'thiaroye', 'h', '1945-02-08', 'wughan'),
(5, 'fatou', 'parcelles', 'F', '0000-00-00', 'matam'),
(6, 'ami', 'patte d\'oie', 'F', '0000-00-00', 'Dakar');

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `numero_medecin` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `nom_specialite` varchar(255) NOT NULL,
  `numero_departement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`numero_medecin`, `nom`, `nom_specialite`, `numero_departement`) VALUES
(1, 'modou', 'S1', 23),
(2, 'sidibe', 'S1', 1),
(3, 'saliou', 'M3', 4),
(4, 'falou', 'S2', 3);

-- --------------------------------------------------------

--
-- Structure de la table `occuper`
--

CREATE TABLE `occuper` (
  `id` int(11) NOT NULL,
  `numero_lit` int(11) NOT NULL,
  `num_malade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `occuper`
--

INSERT INTO `occuper` (`id`, `numero_lit`, `num_malade`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 4),
(4, 21, 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`numero_chambre`),
  ADD KEY `numero_departement` (`numero_departement`);

--
-- Index pour la table `departement_medical`
--
ALTER TABLE `departement_medical`
  ADD PRIMARY KEY (`numero_departement`);

--
-- Index pour la table `etre_suivi`
--
ALTER TABLE `etre_suivi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num_malade` (`num_malade`),
  ADD KEY `numero_medecin` (`numero_medecin`);

--
-- Index pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `num_malade` (`num_malade`);

--
-- Index pour la table `lit`
--
ALTER TABLE `lit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_chambre` (`numero_chambre`);

--
-- Index pour la table `malade`
--
ALTER TABLE `malade`
  ADD PRIMARY KEY (`num_malade`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`numero_medecin`);

--
-- Index pour la table `occuper`
--
ALTER TABLE `occuper`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `numero_chambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `departement_medical`
--
ALTER TABLE `departement_medical`
  MODIFY `numero_departement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `etre_suivi`
--
ALTER TABLE `etre_suivi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lit`
--
ALTER TABLE `lit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `malade`
--
ALTER TABLE `malade`
  MODIFY `num_malade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `numero_medecin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `occuper`
--
ALTER TABLE `occuper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etre_suivi`
--
ALTER TABLE `etre_suivi`
  ADD CONSTRAINT `etre_suivi_ibfk_1` FOREIGN KEY (`numero_medecin`) REFERENCES `medecin` (`numero_medecin`);

--
-- Contraintes pour la table `feuilledevolution`
--
ALTER TABLE `feuilledevolution`
  ADD CONSTRAINT `feuilledevolution_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `malade` (`num_malade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
