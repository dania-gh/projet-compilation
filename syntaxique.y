%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(char* msg);
int nb_ligne = 1;
int oprNumber;
char suavType[20];
%}

%union {
    int entier;
    float reel;
    char* str;
}
%type <reel> Expression Operation valeur


%token <str> idf chaine mc_float mc_int mc_text
%token <entier> ce
%token <reel> cr

%token dp pt pvg vg mc_use bib_io bib_math mc_name mc_start mc_stop equal
%token mc_say mc_step mc_by mc_until acc_fer acc_ouv not_equal equal_less equal_great less
%token great signe_chaine signe_int signe_reel mc_hear Commentaire plus sub mul div2
%%
S: ImporterBib Header Body {printf(" syntaxe correcte");}    /*boucle to run multiple bib (recursivite) */
;
ImporterBib : mc_use BIB ImporterBib   /*declare bib en boucle*/   
   |
;
BIB :bib_io    /*to be able to choose between multiple bib */
   |bib_math 
;
Header : mc_name dp idf    /*to be able to accept Name : nameOfProgramme*/
;

Body : mc_start dp listDecsInst mc_stop pt   /*accept generale form of body area (start: dec stop.)*/
;

listDecsInst : Dec listDecsInst
            |ListInst listDecsInst
            |InstAffec listDecsInst
            |Commentaire listDecsInst
            |

;


ListInst : Inst_Say
          | Inst_Loop
          |Inst_Hear
;

Inst_Hear : mc_hear Signe vg idf pvg
;

Signe : signe_chaine | signe_int | signe_reel 
;

Inst_Say : mc_say chaine Variable pvg 
;

Variable :vg idf
         |

Inst_Loop : mc_step idf mc_by Expression  mc_until Condition_loop acc_ouv listDecsInst acc_fer pvg
;

Condition_loop : idf comparaision ce;

comparaision : great|less|equal|equal_great|equal_less|not_equal;
 

InstAffec : idf equal Expression pvg
;

Expression
    : valeur                  { $$ = $1; }
    | idf                     { $$ = 0; }                  
    | Operation               { $$ = $1; }
;


Operation : Operation op Operation {
            if (oprNumber == 3)  {     /* division */
                if ($3 == 0) {
                    printf("erreur : division par zero a la ligne %d\n", nb_ligne);
                    YYERROR;   /*reject the expression */
                }
                $$ = $1 / $3;
            } }
         |idf
         |valeur { $$ = $1; }
;

op : plus {oprNumber=1}
      | mul {oprNumber=2}
      | div2  {oprNumber=3}
      | sub {oprNumber=4}
;



Dec : Type ListDec pvg  Dec 
      |Type ListDec pvg
;

Type : mc_float {strcpy(suavType,$1); }
      |mc_int     {strcpy(suavType,$1); }
      |mc_text    {strcpy(suavType,$1); }

ListDec : ListDec vg idf       { if (doubleDeclaration($3)==0) insererType($3,suavType);
                        else printf("erreur Semantique: double declation de %s, a la ligne %d\n", $3, nb_ligne); }
         |ListDec vg idf equal valeur { if (doubleDeclaration($3)==0) insererType($3,suavType);
                        else printf("erreur Semantique: double declation de %s, a la ligne %d\n", $3, nb_ligne); }
         |idf     { if ( doubleDeclaration($1)==0)insererType($1,suavType);
                  else printf("erreur Semantique: double declation de %s, a la ligne %d\n", $1, nb_ligne);}
         |idf equal valeur    { if ( doubleDeclaration($1)==0)insererType($1,suavType);
                  else printf("erreur Semantique: double declation de %s, a la ligne %d\n", $1, nb_ligne);}
;

valeur : cr { $$ = $1; }
        |ce { $$ = $1; }
        |chaine
;




%%
main () 
{
/*printf("C'est le compilateur de langague IA2025\n");   to print any msg we want*/
yyparse();
afficher();
}
yywrap()
{}
yyerror(char*msg)
{
printf("error syntaxique a la ligne %d\n",nb_ligne); /* print error lexicale in cmd*/
}
