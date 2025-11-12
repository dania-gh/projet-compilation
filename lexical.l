%{
#include "Syntaxique.tab.h"   
int nb_ligne=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
/*cst {chiffre}+*/
CE (0|[+-]?[1-9][0-9]*)
CR ({CE}\.[0-9]+)
%%
"@use" {printf("use ");return mc_use;}
"io" {printf("is ");return bib_io;}
"math" {printf("math ");return bib_math;}
Name {printf("name ");return mc_name;}
start {printf("start ");return mc_start;}
stop {printf("stop ");return mc_stop;}
int {printf("Mc_int ");return mc_int;}
float {printf("mc_float ");return mc_float;}
text {printf("mc_text ");return mc_text;}
{CE} {printf("ce ");return ce;}
{CR} {printf("ce ");return cr;}
{IDF} {printf("idf ");return idf;}
"." {printf("pt ");return pt;}
":" {printf("dp ");return dp;}
"=" {printf("equal ");return equal;}
";" {printf("pvg ");return pvg;}
[ \t]      ; 
\n   {printf("\n");nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%