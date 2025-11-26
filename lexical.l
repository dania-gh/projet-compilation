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
cmnt \-\-[^\-]*\-\-
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
HEAR {printf("HEAR ");return mc_hear;}
\"%f\" {printf("signe_reel ");return signe_reel;}
\"%d\" {printf("signe_int ");return signe_int;}
\"%s\" {printf("signe_chaine ");return signe_chaine;}
{CE} {printf("ce ");return ce;}
{CR} {printf("ce ");return cr;}
{chaine} {printf("chaine ");return chaine;}
{cmnt} {printf("Commentaire ");return Commentaire;}
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
\{ {printf("acc_ouv ");return acc_ouv;}
\} {printf("acc_fer ");return acc_fer;}
"<" {printf("less ");return less;}
">=" {printf("equal_great ");return equal_great;}
"<=" {printf("equal_less ");return equal_less;}
"!=" {printf("not_equal ");return not_equal;}
[ \t]      ; 
\n   {printf("\n");nb_ligne++; }
. printf("erreur lexicale la ligne %d \n",nb_ligne) ;
%%