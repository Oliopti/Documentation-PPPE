Test-Titre 1
============

.. _installation:


Titre 2
-------

Titre 3
^^^^^^^

Titre 4
+++++++

Mettre du texte dans en italique *Mettre en italique*

Mettre du texte dans en gras **Mettre en gras**

Mettre du texte dans un cadre ``test``

Faire référence a un autre page :doc:`test`

Insérer un liens `Cliquer ici <https://youtu.be/O91DT1pR1ew>`_


Faire un tableau :

.. tableau::

    +----------+----------+
    | Colonne1 | Colonne2 |
    +==========+==========+
    |   Cell1  |   Cell2  |
    +----------+----------+
    |   Cell3  |   Cell4  |
    +----------+----------+

OU

.. tableau::


    +---------+---------+
    | Prénom  |  Nom    |
    +=========+=========+
    |  Alice  |  Smith  |
    +---------+---------+
    |   Bob   |  Brown  |
    +---------+---------+

Importer une image :

.. image:: test/test_image/image1.jpg





Importer du python :
--------------------

.. literalinclude:: test/test_code/main.py
   :language: python
    
OU

.. code-block:: python
   :linenos:

    nom = input("Quel est votre nom ? ")
    print("Bonjour, " + nom + "! Bienvenue en Python.")



Importer du bash :
------------------

.. literalinclude:: test/test_code/main.sh
   :language: bash
        
OU

.. code-block:: bash
   :linenos:

    #!/bin/bash

    echo "Quel est votre nom ?"
    read nom
    echo "Bonjour, $nom ! Bienvenue en Bash."



Importer du sql :
-----------------

.. literalinclude:: test/test_code/main.sql
   :language: sql

OU

.. code-block:: sql
   :linenos:

    -- Création de la table Utilisateurs
    CREATE TABLE Utilisateurs (
        id INT PRIMARY KEY,
        nom VARCHAR(50),
        age INT
    );

    -- Insertion de quelques enregistrements
    INSERT INTO Utilisateurs (id, nom, age) VALUES (1, 'Alice', 25);
    INSERT INTO Utilisateurs (id, nom, age) VALUES (2, 'Bob', 30);
    INSERT INTO Utilisateurs (id, nom, age) VALUES (3, 'Charlie', 35);

    -- Sélection de tous les utilisateurs
    SELECT * FROM Utilisateurs;



Importer du c :
---------------

.. literalinclude:: test/test_code/main.c
   :language: c
        
OU

.. code-block:: c
   :linenos:

    #include <stdio.h>

    int main() {
        char nom[50];
        
        printf("Quel est votre nom ? ");
        scanf("%s", nom);
        
        printf("Bonjour, %s ! Bienvenue en langage C.\n", nom);
        
        return 0;
    }

        


