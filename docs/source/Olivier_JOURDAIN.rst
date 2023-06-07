IR3 - Olivier Jourdain
================

.. _installation:

I- Présentation du contrat
--------------------------


Dans le cadre du processus de réception et d'enregistrement des informations dans une base de données locale, plusieurs étapes doivent être suivies. Tout d'abord, il est essentiel de déterminer les données à récupérer ainsi que leurs formats respectifs. Cela implique de travailler en collaboration avec l'étudiant 1 pour établir un protocole d'encodage des données, permettant le transfert fluide des informations depuis la carte électronique.

En parallèle, il est nécessaire d'établir le modèle des données qui sera utilisé pour la base de données. Cette étape joue un rôle crucial dans l'organisation et la structure des informations enregistrées. De plus, il est important de se familiariser avec la technologie radio utilisée pour la transmission des données, afin de garantir une communication fiable et sécurisée.

Pour assurer la réception périodique des données, un script doit être créé. Ce script permettra de récupérer les informations à intervalle de temps régulier, assurant ainsi une mise à jour constante de la base de données. Les données récupérées sont ensuite enregistrées dans la base de données, créant ainsi un système d'archivage et de stockage efficace.

En collaboration avec l'étudiant 4 :doc:`Bastien_VIVIAN`, il convient d'établir un moyen de déterminer l'utilisateur actuel du système. Cette information est ensuite enregistrée dans la base de données en tant que données utilisateur, permettant une identification précise des responsables des enregistrements.

Par ailleurs, il est envisagé de créer une interface graphique sur la Raspberry Pi. Cette interface tactile facilitera la manipulation et le contrôle du réseau électrique d'alimentation, offrant ainsi la possibilité de basculer entre les sources d'énergie, qu'il s'agisse d'EDF ou des panneaux solaires.

Enfin, dans le cadre de l'interface tactile, il est prévu de créer un slider permettant d'ajuster et de contrôler facilement le réseau électrique d'alimentation. Ce dispositif interactif offre une solution conviviale et intuitive pour gérer l'alimentation électrique selon les besoins spécifiques.

En suivant ces différentes étapes, il sera possible d'assurer une réception et un enregistrement efficaces des informations dans la base de données locale, tout en offrant une interface conviviale pour le contrôle du réseau électrique d'alimentation.


Pour voir le code complet :doc:`Annexe_IR3`

OU

`Cliquez ici pour voir le code complet <https://github.com/Oliopti/pppe/tree/main/Code_de_Olivier>`_


II – Ressources, matériel utilisé et choix technologiques
---------------------------------------------------------

A – Logiciels
^^^^^^^^^^^^^

Pour l’organisation :

- Notion :
Notion est une plateforme tout-en-un de productivité et de collaboration qui offre des fonctionnalités telles que la prise de notes, création d’un diagramme de Gantt, la gestion de tâches, la création de bases de connaissances et la collaboration en équipe, le tout dans une interface personnalisable. Cela m’a permis d’avoir une vision globale de l'avancée du projet.

- Draw.io :
Draw.io est un logiciel polyvalent de conception de diagrammes, idéal pour créer des diagrammes UML et SysML pour représenter les différentes facettes d'un projet, tels que les classes, les exigences, etc.


Pour développer :

- PyCharm :
PyCharm est un environnement de développement intégré (IDE) spécialement conçu pour la programmation en Python, offrant des fonctionnalités avancées telles que la complétion de code, le débogage, la gestion de projets et l'intégration avec des outils de développement populaires.

- XCTU est un logiciel développé par Digi International qui permet de configurer, surveiller et mettre à jour les modules XBee.


Pour la base de données :

- MariaDB :
MariaDB est un système de gestion de base de données (SGBD) open source et performant, qui constitue une alternative compatible à MySQL et offre des fonctionnalités avancées pour la gestion et le stockage des données.


- phpMyAdmin :
PhpMyAdmin est un outil open-source permettant de gérer et d'administrer facilement des bases de données MySQL à travers une interface web.


- Apache2 :
Apache2 est un serveur web open-source largement
utilisé, offrant une plateforme stable et sécurisée pour héberger des sites web et servir des pages aux utilisateurs. Apache2 m’a fourni un accès à phpMyAdmin via un navigateur web.


Pour le contrôle à distance :

- Remmina :
c’est une application open-source de bureau à distance qui permet aux utilisateurs de se connecter et de contrôler facilement des ordinateurs distants à partir d'une seule interface via le protocole RDP (Remote Desktop Protocol).

- Microsoft Virtual Desktop :
c’est une solution de virtualisation qui permet aux utilisateurs d'accéder à distance à des ordinateurs virtuels et à des applications Windows à partir de n'importe quel appareil, offrant une expérience de bureau virtuel sécurisée et flexible via le protocole RDP (Remote Desktop Protocol). 


B – Matériel

Une base de données de test pour effectuer les premiers tests d’interaction avec linux :

- Raspberry Pi 3 Model B v1.2 

ROM : SD Card : 8-16 Go
RAM : 1Go
Operating System : Raspbian GNU/Linux 11 (bullseye)
Kernel : Linux 6.1.21-v7+
Architecture : arm7l
CPU(s) : 4
CPU max MHz : 1200.0000
CPU min MHz : 600.0000

Une base de données avec l’écran tactile pour gérer le passage entre le réseau EDF et les panneaux solaires et gérer la luminosité via un slider dans l’interface tactile :

- Raspberry Pi 3 Model B v1.2 avec Touch Display 7″

ROM : SD Card : 8-16 Go
RAM : 1Go
Operating System : Raspbian GNU/Linux 11 (bullseye)
Kernel : Linux 6.1.21-v7+
Architecture : arm7l
CPU(s) : 4
CPU max MHz : 1200.0000
CPU min MHz : 600.0000

Taille de l'écran (diagonale) : 7 pouces
Format d'affichage : 800 (RGB) × 480 pixels
Zone active : 154,08 mm × 85,92 mm
Écran tactile : Véritable écran tactile capacitif multi-touch avec jusqu'à 10 points d'absolution

- Ordinateur MacBook Pro :
pour la bureautique, l’organisation, créer différents diagrammes et mettre à jour le diagramme de Gantt.

- Ordinateur avec Ubuntu 22.04 :
pour programmer, faire des différents tests, exécuter du code


C – Choix technologiques

Communication radio : 

Pour la transmission des données j’ai choisi XBee Pro S1 comme module de communication sans fil. Les modules XBee Pro S1 sont faciles à utiliser et offrent une connectivité fiable et sécurisée. Ils ont une faible consommation d'énergie, une grande flexibilité et une capacité à être intégrés dans une large gamme d'applications. Ils prennent en charge diverses interfaces de communication, telles que UART, SPI et I2C.

Protocole de communication :
Le module XBee Pro S1 prend uniquement en charge le protocole de communication Zigbee. Il est important de noter qu’il n'est pas compatible avec d'autres protocoles tels que le Wi-Fi ou Bluetooth. Zigbee offre une portée étendue, une faible consommation d'énergie, la connectivité à plusieurs appareils et des fonctionnalités avancées, le distinguant ainsi du Bluetooth, du Wi-Fi, du LoRa et de Sigfox.


Quel équivalent ?

WiFi :
- Consommation d'énergie plus élevée, ce qui peut limiter l'autonomie des appareils alimentés par batterie.
- Plus complexe à mettre en œuvre et à configurer

Bluetooth :
- Consommation d'énergie plus élevée, ce qui peut être un inconvénient dans les applications nécessitant une autonomie prolongée des batteries.
- Courte portée, ce qui peut être un inconvénient dans les applications nécessitant une communication à longue distance à travers un réseau de capteurs.
- Connectivité limitée, conçue pour connecter directement deux appareils à proximité.

LoRa :
- Débit de données plus faible, optimisé pour des applications nécessitant une communication longue portée avec une faible consommation d'énergie.
- Latence plus élevée, délai plus important entre l'envoi et la réception des données

Sigfox :
- Limitation du débit de données dans ses réseaux pour réduire la consommation d'énergie et les coûts
- Abonnement nécessaire donc coût supplémentaire
- Couverture réseau peut varier selon les régions


Ordinateurs monocartes :

Raspberry Pi :
- énorme communauté d'utilisateurs et de développeurs qui partagent des projets, des tutoriels et des ressources
- Variété d'accessoires et de modules complémentaires, tels que des écrans tactiles, des caméras, des capteurs, des cartes d'extension, etc
- Prend en charge une grande variété de systèmes d'exploitation, notamment Raspbian (basé sur Linux), Ubuntu, Windows IoT Core, etc
- Connectivité, ports Ethernet, USB, HDMI et sans fil (Wi-Fi et Bluetooth) intégrées

Quel équivalent ?

BeagleBone Black, Odroid, Nvidia Jetson Nano, Asus Tinker Board, majoritairement manque de connectivité, flexibilité et de documentations


Système d’exploitation :

- Raspberry Pi OS : Optimisé pour la Raspberry Pi, vaste compatibilité logicielle

Quel équivalent ?

- Ubuntu Desktop : mais pas assez optimisé pour la Raspberry Pi qui est peu puissante
- Ubuntu server : besoin d’une interface graphique
- Arch Linux : beaucoup trop complexe à entretenir (bas niveau => plus de codage)



Systèmes de gestion de bases de données (SGBD) :

MariaDB :
- Open-source maintenu par une communauté active
- Compatible avec MySQL cela permet d’être facilement migrées vers MariaDB
- Fonctionnalités supplémentaires par rapport à MySQL, moteurs de stockage supplémentaires

Quel équivalent ?

- Oracle Database : Oracle est un SGBD propriétaire largement utilisé dans les entreprises. Il offre une grande puissance, une évolutivité élevée, des fonctionnalités avancées et une intégration étroite avec d'autres produits Oracle. Cependant, en raison de son statut “propriétaire” (code source fermé), il peut être plus coûteux et moins accessible pour les petites et moyennes entreprises.
- Microsoft SQL Server : Il s'agit d'un SGBD propriétaire développé par Microsoft, largement utilisé dans les environnements Windows. SQL Server est apprécié pour son intégration transparente avec d'autres produits Microsoft, sa convivialité et ses outils de développement. Cependant, comme Oracle, il peut être plus coûteux et moins adapté aux environnements non-Windows.


Langage de programmation :

Python présente de nombreux avantages, notamment une syntaxe claire et concise, une vaste bibliothèque standard, une compatibilité multiplate-forme, une grande polyvalence dans divers domaines tels que le développement web et l'analyse de données, une communauté. En somme, Python est un langage de programmation puissant, facile à apprendre et largement utilisé.

Quel équivalent ?

- Langage C : C'est un langage de programmation de bas niveau qui offre un contrôle précis sur le matériel informatique. Il est plus rapide que Python, mais nécessite généralement plus de travail et de code pour accomplir les mêmes tâches.
- Langage Java : Un langage de programmation populaire utilisé pour créer des applications de bureau, des applications mobiles et des systèmes distribués. Java est souvent considéré comme plus verbeux que Python, ce qui signifie qu'il nécessite généralement plus de code pour accomplir les mêmes tâches.
- Langage C++ : Une extension du langage C qui prend en charge la programmation orientée objet. C++ est également plus rapide que Python, mais il peut être plus complexe et nécessite souvent plus de compétences en programmation.



III - Description du code pour récupérer les données et les inporter dans la base de donnée:
--------------------------------------------------------------------------------------------



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



IV- Description du code de l'IHM `in situ`
-----------------------------------------


`Cliquez ici pour voir le code complet <https://github.com/Oliopti/pppe/blob/main/Code_de_Olivier/IHM_in_situ/0v-Projet_solaire.py>`_

OU

Pour voir le code complet :doc:`Annexe_IR3`

Ce code utilise la bibliothèque Tkinter pour créer une interface graphique permettant de piloter un luminaire à l'aide d'un Raspberry Pi. Voici une explication ligne par ligne :


.. code-block:: python
   :linenos:

    from tkinter import *
    import smbus
    import time
    import RPi.GPIO as GPIO


Les trois premières lignes importent les modules nécessaires : ``tkinter`` pour l'interface graphique, ``smbus`` pour la communication I2C (non utilisée dans ce code) et ``RPi.GPIO`` pour la manipulation des broches GPIO du Raspberry Pi.

.. code-block:: python
   :linenos:

    GPIO.setmode(GPIO.BOARD)
    GPIO.setup(37, GPIO.OUT)
    GPIO.setup(12, GPIO.OUT)
    p = GPIO.PWM(12, 100)
    p.start(0)


Ces lignes initialisent le mode de numérotation des broches GPIO ``(`GPIO.BOARD`)``, configurent les broches 37 et 12 en sortie (`GPIO.OUT`) et créent un objet PWM (`p`) sur la broche 12 avec une fréquence de 100 Hz. La fonction `start(0)` démarre le signal PWM avec un rapport cyclique de 0%.

.. code-block:: python
   :linenos:
   
    fenetre = Tk()
    fenetre.title("Pilotage progressif des luminaires")
    fenetre.geometry("650x300")
    fenetre.configure(bg="ghost white")


Ces lignes créent une fenêtre graphique en utilisant la classe ``Tk`` du module Tkinter. La fenêtre est titrée "Pilotage progressif des luminaires" et a une taille de 650x300 pixels. La couleur de fond est réglée sur "ghost white".

.. code-block:: python
   :linenos:
   
    message = Label(fenetre, text="Production d'énergie", fg="blue", bg="ghost white", font=("Courier", 25))
    message.place(x=120, y=25)


Cette ligne crée un widget ``Label`` qui affiche le texte "Production d'énergie" avec une couleur de texte bleue et une police de caractères "Courier" de taille 25. Le label est positionné à la coordonnée (120, 25) dans la fenêtre.

.. code-block:: python
   :linenos:
   
    def Allumer():
        print("Allumage du luminaire")
        GPIO.output(37, GPIO.HIGH)
        time.sleep(1)

    def Eteindre():
        print("Eteindre le luminaire")
        GPIO.output(37, GPIO.LOW)
        time.sleep(1)


Ces deux blocs de code définissent les fonctions `Allumer()` et `Eteindre()`. Lorsqu'elles sont appelées, elles mettent respectivement la broche GPIO 37 en état haut (allumage) ou bas (extinction) pendant une seconde, et affichent un message à la console.

.. code-block:: python
   :linenos:
   
    def valeur(var):
        temp = var.get()
        print(temp)
        p.ChangeDutyCycle(temp)


Cette fonction ``valeur()`` est appelée lorsque la valeur du curseur ``(`Scale`)`` est modifiée. Elle récupère la valeur du curseur, l'affiche à la console, puis modifie le rapport cyclique du signal PWM ``(`p`)`` en utilisant la méthode ``ChangeDutyCycle()``.

.. code-block:: python
   :linenos:
   
    bouton1 = Button(fenetre, text="Quitter", fg="blue", command=fenetre.destroy)
    bouton1.place(x=250, y=100)

    bouton2 = Button(fenetre, text="Allumer", fg="blue", activebackground="white", command=Allumer)
    bouton2.place

    (x=50, y=100)

    bouton3 = Button(fenetre, text="Eteindre", fg="blue", activebackground="white", command=Eteindre)
    bouton3.place(x=150, y=100)



Ces lignes créent trois boutons ``(`Button`)`` dans la fenêtre. Le premier bouton a le texte "Quitter" et appelle la méthode ``destroy()`` de la fenêtre lorsqu'il est cliqué. Les deux autres boutons sont respectivement pour "Allumer" et "Éteindre", et appellent les fonctions ``Allumer()`` et ``Eteindre()`` lorsqu'ils sont cliqués.

.. code-block:: python
   :linenos:
    
    var = DoubleVar()
    curseur = Scale(fenetre, orient='horizontal', from_=0, to=100, resolution=1, tickinterval=10, length=450, activebackground="blue", variable=var, command=lambda x: valeur(var))
    curseur.place(x=100, y=175)


Ces lignes créent un curseur ``(`Scale`)`` horizontal dans la fenêtre. Le curseur va de 0 à 100 avec un intervalle de résolution de 1 et un intervalle de graduation de 10. Sa longueur est fixée à 450 pixels. Lorsque la valeur du curseur est modifiée, la fonction ``valeur()`` est appelée avec la variable ``var`` passée en tant que paramètre.

.. code-block:: python
   :linenos:
   
    fenetre.mainloop()


Cette ligne lance la boucle principale de l'interface graphique, permettant à la fenêtre d'être affichée et de répondre aux interactions de l'utilisateur.

