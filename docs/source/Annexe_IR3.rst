Annexe_IR3
==========

Code reception données et connexion base de données :
-----------------------------------------------------

.. code-block:: python
   :linenos:
    import time
    import serial
    import mysql.connector
    
    def insertion(mesures):
    try:
        # Connection au serveur MariaDB
        connection = mysql.connector.connect(
            #host = '192.168.0.108',
            host='172.20.10.26',
            database='pppe',
            user='admin',
            password='admin'
        )

        print("Essai de connexion au serveur MySQL")

        # Création d'un curseur pour exécuter des requêtes SQL
        cursor = connection.cursor()

        # Construction de la requête d'insertion avec la valeur fournie
        mySql_insert_query = f"INSERT INTO releve_puissance(id_session, mesures) VALUES((SELECT MAX(id) FROM session), {mesures})"

        print(mySql_insert_query)

        # Exécution de la requête d'insertion
        cursor.execute(mySql_insert_query)

        # Validation des modifications dans la base de données
        connection.commit()

        # Affichage de la requête d'insertion
        print("Exécuter la commande :", mySql_insert_query)

        # Fermeture du curseur
        cursor.close()

        print("Enregistrement inséré avec succès dans la table releve_puissance")
    except mysql.connector.Error as error:
        print("Échec de l'insertion d'un enregistrement dans la table :", error)
        return False
    return
    # Configuration de la connexion série
    ser = serial.Serial(
        port='/dev/ttyUSB0',                  # Port série à utiliser
        baudrate=9600,                        # Vitesse de communication en bauds
        parity=serial.PARITY_NONE,            # Parité (aucune parité)
        stopbits=serial.STOPBITS_ONE,         # Bits d'arrêt (1 bit)
        bytesize=serial.EIGHTBITS,            # Taille des octets de données (8 bits)
        timeout=5                             # Délai d'attente pour la lecture de données (5 secondes)
    )

    # Fermeture du port série s'il est déjà ouvert
    if ser.isOpen():
        ser.close()

    # Ouverture du port série
    ser.open()

    # Vérification si le port série est ouvert
    ser.isOpen()

    # Boucle principale pour la lecture continue de données
    while True:
        try:
            # Lecture de 6 octets depuis le port série
            res = ser.read(6)

            # Décodage des données lues en une chaîne de caractères lisible
            res=res.decode()
            res=res.split("-")
            print("Signal recu :",res)
            # Appel de la fonction insertion avec la valeur 321
            insertion(res[1])


            # Attente de 1 seconde avant la prochaine lecture
            time.sleep(1)

        # Gestion des exceptions en cas d'erreur
        except:
            print('erreur while true')


Code de la base de données :
----------------------------

.. code-block:: sql
   :linenos:

   -- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 30 mars 2023 à 14:10
-- Version du serveur :  10.5.15-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pppe`
--
CREATE DATABASE IF NOT EXISTS `pppe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pppe`;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(10) NOT NULL,
  `nom_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom_role`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `role` int(10) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `e-mail` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role`, `prenom`, `nom`, `e-mail`, `mdp`) VALUES
(1, 1, 'user', 'user', 'user@user.fr', '*6BB4837EB74329105EE4568DDA7DC67ED2CA2AD9');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_ibfk_1` (`role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role`) REFERENCES `utilisateur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



Code de l'IHM *in situ* :
-------------------------

.. code-block:: python
   :linenos:
