EC1 - Djibril Chaabi
====================

.. _installation:

I - Présentation du contrat
--------------------------

Dans le cadre de ce projet, diverses étapes doivent être réalisées pour mettre en place la fonction de mesure de courant et de puissance. Tout d'abord, une sonde à effet Hall sera utilisée pour mesurer les courants. Un choix technologique devra également être effectué pour mesurer la tension, en prenant en compte les contraintes et les exigences du système. 

Pour transmettre les informations recueillies, un protocole de communication tel que I2C ou UART sera sélectionné. Des essais seront ensuite réalisés sur une plaque de prototypage afin de valider les différentes structures choisies pour la mesure de courant et de puissance. Une coordination avec les autres membres de l'équipe de projet sera nécessaire pour s'assurer de la pertinence des choix effectués en ce qui concerne la communication.

Un mode de communication, soit synchrone soit asynchrone, sera choisi en fonction des besoins du système. Les schémas seront conçus sur ISIS, puis simulés et importés sur ARES pour réaliser les cartes électroniques correspondantes. Enfin, les cartes seront intégrées dans le système pour assurer leur bon fonctionnement global.

L'ensemble de ces étapes permettra de mettre en place une fonction de mesure de courant et de puissance efficace et précise, en utilisant des technologies appropriées et en garantissant une bonne communication au sein du système.

`Cliquez ici pour voir le code <https://youtu.be/xvFZjo5PgG0>`_



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

