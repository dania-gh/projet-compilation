#include <stdio.h>
#include <string.h>

typedef struct
{
char NomEntite[20];
char CodeEntite[20];
char TypeEntite[20];
} TypeTS;

//initiation d'un tableau qui va contenir les elements de la table de symbole
TypeTS ts[100]; 

// un compteur global pour la table de symbole
int CpTabSym=0;


//une fonctione recherche: pour chercher est ce que l'entit� existe ou non d�j� dans la table de symbole.
// i: l'entite existe dej� dans la table de symbole, et sa position est i, -1: l'entit� n'existe pas dans la table de symbole.

int recherche(char entite[])
{
int i=0;
while(i<CpTabSym)
{
if (strcmp(entite,ts[i].NomEntite)==0) return i;
i++;
}

return -1;
}

//une fontion qui va ins�rer les entit�s de programme dans la table de symbole
void inserer(char entite[], char code[])
{

if ( recherche(entite)==-1)
{
strcpy(ts[CpTabSym].NomEntite,entite); 
strcpy(ts[CpTabSym].CodeEntite,code);


//printf("lentite est %s, sont type est %s %d\n",ts[CpTabSym].NomEntite,ts[CpTabSym].TypeEntite,CpTabSym);
CpTabSym++;
}
}

//une fonction pour afficher la table de symbole
void afficher ()
{
printf("\n/***************Table des symboles ******************/\n");
printf("________________________________________________\n");
printf("\t| NomEntite |  CodeEntite  |  TypeEntite   \n");
printf("________________________________________________\n");
int i=0;
while(i<CpTabSym)
{

printf("\t|%10s |%12s  |%12s   |\n",ts[i].NomEntite,ts[i].CodeEntite,ts[i].TypeEntite);

i++;
}
}


// fonction qui change le type d'une etit� une fois il va �tre reconu dans la syntaxe 

void insererType(char entite[], char type[])
{

int posEntite=recherche(entite);
if (posEntite!=-1)
{ 

strcpy(ts[posEntite].TypeEntite,type);

//printf("lentite est %s, sont type est %s %d\n",ts[CpTabSym].NomEntite,ts[CpTabSym].TypeEntite,CpTabSym);

}
}





//////////////////////////////////////////////////////
////Les routines s�mantiques

int doubleDeclaration (char entite[])
{
int posEntite=recherche(entite);

//printf ("\nposi %d\n",posEntite);
if (strcmp(ts[posEntite].TypeEntite,"")==0) return 1;  // j'ai pas trouv� le type associ� � l'entit� dans le table de symbole et donc elle est pas encore d�clar�e
else return 0; // le type de l'entit� existe dej� dans la TS et donc c'est une double d�claration

}
