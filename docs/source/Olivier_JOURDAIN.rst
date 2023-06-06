IR3 - Olivier Jourdain
================

.. _installation:

I- Présentation du contrat
--------------------------


Dans le cadre du processus de réception et d'enregistrement des informations dans une base de données locale, plusieurs étapes doivent être suivies. Tout d'abord, il est essentiel de déterminer les données à récupérer ainsi que leurs formats respectifs. Cela implique de travailler en collaboration avec l'étudiant 1 pour établir un protocole d'encodage des données, permettant le transfert fluide des informations depuis la carte électronique.

En parallèle, il est nécessaire d'établir le modèle des données qui sera utilisé pour la base de données. Cette étape joue un rôle crucial dans l'organisation et la structure des informations enregistrées. De plus, il est important de se familiariser avec la technologie radio utilisée pour la transmission des données, afin de garantir une communication fiable et sécurisée.

Pour assurer la réception périodique des données, un script doit être créé. Ce script permettra de récupérer les informations à intervalle de temps régulier, assurant ainsi une mise à jour constante de la base de données. Les données récupérées sont ensuite enregistrées dans la base de données, créant ainsi un système d'archivage et de stockage efficace.

En collaboration avec l'étudiant 4, il convient d'établir un moyen de déterminer l'utilisateur actuel du système. Cette information est ensuite enregistrée dans la base de données en tant que données utilisateur, permettant une identification précise des responsables des enregistrements.

Par ailleurs, il est envisagé de créer une interface graphique sur la Raspberry Pi. Cette interface tactile facilitera la manipulation et le contrôle du réseau électrique d'alimentation, offrant ainsi la possibilité de basculer entre les sources d'énergie, qu'il s'agisse d'EDF ou des panneaux solaires.

Enfin, dans le cadre de l'interface tactile, il est prévu de créer un slider permettant d'ajuster et de contrôler facilement le réseau électrique d'alimentation. Ce dispositif interactif offre une solution conviviale et intuitive pour gérer l'alimentation électrique selon les besoins spécifiques.

En suivant ces différentes étapes, il sera possible d'assurer une réception et un enregistrement efficaces des informations dans la base de données locale, tout en offrant une interface conviviale pour le contrôle du réseau électrique d'alimentation.


Pour voir le code complet :doc:`Annexe_IR3`


II- Description du code pour récupérer les données et les inporter dans la base de donnée:
------------------------------------------------------------------------------------------



Voici une explication ligne par ligne du code :


.. code-block:: python
   :linenos:

   import time
   import serial
   import mysql.connector
   
   
Ces lignes importent les modules nécessaires pour le code, notamment ``time``, ``serial`` et ``mysql.connector``.


.. code-block:: python
   :linenos:

    function insertion(mesures)
        try:
            connection = mysql.connector.connect(
                host='172.20.10.26',
                database='pppe',
                user='admin',
                password='admin'
            )
            print("Essai de connexion au serveur MySQL")
            cursor = connection.cursor()
            mySql_insert_query = "INSERT INTO releve_puissance(id_session, mesures) VALUES((SELECT MAX(id) FROM session), " .. mesures .. ")"
            print(mySql_insert_query)
            cursor.execute(mySql_insert_query)
            connection.commit()
            print("Exécuter la commande :", mySql_insert_query)
            cursor.close()
            print("Enregistrement inséré avec succès dans la table releve_puissance")
        except mysql.connector.Error as error:
            print("Échec de l'insertion d'un enregistrement dans la table :", error)
            return false
        return
     

Cette partie du code définit une fonction ``insertion`` qui effectue l'insertion d'une mesure dans une table de la base de données MariaDB. Les étapes effectuées sont les suivantes :

1. Une connexion est établie avec la base de données en utilisant les informations de connexion fournies.
2. Un curseur est créé pour exécuter des requêtes SQL.
3. Une requête d'insertion est construite en utilisant la valeur fournie dans l'argument ``mesures``. La valeur de l'id de session est obtenue en sélectionnant la valeur maximale de la colonne ``id`` dans la table ``session``.
4. La requête d'insertion est exécutée.
5. Les modifications sont validées dans la base de données.
6. Le curseur est fermé.


.. code-block:: python
   :linenos:

   ser = serial.Serial(
      port='/dev/ttyUSB0',
      baudrate=9600,
      parity=serial.PARITY_NONE,
      stopbits=serial.STOPBITS_ONE,
      bytesize=serial.EIGHTBITS,
      timeout=5
)
    if ser.isOpen():
     ser.close()
    ser.open()
    ser.isOpen()


Ces lignes configurent une connexion série en utilisant le module ``serial``. Les paramètres spécifiés sont les mêmes que ceux utilisés précédemment dans l'autre exemple de code que vous avez donné. Le port série est ouvert après la vérification et la fermeture du port s'il est déjà ouvert.


.. code-block:: python
   :linenos:
   
   while True:
      try:
         res = ser.read(6)
         res = res.decode()
         res = res.split("-")
         print("Signal recu :", res)
         insertion(res[1])
         time.sleep(1)
    except:
         print('erreur while true')


Cette partie du code contient une boucle ``while`` qui s'exécute en continu. À chaque itération de la boucle, le code lit 6 octets de données ``(`ser.read(6)`)`` à partir du port série. Les données lues sont ensuite décodées en une chaîne de caractères ``(`res.decode()`)``. Ensuite, la chaîne décodée est divisée en utilisant le délimiteur ``-`` pour obtenir les valeurs individuelles dans une liste ```res = res.split("-")`)``. Les valeurs sont affichées à l'écran, puis la fonction ``insertion`` est appelée avec la deuxième valeur de la liste ``(`res[1]`)`` pour insérer cette valeur dans la base de données.

Enfin, il y a une pause de 1 seconde ``(`time.sleep(1)`)`` entre chaque itération de la boucle. Si une exception se produit, le message d'erreur "erreur while true" est affiché à l'écran.



II- Description du code de l'IHM `in situ`
-----------------------------------------