%{
int nb_ligne =1;
%}
%token  dp pt pvg vg mc_use bib_io bib_math mc_name idf mc_start mc_stop mc_float mc_int mc_text equal ce cr chaine mc_say plus sub mul div2 great mc_step mc_by mc_until acc_fer acc_ouv 
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
            |Affec listDecsInst
            |Dec 
            |ListInst 
            |Affec
;


ListInst : Inst_Say
          | Inst_Loop
;

Inst_Say : mc_say chaine pvg 
;

Inst_Loop : mc_step idf mc_by Expression  mc_until idf great ce acc_ouv listDecsInst acc_fer pvg
;

 

Affec : idf equal Expression pvg
;

Expression : valeur
           |Operation
           |idf
;

Operation : Operation op Operation
         |idf
         |valeur
;

op : plus | mul | div2 | sub 
;



Dec : Type ListDec pvg  Dec
      |
;

Type : mc_float
      | mc_int
      |mc_text

ListDec : ListDec vg idf       /*declare one or multiple entier with or without affectation*/
         |ListDec vg idf equal valeur
         |idf
         |idf equal valeur
;

valeur : cr
        | ce
        |chaine
;




%%
main () 
{
/*printf("C'est le compilateur de langague IA2025\n");   to print any msg we want*/
yyparse();
}
yywrap()
{}
yyerror(char*msg)
{
printf("error syntaxique a la ligne %d\n",nb_ligne); /* print error lexicale in cmd*/
}
