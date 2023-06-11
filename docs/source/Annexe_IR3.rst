Annexe - IR3 - Olivier Jourdain
===============================

Code reception données et connexion base de données :
-----------------------------------------------------

.. code-block:: python
   :linenos:

    import time
    import serial

    import mysql.connector as mysql
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
            if len(res)==2:
                insertion(res)

        
            # Attente de 1 seconde avant la prochaine lecture
            time.sleep(1)

        # Gestion des exceptions en cas d'erreur
        except:
            print('erreur while true')

        def insertion(mesures):
            try:
                # Connection au serveur MariaDB
                connection = mysql.connector.connect(
                    #host = '192.168.0.108',
                    host='192.168.0.104',
                    database='pppe',
                    user='admin',
                    password='admin'
                )

                print("Essai de connexion au serveur MySQL")

                # Création d'un curseur pour exécuter des requêtes SQL
                cursor = connection.cursor()

                # Construction de la requête d'insertion avec la valeur fournie

                if mesures[0] == '0':
        
                    mySql_insert_query = f"INSERT INTO mesure_batterie(id_batterie, tension, timestamp) VALUES((SELECT MAX(id) FROM batterie), {mesures[1]}, timestamp)"

                elif mesures[0] == '1':
        
                    mySql_insert_query = f"INSERT INTO panneaux_solaire(tension, timestamp) VALUES({mesures[1]}, timestamp)"

                elif mesures[0] == '2':
        
                    mySql_insert_query = f"INSERT INTO releve_puissance(id_session, mesures) VALUES((SELECT MAX(id) FROM session), {mesures[1]})"



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
            return True
        

Code de la base de données :
----------------------------

.. code-block:: sql
   :linenos:

    -- phpMyAdmin SQL Dump
    -- version 5.0.4deb2+deb11u1
    -- https://www.phpmyadmin.net/
    --
    -- Hôte : localhost:3306
    -- Généré le : ven. 09 juin 2023 à 01:31
    -- Version du serveur :  10.5.19-MariaDB-0+deb11u2
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
    -- Structure de la table `batterie`
    --

    CREATE TABLE `batterie` (
    `id` int(23) NOT NULL,
    `date_service` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `batterie`
    --

    INSERT INTO `batterie` (`id`, `date_service`) VALUES
    (1, '2023-03-31 22:00:00.0');

    -- --------------------------------------------------------

    --
    -- Structure de la table `mesure_batterie`
    --

    CREATE TABLE `mesure_batterie` (
    `id` int(23) NOT NULL,
    `id_batterie` int(23) NOT NULL,
    `tension` int(16) NOT NULL,
    `timestamp` timestamp(1) NOT NULL DEFAULT current_timestamp(1)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `mesure_batterie`
    --

    INSERT INTO `mesure_batterie` (`id`, `id_batterie`, `tension`, `timestamp`) VALUES
    (1, 1, 20, '2023-05-09 08:56:26.0'),
    (4, 1, 1023, '0000-00-00 00:00:00.0'),
    (5, 1, 1, '0000-00-00 00:00:00.0'),
    (6, 1, 1, '0000-00-00 00:00:00.0'),
    (7, 1, 1, '0000-00-00 00:00:00.0'),
    (8, 1, 1234, '0000-00-00 00:00:00.0');

    -- --------------------------------------------------------

    --
    -- Structure de la table `panneaux_solaire`
    --

    CREATE TABLE `panneaux_solaire` (
    `id` int(23) NOT NULL,
    `tension` int(23) NOT NULL,
    `timestamp` timestamp(1) NOT NULL DEFAULT current_timestamp(1)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `panneaux_solaire`
    --

    INSERT INTO `panneaux_solaire` (`id`, `tension`, `timestamp`) VALUES
    (1, 1022, '0000-00-00 00:00:00.0'),
    (2, 1234, '0000-00-00 00:00:00.0');

    -- --------------------------------------------------------

    --
    -- Structure de la table `releve_puissance`
    --

    CREATE TABLE `releve_puissance` (
    `id` int(23) NOT NULL,
    `id_session` int(23) NOT NULL,
    `mesures` int(16) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `releve_puissance`
    --

    INSERT INTO `releve_puissance` (`id`, `id_session`, `mesures`) VALUES
    (128, 21, 1234),
    (129, 74, 0),
    (130, 74, 0),
    (131, 74, 123),
    (132, 74, 123),
    (133, 74, 123),
    (134, 74, 123),
    (135, 74, 123),
    (136, 74, 123),
    (137, 74, 123),
    (138, 74, 123),
    (139, 74, 123),
    (140, 74, 123),
    (141, 74, 123),
    (142, 74, 123),
    (143, 74, 80),
    (144, 74, 1023),
    (145, 74, 1023),
    (146, 74, 1023),
    (147, 74, 1023),
    (148, 74, 1023),
    (149, 74, 1023),
    (150, 74, 1023),
    (151, 74, 1023),
    (152, 74, 1023),
    (153, 74, 1023),
    (154, 74, 1023),
    (155, 74, 1023),
    (156, 74, 1023),
    (157, 74, 123),
    (158, 74, 1234);

    -- --------------------------------------------------------

    --
    -- Structure de la table `role`
    --

    CREATE TABLE `role` (
    `id` int(10) NOT NULL,
    `nom_role` varchar(20) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `role`
    --

    INSERT INTO `role` (`id`, `nom_role`) VALUES
    (1, 'admin'),
    (2, 'utilisateur');

    -- --------------------------------------------------------

    --
    -- Structure de la table `session`
    --

    CREATE TABLE `session` (
    `id` int(16) NOT NULL,
    `id_user` int(16) NOT NULL,
    `datetime_debut` timestamp(1) NOT NULL DEFAULT current_timestamp(1),
    `datetime_fin` timestamp(1) NOT NULL DEFAULT current_timestamp(1)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `session`
    --

    INSERT INTO `session` (`id`, `id_user`, `datetime_debut`, `datetime_fin`) VALUES
    (21, 17, '2023-05-09 09:53:53.6', '2023-05-09 10:01:10.0'),
    (23, 3, '2023-05-10 13:47:08.5', '2023-05-10 14:11:10.0'),
    (24, 3, '2023-05-10 13:54:48.6', '2023-05-10 14:11:10.0'),
    (25, 17, '2023-05-10 13:55:35.4', '2023-05-10 14:11:10.0'),
    (28, 3, '2023-05-10 14:16:59.9', '2023-05-10 14:17:11.0'),
    (29, 3, '2023-05-10 14:20:14.5', '2023-05-12 08:22:06.0'),
    (50, 3, '2023-05-12 09:46:03.6', '2023-05-12 09:46:10.0'),
    (51, 3, '2023-05-12 09:52:17.4', '2023-05-12 09:52:23.0'),
    (52, 19, '2023-05-12 09:56:55.8', '2023-05-12 09:57:04.0'),
    (53, 19, '2023-05-12 09:57:33.9', '2023-05-12 09:57:36.0'),
    (54, 19, '2023-05-12 09:58:34.4', '2023-05-12 09:58:38.0'),
    (55, 3, '2023-05-12 09:58:49.5', '2023-05-12 09:59:00.0'),
    (57, 19, '2023-05-12 10:25:49.8', '2023-05-12 10:50:02.0'),
    (58, 19, '2023-05-12 10:50:07.8', '2023-05-12 10:53:52.0'),
    (59, 19, '2023-05-12 10:50:25.0', '2023-05-12 10:53:52.0'),
    (60, 19, '2023-05-12 10:53:45.5', '2023-05-12 10:53:52.0'),
    (61, 19, '2023-05-12 12:07:31.3', '2023-05-12 12:08:53.0'),
    (62, 19, '2023-05-12 12:08:55.8', '2023-05-12 12:14:05.0'),
    (63, 19, '2023-05-12 12:09:10.1', '2023-05-12 12:14:05.0'),
    (64, 15, '2023-05-12 12:14:32.7', '2023-05-12 12:14:48.0'),
    (65, 15, '2023-05-12 12:15:20.3', '2023-05-12 12:15:24.0'),
    (66, 15, '2023-05-12 12:15:49.8', '2023-05-12 12:15:57.0'),
    (67, 15, '2023-05-12 12:16:52.2', '2023-05-12 12:16:57.0'),
    (68, 15, '2023-05-12 12:16:59.5', '2023-05-23 07:03:51.0'),
    (69, 15, '2023-05-12 12:17:12.7', '2023-05-23 07:03:51.0'),
    (70, 17, '2023-05-23 06:59:00.7', '2023-05-23 07:03:51.0'),
    (71, 17, '2023-05-23 07:03:24.0', '2023-05-23 07:03:51.0'),
    (72, 3, '2023-05-23 07:04:21.4', '2023-05-23 07:04:57.0'),
    (73, 3, '2023-05-23 07:04:59.0', '2023-05-23 07:05:07.0'),
    (74, 3, '2023-05-23 07:09:47.3', '2023-05-23 07:09:54.0');

    -- --------------------------------------------------------

    --
    -- Structure de la table `utilisateur`
    --

    CREATE TABLE `utilisateur` (
    `id` int(11) NOT NULL,
    `role` int(10) NOT NULL,
    `nom` varchar(50) NOT NULL,
    `prenom` varchar(50) NOT NULL,
    `email` varchar(50) NOT NULL,
    `mdp` varchar(50) NOT NULL,
    `date_inscription` timestamp(1) NOT NULL DEFAULT current_timestamp(1)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

    --
    -- Déchargement des données de la table `utilisateur`
    --

    INSERT INTO `utilisateur` (`id`, `role`, `nom`, `prenom`, `email`, `mdp`, `date_inscription`) VALUES
    (3, 1, 'VIVIAN', 'Bastien', 'bastienvivian29@gmail.com', '*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D', '0000-00-00 00:00:00.0'),
    (15, 1, 'administrateurtest', 'administrateurtest', 'adminpppe@gmail.com', '*01A6717B58FF5C7EAFFF6CB7C96F7428EA65FE4C', '0000-00-00 00:00:00.0'),
    (17, 2, 'Utilisateur_simple', 'Utilisateur_simple', 'utilisateur_simple@gmail.com', '*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D', '0000-00-00 00:00:00.0'),
    (19, 1, 'JOUDRAIN', 'Olivier', 'olivierjourdaintechnitien@gmail.com', '*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D', '2023-05-12 08:45:14.4'),
    (20, 2, 'de Djibril', 'Nintendoswitch', 'Djib@gmail.com', '*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D', '2023-05-23 06:46:38.1');

    --
    -- Index pour les tables déchargées
    --

    --
    -- Index pour la table `batterie`
    --
    ALTER TABLE `batterie`
    ADD PRIMARY KEY (`id`);

    --
    -- Index pour la table `mesure_batterie`
    --
    ALTER TABLE `mesure_batterie`
    ADD PRIMARY KEY (`id`),
    ADD KEY `id_batterie` (`id_batterie`) USING BTREE;

    --
    -- Index pour la table `panneaux_solaire`
    --
    ALTER TABLE `panneaux_solaire`
    ADD PRIMARY KEY (`id`);

    --
    -- Index pour la table `releve_puissance`
    --
    ALTER TABLE `releve_puissance`
    ADD PRIMARY KEY (`id`),
    ADD KEY `id-session` (`id_session`);

    --
    -- Index pour la table `role`
    --
    ALTER TABLE `role`
    ADD PRIMARY KEY (`id`);

    --
    -- Index pour la table `session`
    --
    ALTER TABLE `session`
    ADD PRIMARY KEY (`id`),
    ADD KEY `id-user` (`id_user`);

    --
    -- Index pour la table `utilisateur`
    --
    ALTER TABLE `utilisateur`
    ADD PRIMARY KEY (`id`),
    ADD KEY `fk_role` (`role`);

    --
    -- AUTO_INCREMENT pour les tables déchargées
    --

    --
    -- AUTO_INCREMENT pour la table `batterie`
    --
    ALTER TABLE `batterie`
    MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

    --
    -- AUTO_INCREMENT pour la table `mesure_batterie`
    --
    ALTER TABLE `mesure_batterie`
    MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

    --
    -- AUTO_INCREMENT pour la table `panneaux_solaire`
    --
    ALTER TABLE `panneaux_solaire`
    MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

    --
    -- AUTO_INCREMENT pour la table `releve_puissance`
    --
    ALTER TABLE `releve_puissance`
    MODIFY `id` int(23) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

    --
    -- AUTO_INCREMENT pour la table `role`
    --
    ALTER TABLE `role`
    MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

    --
    -- AUTO_INCREMENT pour la table `session`
    --
    ALTER TABLE `session`
    MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

    --
    -- AUTO_INCREMENT pour la table `utilisateur`
    --
    ALTER TABLE `utilisateur`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

    --
    -- Contraintes pour les tables déchargées
    --

    --
    -- Contraintes pour la table `mesure_batterie`
    --
    ALTER TABLE `mesure_batterie`
    ADD CONSTRAINT `mesure_batterie_ibfk_1` FOREIGN KEY (`id_batterie`) REFERENCES `batterie` (`id`);

    --
    -- Contraintes pour la table `releve_puissance`
    --
    ALTER TABLE `releve_puissance`
    ADD CONSTRAINT `releve_puissance_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `session` (`id`);

    --
    -- Contraintes pour la table `session`
    --
    ALTER TABLE `session`
    ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

    --
    -- Contraintes pour la table `utilisateur`
    --
    ALTER TABLE `utilisateur`
    ADD CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`);
    COMMIT;

    /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
    /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
    /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



Code de l'IHM *in situ* :
-------------------------

.. code-block:: python
   :linenos:

    from tkinter import*
    import smbus
    import time
    import RPi.GPIO as GPIO

    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(37, GPIO.OUT)
    GPIO.setup(12,GPIO.OUT)	     # On configure la sortie 12 du GPIO en sortie
    p=GPIO.PWM(12,100)	     # On règle la fréquence de la MLI à 100Hz
    p.start(0)		     # On démarre avec un rapport cycliqque de 0%

    fenetre=Tk()
    fenetre.title("Pilotage progressif des luminaires")
    fenetre.geometry("650x300")
    fenetre.configure(bg="ghost white")

    message=Label(fenetre, text="Production d'énergie", fg="blue", bg="ghost white",font=("Courier",25))
    message.place(x=120,y=25)

    def Allumer():
        print ("Allumage du luminaire")
        GPIO.output(37, GPIO.HIGH)
        time.sleep(1)

    def Eteindre():
        print ("Eteindre le luminaire")
        GPIO.output(37, GPIO.LOW)
        time.sleep(1)

    def valeur (var):
        temp=var.get()
        print (temp)
        p.ChangeDutyCycle(temp)

    bouton1 = Button(fenetre, text="Quitter", fg="blue", command=fenetre.destroy)
    bouton1.place(x=250,y=100)

    bouton2 = Button(fenetre, text="Allumer", fg="blue",activebackground="white", command=Allumer)
    bouton2.place(x=50,y=100)

    bouton3 = Button(fenetre, text="Eteindre", fg="blue",activebackground="white", command=Eteindre)
    bouton3.place(x=150,y=100)

    var = DoubleVar()
    curseur= Scale(fenetre, orient='horizontal', from_=0, to=100,resolution=1,tickinterval=10, length=450,activebackground="blue", variable = var,command=lambda x:valeur(var))
    curseur.place(x=100,y=175)

    fenetre.mainloop()

