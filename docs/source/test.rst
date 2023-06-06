Créer un fichier RST : Quelques techniques
1. Mise en forme de Base
a. Section et sous-sections

On souligne le texte avec le code suivant :

    # pour les parties
    * pour les chapitres
    =, pour les sections
    -, pour les sous-sections
    ^, pour les sous-sous-sections
    ", pour les paragraphes

b. Mise en forme et listes

Mettre du texte en italique

Mettre du texte en gras

Mettre du texte en courier pour le code

Ce qui donne en code

Mettre du texte en *italique*

Mettre du texte en **gras**

Mettre du texte en ``courier`` pour le code

Liste d’items non numérotées

    item 1
    item 2
    item 3

Ce qui donne en code

- item 1

- item 2

- item 3

On peut aussi faire des listes imbriquées (attention à prendre soin de mettre une ligne supplémentaire) avec d’autres marqueurs :

    en voici un
    une liste
        avec une liste imbriquée
        et un sous-item
    on continue ici la liste initiale

Que l’on code

* en voici un
* une liste

  * avec une liste imbriquée
  * et un sous-item

* on continue ici la liste initiale

Liste d’items numérotées

    Liste numérotée “à la main”.
    Deuxième item.
    Liste numérotée automatiquement.
    Deuxième item.

Que l’on code

1. Liste numérotée "à  la main".
2. Deuxième item.

#. Liste numérotée automatiquement.
#. Deuxième item.

Le plus contraignant étant le saut de ligne qui finit une instruction ou un paragraphe
2. Un peu plus dur
a. Comment intégrer du code

Comment intégrer du code ???

ma_liste = [1.56, "tabouret"]

Comment j’ai fait ?

::

        ma_liste = [1.56, "tabouret"]

–> Ne pas oublier l’indentation !!!!

Comment intégrer du code avec réponse ???

>>> ma_liste[1]
'tabouret'

Comment j’ai fait ?

::

        >>> ma_liste[1]
        'tabouret'

–> Là encore, ne pas oublier l’indentation !!!!

Comment intégrer une fonction len() et le mettre en index

>>> N = len(liste_a_la_prevert)
>>> print(N)
5

Comment j’ai fait ???

.. index:: len()

::

        >>> N = len(liste_a_la_prevert)
        >>> print(N)
        5

b. Comment intégrer une image

Intégration d’un graphique rescalé à 50 %
_images/plot01.png

Comment je fais ????

.. image:: ./graphiques/plot01.png
   :scale: 50 %
   :align: center

–> Là encore, faire très attention à l’indentation !!!! : 3 espaces pour les propriétés.
c. Comment intégrer du code à travers un ficher et le télécharger
Intégation du code

Intégration de code à travers un fichier

# -*- coding: utf-8 -*-
"""
Exemple de plot
"""

from __future__ import division
from scipy import *
from pylab import *

x = linspace(0,10,400)
y = sin(x)*exp(-x/5)
plot(x,y)
show()

Comment je code ???

.. literalinclude:: ./graphiques/exemple_graphique01.py

Téléchargement du code

On peut aussi le télécharger

Voir Ce fichier exemple.

Comment je code ???

See :download:`this example script <./graphiques/exemple_graphique01.py>`.

d. Comment faire une note de bas de page

J’intègre ma note de bas de page, la première d’abord [1], puis la seconde [2]

Je code tout ça de la façon suivante

J'intègre ma note de bas de page, la *première* d'abord [#n5]_, puis la *seconde* [#n3]_

Puis à la fin du document

*Notes de Bas de Pages*

.. [#n5] Ma première note

.. [#n3] Ma seconde note

f. Comment mettre en évidence une chose importante

Warning

Test de Mis en surbrillance, il faudra trouver une méthode pour changer le mot Warning...

Que l’on code en

.. warning::
        Test de Mis en surbrillance, il faudra trouver une méthode pour changer le mot Warning...

Ou encore pour les choses moins importantes

Indice

Mais c’est moins important ici

.. note::
        Mais c'est moins important ici

De nombreux éléments sont déjà définis
Commande 	Qui donne 	Couleur
.. warning:: 	‘i’ int32 	Rouge
.. note:: 	note 	Grise
.. tip:: 	Astuce 	Grise
.. caution:: 	Prudence 	Grise
.. error:: 	Erreur 	Grise
.. hint:: 	Indice 	Grise

On peut même choisir son titre

Titre de la note

Contenu de la note

.. admonition:: Titre de la note

        Contenu de la note

g. Comment faire un tableau
tables simples

On insère un tableau de la façon suivante
A 	B 	A and B
False 	False 	False
True 	False 	False
False 	True 	False
True 	True 	True

Que l’on code

=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======

tables avec header

On insère un tableau de la façon suivante
ADF type 	Numpy type(s) 	Remarks
I4 	‘i’ int32 	(1)
I8 	‘l’ int64 	(2)
R4 	‘f’ float32 	(3)
R8 	‘d’ float64 	(4)
C1 	‘c’ ‘|S1’ 	(5)

Que l’on code de manière pas très pratique

+-------------+----------------+----------+
|*ADF type*   |*Numpy type(s)* |*Remarks* |
+=============+================+==========+
|`I4`         |`'i' int32`     | \(1)     |
+-------------+----------------+----------+
|`I8`         |`'l' int64`     | \(2)     |
+-------------+----------------+----------+
|`R4`         |`'f' float32`   | \(3)     |
+-------------+----------------+----------+
|`R8`         |`'d' float64`   | \(4)     |
+-------------+----------------+----------+
|`C1`         |`'c' '\|S1'`    | \(5)     |
+-------------+----------------+----------+

De la même façon
Header row, column 1 (header rows optional) 	Header 2 	Header 3 	Header 4
body row 1, column 1 	column 2 	column 3 	column 4
body row 2 	... 	... 	 

Que l’on code de manière pas très pratique

+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+

table csv
Titre du tableau Treat 	Quantity 	Description
Albatross 	2.99 	On a stick!
Crunchy Frog 	1.49 	If we took the bones out, it wouldn’t be crunchy, now would it?
Gannet Ripple 	1.99 	On a stick!

Que l’on code

.. csv-table:: Titre du tableau
   :header: "Treat", "Quantity", "Description"
   :widths: 15, 10, 30

   "Albatross", 2.99, "On a stick!"
   "Crunchy Frog", 1.49, "If we took the bones out, it wouldn't be
   crunchy, now would it?"
   "Gannet Ripple", 1.99, "On a stick!"

h. Comment faire un commentaire dans le code

On ne voit pas le commentaire mais je le fait apparaître de la façon suivante en l’intégrant comme du code

.. ---------------------------------------------------------------
.. Mon premier commentaire
.. ---------------------------------------------------------------

i. Comment créer une balise ???

On la créé mais on ne le voit pas

.. _Balise1:
   Balise courante et notes associées

Les notes de Bas de Pages
[1]	Ma première note
[2]	Ma seconde note