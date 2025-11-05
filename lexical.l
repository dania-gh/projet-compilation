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
start return mc_start;
stop return mc_stop;
{IDF} return idf;
"." return pt;
":" return dp;
[ \t]      ; 
\n   {nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%