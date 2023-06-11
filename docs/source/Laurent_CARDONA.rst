EC2 - Laurent Cardona
====================

.. _installation:

I - Présentation du contrat
--------------------------

Mon contrat est destiné au contrôle de la charge des batteries et la commutation d'une source d'énergie à une autre.

Pour mesurer la tension des batteries j'ai dû faire un pont diviseur de tension. Un programme en C vérifie l'état de la batterie et envoie un message en cas de défaillance et il permet aussi la commutation.

Le programme est implanté sur un microcontrôleur PIC12F1572. J'ai d'abord effectué une simulation sur ISIS avant de faire des essais sur une plaque de prototypage pour au final réaliser une carte électronique avec tous les composants dont j'avais besoin. La commutation se fait entre les batteries et EDF dès que les batteries sont déchargées. 


Dans le cadre de ce projet, plusieurs fonctions doivent être réalisées pour assurer le contrôle de la charge de la batterie, la commutation entre différentes sources d'énergie et la mise en œuvre des actionneurs de puissance. Tout d'abord, une mesure de la tension de la batterie sera effectuée à l'aide d'un diviseur de tension. Ensuite, un programme en langage C sera développé pour vérifier l'état de la batterie et envoyer un message d'alerte en cas de défaillance. Une fonction supplémentaire en C sera mise en place pour permettre la commutation vers une autre source d'alimentation lorsque nécessaire.

Pour valider le fonctionnement du système, une simulation sera réalisée sur ISIS en utilisant un microcontrôleur PIC16F88. Par la suite, des essais seront effectués sur une plaque de prototypage pour évaluer la performance du système dans des conditions réelles. Une structure de puissance sera conçue pour permettre la commutation entre les différentes sources de tension.

Une étroite collaboration avec les autres membres de l'équipe du projet sera nécessaire pour valider les choix liés à la communication entre les différents composants. Enfin, des cartes seront réalisées et intégrées dans le système pour assurer son bon fonctionnement global.

Ce processus de réalisation permettra d'obtenir un système efficace et fiable pour le contrôle de la charge de la batterie, la commutation d'énergie et l'actionnement des composants de puissance.


`Cliquez ici pour voir le code <https://github.com/Oliopti/pppe/blob/main/projetBTS.X/PROJETBTS.c>`_



II - Description du code
------------------------

.. warning::

   Code en cours de mis à jour.


Ce code est écrit en langage C et semble être destiné à un microcontrôleur PIC12F1572. Il utilise les bibliothèques ``xc.h`` et ``pic12f1572.h`` spécifiques à ce microcontrôleur.

Voici une explication du code :

- ``#include <xc.h>`` : Cette ligne inclut la bibliothèque ``xc.h``, qui contient des définitions spécifiques au microcontrôleur PIC.
- ``#include <pic12f1572.h>`` : Cette ligne inclut la bibliothèque ``pic12f1572.h``, qui contient des définitions spécifiques au microcontrôleur PIC12F1572.
- ``#pragma config FOSC=INTOSC, MCLRE=OFF, WDTE=OFF`` : Cette directive pragma configure certains paramètres du microcontrôleur tels que la source d'horloge interne (INTOSC), la désactivation de la broche MCLR (MCLRE) et la désactivation du watchdog timer (WDTE).
- ``int res, i;`` : Déclaration des variables ``res`` et ``i`` de type entier.
- Déclaration de plusieurs tableaux de caractères (``texte1``, ``texte2``, etc.) contenant des messages.
- ``volatile unsigned int timer0_interrupts = 0;`` : Déclaration d'une variable volatile ``timer0_interrupts`` de type ``unsigned int`` et initialisation à 0.

Ensuite, le code définit plusieurs fonctions :

- ``void Init_can()`` : Cette fonction configure les registres nécessaires pour utiliser le CAN (Contrôleur d'ADC) du microcontrôleur.
- ``void init_uart()`` : Cette fonction configure les registres nécessaires pour utiliser l'UART (Universal Asynchronous Receiver-Transmitter) du microcontrôleur.
- ``void code(unsigned char c)`` : Cette fonction est utilisée pour envoyer un caractère via l'UART.
- ``void Temp()`` : Cette fonction effectue une temporisation.

La fonction principale ``main()`` est la boucle principale du programme :

- ``OSCCON=0b01011011`` : Configure la fréquence du microcontrôleur à 1 MHz.
- Configuration des registres pour le fonctionnement du Timer1 en mode temporisation.
- Boucle infinie ``while (1)`` qui effectue les opérations suivantes en boucle :
  - Appel de la fonction ``Init_can()`` pour initialiser le CAN.
  - Conversion analogique-numérique à l'aide de l'ADC du microcontrôleur.
  - Appel de la fonction ``init_uart()`` pour initialiser l'UART.
  - Vérification d'un compteur ``timer0_interrupts``. Si celui-ci dépasse une certaine valeur (150 dans ce cas), certaines opérations sont effectuées en fonction de la valeur de ``res`` (résultat de la conversion ADC).
  - Dans chaque cas, des messages sont envoyés via l'UART en utilisant la fonction ``code()``.
  - Des temporisations (`Temp()`) sont effectuées entre l'envoi des messages.

Enfin, la fonction d'interruption ``isr()`` est définie. Cette fonction est appelée lorsque l'interruption du Timer1 se produit. Elle incrémente la variable ``timer0_interrupts`` et réinitialise les registres du Timer1 pour préparer la prochaine interruption.

Notez que ce code est spécifique au microcontrôleur PIC12F1572 et utilise des registres et des fonctionnalités spécifiques à ce microcontrôleur.

.. code-block:: c
   :linenos:

    #include <xc.h>
    #include <pic12f1572.h>
    #pragma config FOSC=INTOSC, MCLRE=OFF, WDTE=OFF
    int res, i;
    char texte1[]="Batterie 100% \r";
    char texte2[]="Batterie 80% \r";
    char texte3[]="Batterie 60% \r";
    char texte4[]="Batterie 40% \r";
    char texte5[]="Batterie 20% \r%";
    char texte6[]="Maintenance requise \r%";

    volatile unsigned int timer0_interrupts = 0;

    void Init_can()
    {
        ADCON0=0b00000101;
        ADCON1=0b10000000;
        ADCON2=0x00;
        ANSELA=0b00000010;
        OPTION_REG=0x80;
    }

    void init_uart(void)
    {
    TRISAbits.TRISA0 = 1; // TX broche RA0 du pic en sortie
    TXSTA = 0b00100000;   // configuration du registre de transmission
    RCSTA = 0b10010000;   // configuration du registre de réception
    SPBRG = 12;           // Défini la vitesse de transmission à 9600Bauds
    }

    void code(unsigned char c)    // fonction transmission du code
    {
    while(PIR1bits.TXIF==0);    // pas de transmission en cours ?
    TXREG=c;     /* envoie un caractère */
    }
    void Temp()
    {
        int u=65536;
        while(u--);
    }

    void main(void) 
    {   OSCCON=0b01011011;//fréquence réglée à 1MHz
        TRISA=0b00000010;
        PORTA=0x00;
        T1CONbits.TMR1CS = 0b00;
        T1CONbits.T1CKPS = 0b11;
        TMR1H = 0x0b;
        TMR1L = 0xDC;
        PIE1bits.TMR1IE = 1;
        INTCONbits.PEIE = 1;
        INTCONbits.GIE = 1;
        T1CONbits.TMR1ON =1;
        while (1)
        {
            
        Init_can();
        ADCON0bits.ADGO=1;
        while(ADGO);
        res=ADRESH<<8;
        res=res|ADRESL;
        _delay(1000);
        
        init_uart();
        if (timer0_interrupts >= 150) // 0.5 = 1s
        {
            timer0_interrupts =0;
            if (res>=922) //batterie 100%
            {
                PORTAbits.RA4=1;//Relais alimenté, alimentation par batteries
                PORTAbits.RA2=0;
                init_uart();
                for (i=0; i<=14; i++)
                {
                    code(texte1[i]);
                }
                Temp();
                Temp();
            }
            if ((res<922)&&(res>=891)) // batterie 80%
            {
                PORTAbits.RA2=0;
                PORTAbits.RA4=1; //Relais alimenté, alimentation par batteries
                init_uart();
                for (i=0; i<=14; i++)
                {
                code(texte2[i]);
                }
                _delay(100000);
            }
            if ((res<891)&&(res>=860)) // batterie 60%
            {
                PORTAbits.RA2=0;
                PORTAbits.RA4=1;//Relais alimenté, alimentation par batteries
                init_uart();
                for (i=0; i<=14; i++)
                {
                    code(texte3[i]);
                }
                Temp();
                Temp();
            }
            if ((res<860)&&(res>=819)) // batterie 40%
            {
                PORTAbits.RA2=0;
                PORTAbits.RA4=1;//Relais alimenté, alimentation par batteries
                init_uart();
                for (i=0; i<=14; i++)
                {
                    code(texte4[i]);
                }
                Temp();
                Temp();
            }
            if ((res<829)&&(res>=799)) // batterie 20%
            {
                PORTAbits.RA2=0;
                PORTAbits.RA4=1;//Relais alimenté, alimentation par batteries
                init_uart();
                for (i=0; i<=14; i++)
                {
                    code(texte5[i]);
                }
                Temp();
                Temp();
            }
            if (res<799) //Batterie déchargée
            {
                PORTAbits.RA2=1;
                PORTAbits.RA4=0;//Alimentation réseau
                init_uart();
                for (i=0; i<=20; i++)
                {
                    code(texte6[i]);
                }
                Temp();
                Temp();
            }
        }
        }
    }

    void __interrupt() isr(void) {
        if (PIR1bits.TMR1IF) {
            PIR1bits.TMR1IF = 0;
            TMR1H = 0x0B;
            TMR1L = 0xDC;
            timer0_interrupts++;
        }
    }
        