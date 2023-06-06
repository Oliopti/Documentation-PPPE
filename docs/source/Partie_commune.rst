Partie commune
==============

.. _installation:

1.1- Présentation du projet
-------------------------

Dans le contexte actuel où la production de l’énergie électrique pose quelques problèmes en ce qui
concerne la production, on souhaite rendre autonome l’éclairage de la salle blanche où se
déroulent les cours et les activités pratiques des BTS Systèmes Numériques.
L’installation sera composée de deux panneaux solaires de 390W et de deux vélos couplés à des
alternateurs permettant pour l’ensemble de recharger les deux batteries. L’énergie permettant ainsi 
d’alimenter tous les luminaires de la salle soit 11 points lumineux de 40W chacun.


1.2- Situation du projet dans son contexte
------------------------------------------

Domaine d’activité du système support d’étude :

    -Informatique, réseaux et infrastructures ;-Mobilité et systèmes embarqués ; -Mesure, instrumentation et microsystèmes.



1.2- Cahier des charges – Expression du besoin
----------------------------------------------

Réaliser l’installation de l’ensemble panneaux, régulateur, batteries, vélos et alternateurs pour ensuite :

-gérer l’éclairage via un écran tactile, prévoir un circuit de puissance pour un fonctionnement en 24V continu ou 230V alternatif ;
-mesurer la production des panneaux photovoltaïques, envoyer les informations via XBee ; 
-enregistrement de la production journalière et annuelle des étudiants participant.


2- Spécifications
-----------------



.. code-block:: console

   (.venv) $ pip install lumache

II- Description du code 
----------------

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
