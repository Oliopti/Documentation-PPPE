EC1 - Djibril Chaabi
====================

.. _installation:

I- Présentation du contrat
--------------------------


Dans le cadre du projet, une attention particulière est accordée à la réalisation de la fonction de mesure de puissance. 
Pour ce faire, une sonde à effet Hall est utilisée afin d'obtenir des mesures précises des courants. Parallèlement, un choix technologique est effectué pour mesurer la tension de manière fiable. 
En utilisant un multiplicateur, il est ensuite possible de déduire une image précise de la puissance en combinant les mesures de courant et de tension. 
Des essais sont réalisés sur une plaque de prototypage afin de tester différentes structures et de sélectionner la plus adaptée. 
Une étroite collaboration avec les autres membres du projet est essentielle pour valider les choix concernant la communication. 
Un protocole tel que l'I2C ou l'UART est choisi pour envoyer les informations de mesure. 
Les schémas sont réalisés sur ISIS, puis simulés avant d'être importés sur ARES pour concevoir les PCB des cartes électroniques. 
Enfin, l'intégration de ces cartes dans le système global est effectuée pour assurer un fonctionnement harmonieux et efficace.


`Cliquez ici pour voir le code complet <https://youtu.be/xvFZjo5PgG0>`_



Creating recipes
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

