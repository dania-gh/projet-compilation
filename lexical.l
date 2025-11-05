%{
#include "Syntaxique.tab.h"   
int nb_ligne=1;
%}
lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
/*cst {chiffre}+*/
CE (0|[+-]?[1-9][0-9]*)
%%
"@use" return mc_use;
"io" return bib_io;
"math" return bib_math;
Name return mc_name;
start return mc_start;
stop return mc_stop;
int return mc_int;
float return mc_float;
text return mc_text;
{CE} return ce;
{IDF} return idf;
"." return pt;
":" return dp;
"=" return equal;
[ \t]      ; 
\n   {nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%