%{
#include "Syntaxique.tab.h"   
extern nb_ligne;
%}
lettre [a-zA-Z]
chiffre [0-9]
/*IDF {lettre}(_|{chiffre}|{lettre})**/
IDF {lettre}(_|{chiffre}|{lettre})*
/*cst {chiffre}+*/
CE (0|[+-]?[1-9][0-9]*)
CR ({CE}\.[0-9]+)
chaine \"[^\"]*\"
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
SAY {printf("SAY ");return mc_say;}
STEP {printf("STEP ");return mc_step;}
BY {printf("BY ");return mc_by;}
UNTIL {printf("UNTIL ");return mc_until;}
{CE} {printf("ce ");return ce;}
{CR} {printf("ce ");return cr;}
{chaine} {printf("chaine ");return chaine;}
{IDF} {if (yyleng>20) printf("erreur lexicale a ligne %d sur l entite %s\n",nb_ligne,yytext);
    else printf("idf ");return idf;}
"." {printf("pt ");return pt;}
":" {printf("dp ");return dp;}
"=" {printf("equal ");return equal;}
";" {printf("pvg ");return pvg;}
"," {printf("vg ");return vg;}
"+" {printf("plus ");return plus;}
"-" {printf("sub ");return sub;}
"/" {printf("div ");return div2;}
"*" {printf("mul ");return mul;}
">" {printf("great ");return great;}
[ \t]      ; 
\n   {printf("\n");nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%