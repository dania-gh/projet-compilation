%{
#include "Syntaxique.tab.h"   
int nb_ligne=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+
%%
"@use" return mc_use;
"io" return bib_io;
"math" return bib_math;
Name return mc_name;
{IDF} return idf;
":" return dp;
[ \t]      ; 
\n   {nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%