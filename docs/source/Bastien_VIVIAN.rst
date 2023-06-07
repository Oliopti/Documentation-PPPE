IR4 - Bastien Vivian
====================

.. _installation:

I- Présentation du contrat
--------------------------


Pour faciliter la visualisation des informations, il est nécessaire de choisir une technologie graphique appropriée, telle que C++, Python, PHP, etc. Cette technologie permettra de créer une interface graphique conviviale pour les utilisateurs. Il est important de fournir une représentation visuelle des données, à la fois de manière générale et de manière spécifique lorsque l'utilisateur est connecté.

Afin de permettre aux utilisateurs de se connecter, une interface de connexion utilisateur est créée. Cette interface permet aux utilisateurs de s'authentifier et d'accéder à leurs profils respectifs. Trois types de connexions sont distingués : utilisateur, administrateur et cycliste.

Pour assurer la liaison avec l'étudiant 3  :doc:`Olivier_JOURDAIN`, un moyen est établi pour enregistrer les données de production sous le profil d'un cycliste lorsqu'il est connecté. Cela permet de suivre et de stocker les informations spécifiques à chaque cycliste.

L'administrateur dispose de la fonctionnalité d'ajouter de nouveaux utilisateurs ou cyclistes au système. Cela lui permet de gérer les comptes et les autorisations d'accès.

Un utilisateur connecté a la possibilité de visualiser l'état du système, y compris la production instantanée d'énergie. Un graphique de l'historique de la production est également disponible, permettant à l'utilisateur de suivre les variations de la production sur une période donnée.

L'ensemble de ces fonctionnalités graphiques et d'interaction utilisateur contribue à une expérience conviviale et informative pour les utilisateurs du système.

`Cliquez ici pour voir le code complet <https://github.com/Oliopti/pppe/tree/main/Code_de_Bast>`_


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

