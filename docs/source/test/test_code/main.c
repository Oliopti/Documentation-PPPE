#include <stdio.h>

int main() {
    char nom[50];
    
    printf("Quel est votre nom ? ");
    scanf("%s", nom);
    
    printf("Bonjour, %s ! Bienvenue en langage C.\n", nom);
    
    return 0;
}

