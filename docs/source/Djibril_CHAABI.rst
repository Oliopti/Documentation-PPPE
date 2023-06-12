EC1 - Djibril Chaabi
====================

.. _installation:

I - Présentation du contrat
---------------------------


Mon contrat consiste à relever la puissance produite par le vélo, et envoyer cette donnée

Pour récupérer la puissance du vélo, j’utiliserais une sonde à effet Hall qui mesureras l’intensité,et utiliserais un multiplieur pour avoir la puissance en sortie

Pour envoyer les données, on utilise des modules XBee qui sont sur le protocole ZigBee et enfin un MicroControlleur PIC12F1572, qui sert de convertisseur Analogique-Numérique




Dans le cadre de ce projet, diverses étapes doivent être réalisées pour mettre en place la fonction de mesure de courant et de puissance. Tout d'abord, une sonde à effet Hall sera utilisée pour mesurer les courants. Un choix technologique devra également être effectué pour mesurer la tension, en prenant en compte les contraintes et les exigences du système. 

Pour transmettre les informations recueillies, un protocole de communication tel que I2C ou UART sera sélectionné. Des essais seront ensuite réalisés sur une plaque de prototypage afin de valider les différentes structures choisies pour la mesure de courant et de puissance. Une coordination avec les autres membres de l'équipe de projet sera nécessaire pour s'assurer de la pertinence des choix effectués en ce qui concerne la communication.

Un mode de communication, soit synchrone soit asynchrone, sera choisi en fonction des besoins du système. Les schémas seront conçus sur ISIS, puis simulés et importés sur ARES pour réaliser les cartes électroniques correspondantes. Enfin, les cartes seront intégrées dans le système pour assurer leur bon fonctionnement global.

L'ensemble de ces étapes permettra de mettre en place une fonction de mesure de courant et de puissance efficace et précise, en utilisant des technologies appropriées et en garantissant une bonne communication au sein du système.


`Cliquez ici pour voir le code <https://github.com/Oliopti/pppe/blob/main/Code_de_Djibril/main.c>`_


II - Description du code
------------------------

.. note::

   Code en cours de mise à jour.

Ce code est écrit en langage C et semble être destiné à un microcontrôleur PIC12F1572. Il utilise les bibliothèques ``xc.h`` et ``pic12f1572.h`` spécifiques à ce microcontrôleur.

Voici une explication du code :

- ``#include <xc.h>`` : Cette ligne inclut la bibliothèque ``xc.h``, qui contient des définitions spécifiques au microcontrôleur PIC.
- ``#include <pic12f1572.h>`` : Cette ligne inclut la bibliothèque ``pic12f1572.h``, qui contient des définitions spécifiques au microcontrôleur PIC12F1572.
- ``#pragma config WDTE=OFF, FOSC=INTOSC, MCLRE=OFF`` : Cette directive pragma configure certains paramètres du microcontrôleur tels que la désactivation du watchdog timer (WDTE), la source d'horloge interne (INTOSC) et la désactivation de la broche MCLR (MCLRE).
- ``int res;`` : Déclaration de la variable ``res`` de type entier.

Ensuite, le code définit plusieurs fonctions :

- ``void Temp()`` : Cette fonction configure le Timer2 du microcontrôleur avec un prescaler et un postscaler spécifiques, puis effectue une boucle d'attente basée sur le drapeau d'interruption du Timer2 (`TMR2IF`) jusqu'à ce qu'il soit réinitialisé.
- ``void Init_CAN()`` : Cette fonction configure les registres nécessaires pour utiliser le CAN (Contrôleur d'ADC) du microcontrôleur.
- ``void init_uart()`` : Cette fonction configure les registres nécessaires pour utiliser l'UART (Universal Asynchronous Receiver-Transmitter) du microcontrôleur.
- ``void code(unsigned char c)`` : Cette fonction est utilisée pour envoyer un caractère via l'UART.

La fonction principale ``main()`` est la boucle principale du programme :

- ``OSCCON=0b01111011;`` : Configure la fréquence du microcontrôleur à 8 MHz.
- Configuration des registres pour le fonctionnement de l'ADC (conversion analogique-numérique) et de l'UART.
- Boucle infinie ``while (1)`` qui effectue les opérations suivantes en boucle :
  - Active le port ``RA1``.
  - Appel de la fonction ``Init_CAN()`` pour initialiser le CAN.
  - Conversion analogique-numérique à l'aide de l'ADC du microcontrôleur.
  - Appel de la fonction ``init_uart()`` pour initialiser l'UART.
  - Envoi de la valeur de ``res`` via l'UART en utilisant la fonction ``code()``.
  - Appel de la fonction ``Temp()`` pour effectuer une temporisation.

Ce code semble effectuer des opérations de conversion ADC, de communication UART et de temporisation en utilisant les périphériques du microcontrôleur PIC12F1572.


Ce code est écrit en langage C et est destiné à être compilé et exécuté sur un microcontrôleur PIC12F1572. Voici une explication partie par partie :

1. Les directives d'inclusion :

.. code-block:: c
   :linenos:

   #include <xc.h>
   #include <pic12f1572.h>

Ces directives incluent les fichiers d'en-tête nécessaires pour le microcontrôleur PIC12F1572 et le compilateur XC8.

2. La directive pragma config :

.. code-block:: c
   :linenos:

   #pragma config WDTE=OFF, FOSC=INTOSC, MCLRE=OFF
   
Cette directive configure les options de configuration du microcontrôleur. Ici, elle désactive le watchdog timer (WDTE), utilise une horloge interne (FOSC=INTOSC) et désactive la broche de réinitialisation (MCLRE=OFF).

3. Définition des variables globales :

.. code-block:: c
   :linenos:

   int res;
   
Cette ligne déclare une variable globale "res" de type entier.

4. La fonction Temp() :

.. code-block:: c
   :linenos:

   void Temp()
   {
     int u;
     T2CON = 0b01111111;      // Poscaler 16 et prescaler 64
     TMR2 = 0x00;
     PR2 = 255;
     PIE1bits.TMR2IE = 1;
     INTCONbits.GIE = 1;
     for (u = 0; u <= 1; u++)
     {
       while (TMR2IF = 0)
     }
     {
       PIR1bits.TMR2IF = 0;
     }
   }
   
Cette fonction configure le timer 2 du microcontrôleur pour générer une temporisation. Elle utilise le prescaler et le postscaler pour régler la fréquence du timer. Ensuite, elle effectue une boucle qui attend que le drapeau de débordement du timer 2 soit activé, puis le drapeau est effacé.

5. La fonction Init_CAN() :

.. code-block:: c
   :linenos:

   void Init_CAN()
   {
     ANSELA = 0x02;
     ADCON0 = 0x05;
     ADCON1 = 0x80;
   }
   
Cette fonction configure les registres associés au contrôleur CAN (Controller Area Network). Elle initialise les ports analogiques, le convertisseur analogique-numérique (CAN) et d'autres registres associés.

6. La fonction init_uart() :

.. code-block:: c
   :linenos:

   void init_uart(void)
   {
     TRISAbits.TRISA0 = 0;    // Configuration de la broche RA0 en sortie (TX)
     TXSTA = 0b00100000;     // Configuration du registre de transmission
     RCSTA = 0b10010000;     // Configuration du registre de réception
     SPBRG = 25;             // Définition de la vitesse de transmission à 9600 bauds
   }
   
   Cette fonction configure l'UART (Universal Asynchronous Receiver Transmitter) pour permettre la communication série. Elle définit les broches de transmission et de réception, les registres de configuration et la vitesse de transmission.

7. La fonction code() :

.. code-block:: c
   :linenos:

   void code(unsigned char c)
   {
     while (PIR1bits.TXIF == 0);   // Vérifie si une transmission est en cours
     TXREG = c;                   // Envoie un
     caractère
     }
   
Cette fonction est utilisée pour transmettre un octet sur l'UART. Elle attend que le registre de transmission soit prêt à envoyer des données, puis elle envoie l'octet.

8. La fonction main() :

.. code-block:: c
   :linenos:

   void main(void)
   {
     OSCCON = 0b01111011;    // Réglage de la fréquence à 8 MHz
     ANSELA = 0x02;
     TRISA = 0b00000110;
     while (1)
     {
       PORTAbits.RA1 = 1;
       Init_CAN();
       ADCON0bits.ADGO = 1;
       while (ADGO);
       res = ADRESH << 8;
       res = res | ADRESL;
       init_uart();
       code(res);
       Temp();
     }
   }


La fonction ``main()`` est la fonction principale du programme. Elle configure la fréquence du microcontrôleur, les ports et les registres associés. Ensuite, elle entre dans une boucle infinie où elle active une broche, initialise le CAN, effectue une conversion analogique-numérique, transmet les données sur l'UART à l'aide de la fonction ``code()``, et appelle la fonction ``Temp()`` pour effectuer une temporisation.

Cela représente une vue d'ensemble du code et de ses différentes parties. Chaque partie joue un rôle spécifique dans l'exécution du programme sur le microcontrôleur PIC12F1572.