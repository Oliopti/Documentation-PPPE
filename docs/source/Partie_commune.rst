Partie commune
==============

.. _installation:

`Cliquez ici pour voir ce code sur GitHub <https://github.com/Oliopti/pppe/blob/main/ressource/Projet%20p%C3%A9dagogique%20de%20production%20d'%C3%A9nergie.pdf>`_


1/ Présentation et situation du projet dans son environnement
-------------------------------------------------------------

.. image:: img/comm/Presentation.png

1.1- Présentation du projet
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dans le contexte actuel où la production de l’énergie électrique pose quelques problèmes en ce qui
concerne la production, on souhaite rendre autonome l’éclairage de la salle blanche où se
déroulent les cours et les activités pratiques des BTS Systèmes Numériques.
L’installation sera composée de deux panneaux solaires de 390W et de deux vélos couplés à des
alternateurs permettant pour l’ensemble de recharger les deux batteries. L’énergie permettant ainsi 
d’alimenter tous les luminaires de la salle soit 11 points lumineux de 40W chacun.


1.2- Situation du projet dans son contexte
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Domaine d’activité du système support d’étude :

- Informatique, réseaux et infrastructures. 
- Mobilité et systèmes embarqués.
- Mesure, instrumentation et microsystèmes.



1.2- Cahier des charges – Expression du besoin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Réaliser l’installation de l’ensemble panneaux, régulateur, batteries, vélos et alternateurs pour ensuite :

- Gérer l’éclairage via un écran tactile, prévoir un circuit de puissance pour un fonctionnement en 24V continu ou 230V alternatif.
- Mesurer la production des panneaux photovoltaïques, envoyer les informations via XBee. 
- Enregistrement de la production journalière et annuelle des étudiants participant.


2- Spécifications
-----------------

2.1/ Diagrammes SYSML
^^^^^^^^^^^^^^^^^^^^^

2.1.1/ Exigences
++++++++++++++++

.. image:: img/comm/Diagramme-1.png


2.1.2/ Constitution du système, diagramme de définition de blocs
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. image:: img/comm/Diagramme-2.png


2.2/ Contraintes de réalisation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Contraintes financières (budget alloué) : 200 € à la charge du lycée.

Contraintes de développement (matériel et/ou logiciel imposé / technologies utilisées) :

Il s’agit de réaliser une solution :

- Embarquée, à base d’un microcontrôleur Microchip PIC16f88.
- Utilisation de circuits intégrés spécialisés et transistors.

Exigences qualité à respecter sur le produit à réaliser :

- Ergonomie Sur le développement.
- Respect des standards sur la documentation à produire.
- Dossier de suivi de projet.
- Dossier technique unique.



2.3/ Ressources mises à disposition des étudiants (logiciels / matériels / documents)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. tableau::

   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Désignation           | Caractéristiques techniques                                                                                                                            |
   +=======================+========================================================================================================================================================+
   | MPLABX                | IDE développée par Microchip permettant la programmation des microcontrôleurs PIC12, PIC16, PIC18…                                                     |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | PROTEUS               | Suite logicielle composé d’ISIS pour la réalisation des schémas, la simulation et d’ARES permettant la réalisation du PCB de la carte électronique.    |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | PICkit3 ou PICkit4    | Module permettant de transférer le programme dans le microcontrôleur ou de réaliser le dépannage (débogage).                                           |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Analyseur de spectre  | Analyseur Large bande Agilent.                                                                                                                         |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Oscilloscope Agilent  | Oscilloscope numérique permettant le décodage de trames (UART, SPI, I2C).                                                                              |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Machine à graver LPKF | Machine pour le prototypage de circuits imprimés.                                                                                                      |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Modules XBee          | Tout ou Rien, 0-10V…, passerelle Multitech.                                                                                                            |
   +-----------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+



3 - Répartition des fonctions ou cas d’utilisation par étudiant
---------------------------------------------------------------

.. tableau::

   +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant    | Tâches                                                                                                                                                                                                                                             |
   +=============+====================================================================================================================================================================================================================================================+
   | Etudiant 1  | - Réalisation de la fonction : Utilisation d’une sonde à effet hall pour mesurer les courants mesure de puissance.
                  - Faire un choix technologique pour mesurer la tension. Envoyer les informations en utilisant un protocole choisi (I2C, UART…).
                  - Réalisation des essais des différentes structures sélectionnées sur plaque de prototypage.
                  - Se concerter avec les autres membres du projet pour valider les choix concernant la communication.
                  - Choisir un mode de communication (synchrone ou asynchrone).
                  - Réaliser les schémas sur ISIS, simulation et importation sur ARES pour réaliser le PCB des cartes électroniques.
                  - Intégration dans le système.                                                                                                                                              |
   +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 2  | - Réalisation de la fonction : Contrôle de la charge de la batterie.
                  - Réaliser la fonction basculer d’une source d’énergie à une autre.
                  - Réaliser les actionneurs de puissance.
                  - Mesure de la tension batterie par diviseur de tension.
                  - Réalisation du programme en C permettant de vérifier l’état de la batterie et d’envoyer un message en cas de défaillance.
                  - Réaliser une fonction en C permettant de commuter vers une autre source d’alimentation.
                  - Réaliser une simulation sur ISIS en utilisant un PIC16F88.
                  - Réalisation des essais sur plaque de prototypage.
                  - Réaliser la structure de puissance permettant la commutation des différentes sources de tension.
                  - Se concerter avec les autres membres du projet pour valider les choix concernant la communication.
                  - Réalisation des cartes et intégration dans le système.                                                       |
   +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 3  | - Réceptionner les informations et les enregistrer dans une base de données locale.
                  - Visualiser les informations sous forme graphique de façon générale et de façon spécifique en cas d’utilisateur connecté.
                  - Déterminer les données à récupérer et leurs formats.
                  - Etablir un protocole d’encodage des données avec l’étudiant 1 pour le transfert des informations depuis la carte électronique.
                  - Etablir le modèle des données pour la base de données.
                  - Prendre en main la technologie Radio utilisée pour la transmission de données.
                  - Créer le script de réception des données qui permet de récupérer les données à intervalle de temps régulier.
                  - Enregistrer les données récupérées dans la base de données.
                  - Etablir un moyen avec l’étudiant 4 pour déterminer l’utilisateur courant du système et enregistrer les données en tant que données utilisateurs.                                   |
   +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 4  | - Créer une interface graphique sur la Raspberry Pi permettant de changer le réseau électrique d’alimentation entre EDF et les panneaux solaires.
                  - Créer un slider sur l’interface tactile permettant de changer la luminosité du luminaire.
                  - Choix d’une technologie (Python, PHP, etc.).
                  - Choisir la technologie SGBD à utiliser.
                  - Créer une interface de connexion utilisateur.
                  - Distinguer 3 types de connexions : utilisateur, administrateur, cycliste.
                  - Etablir un moyen avec l’étudiant 3 pour que lorsqu’un cycliste est connecté, les données de production soient enregistrées sous son profil.
                  - Permettre à l’administrateur d’ajouter des utilisateurs ou des cyclistes.
                  - Permettre à un utilisateur connecté de visualiser l’état du système : production instantanée, graphique de l’historique de la production.                                              |
   +-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+


   +---------------+--------------------+-------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant      | Résumé description |                                                                                                                             |
   +===============+====================+=====================================================================================================================================+
   | Etudiant 1 EC | Réalisation de la fonction mesure de puissance. Envoyer les informations en utilisant un protocole choisi (I2C, UART…) |
   +---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 2 EC |   |
   +---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 3 IR |   |
   +---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+
   | Etudiant 4 IR |   |
   +---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------+



4/ Exploitation Pédagogique – Compétences terminales évaluées
-------------------------------------------------------------

.. image:: img/comm/Contrats-tache.png


To retrieve a list of random ingredients,
you can use the ``lumache.get_random_ingredients()`` function:

.. autofunction:: lumache.get_random_ingredients

The ``kind`` parameter should be either ``"meat"``, ``"fish"``,
or ``"veggies"``. Otherwise, :py:func:`lumache.get_random_ingredients`
will raise an exception.

.. autoexception:: lumache.InvalidKindError

For example:

>>> import lumache
>>> lumache.get_random_ingredients()
['shells', 'gorgonzola', 'parsley']
