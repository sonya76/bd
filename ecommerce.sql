-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 17 mai 2022 à 21:08
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `puht` float NOT NULL,
  `poids` float NOT NULL,
  `description` text DEFAULT NULL,
  `ARTICLEScol` varchar(45) DEFAULT NULL,
  `id_categories` int(11) NOT NULL,
  `id_tva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_article`, `designation`, `puht`, `poids`, `description`, `ARTICLEScol`, `id_categories`, `id_tva`) VALUES
(1, 'Basket Sneakers de Mustang', 49.99, 5, 'Ces sneakers de Mustang sont l\'atout mode de votre tenue. Ces chaussures sont ornées d\'un motif floral décoratif qui ajoute une note ravissante. Ces chaussures très confortables sont dotées d\'un lacet pratique pour ajuster l\'ampleur à chaque pied. Ces sneakers de Mustang s\'accordent avec tous vos looks décontractés du quotidien.', NULL, 1, 4),
(2, 'Pantalon avec fente', 24.99, 3, 'Pantalon avec fente et taille élastiquée', NULL, 2, 4),
(3, 'Blouse T-shirt', 20.99, 2, 'T-shirt avec boutons et détail nœud', NULL, 3, 4),
(4, 'Robe longue à imprimé', 19.99, 2, 'Robe longue avec viscose\r\nLong. env. 136 cm, lavage machine.', NULL, 5, 4),
(5, 'Pull à motif torsadé, col V', 27, 3, 'Joli pull à col V et motif torsadé\r\nLong. d\'env. 74 cm à 82 cm, lavage machine.', NULL, 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `articles_has_commandes`
--

CREATE TABLE `articles_has_commandes` (
  `id_article` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categories` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categories`, `libelle`) VALUES
(1, 'Chaussures'),
(2, 'Pantalons'),
(3, 'Chemises'),
(4, 'Pulls'),
(5, 'Robes'),
(6, 'Chapeaux'),
(7, 'Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` char(40) NOT NULL,
  `adresse1` varchar(255) NOT NULL,
  `adresse2` varchar(255) DEFAULT NULL,
  `adresse3` varchar(255) DEFAULT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `id_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `id_tva` int(11) NOT NULL,
  `taux` float NOT NULL,
  `libeletaux` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id_tva`, `taux`, `libeletaux`) VALUES
(1, 2.1, 'Taux particulier'),
(2, 5.5, 'Taux réduit'),
(3, 10, 'Taux intermédiaire'),
(4, 20, 'Taux normal');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `fk_ARTICLES_CATEGORIE1_idx` (`id_categories`),
  ADD KEY `fk_ARTICLES_TVA1_idx` (`id_tva`);

--
-- Index pour la table `articles_has_commandes`
--
ALTER TABLE `articles_has_commandes`
  ADD PRIMARY KEY (`id_article`,`id_commande`),
  ADD KEY `fk_ARTICLES_has_COMMANDES_COMMANDES1_idx` (`id_commande`),
  ADD KEY `fk_ARTICLES_has_COMMANDES_ARTICLES1_idx` (`id_article`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categories`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `fk_CLIENTS_COMMANDES1_idx` (`id_commande`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id_commande`,`id_client`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id_tva`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tva`
--
ALTER TABLE `tva`
  MODIFY `id_tva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_ARTICLES_CATEGORIE1` FOREIGN KEY (`id_categories`) REFERENCES `categorie` (`id_categories`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ARTICLES_TVA1` FOREIGN KEY (`id_tva`) REFERENCES `tva` (`id_tva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `articles_has_commandes`
--
ALTER TABLE `articles_has_commandes`
  ADD CONSTRAINT `fk_ARTICLES_has_COMMANDES_ARTICLES1` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ARTICLES_has_COMMANDES_COMMANDES1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_CLIENTS_COMMANDES1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
