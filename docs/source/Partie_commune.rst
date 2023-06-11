Partie commune
==============

.. _installation:

https://github.com/Oliopti/pppe/blob/main/ressource/Projet%20p%C3%A9dagogique%20de%20production%20d'%C3%A9nergie.pdf

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

   +------------+------------+
   | Colonne 1  | Colonne 2  |
   +============+============+
   | Ligne 1    | Ligne 1    |
   +------------+------------+
   | Ligne 2    | Ligne 2    |
   +------------+------------+
   | Ligne 3    | Ligne 3    |
   +------------+------------+



3 - Répartition des fonctions ou cas d’utilisation par étudiant
---------------------------------------------------------------



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
