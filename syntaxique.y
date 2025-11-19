%{
int nb_ligne =1;
%}


%token  dp pt pvg vg mc_use bib_io bib_math mc_name idf mc_start mc_stop mc_float mc_int mc_text equal ce cr chaine mc_say
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
            |Inst listDecsInst
            |Affec listDecsInst
            |Dec 
            |Inst 
            |Affec
;


Inst : mc_say chaine pvg 
;

Affec : idf equal Expression pvg
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
         |idf equal valer
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
