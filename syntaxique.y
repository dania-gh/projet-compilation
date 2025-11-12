%{
int nb_ligne =1;
%}


%token  dp pt pvg vg mc_use bib_io bib_math mc_name idf mc_start mc_stop mc_float mc_int mc_text equal ce cr
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

Body : mc_start dp Dec mc_stop pt   /*accept generale form of body area (start: dec stop.)*/
;

Dec : mc_int AffecEnt pvg  Dec    /*to be able to choose on of the type of variable and declare multiple time*/
      |mc_float AffecFloat pvg Dec
      |
;

AffecEnt : AffecEnt vg idf       /*declare one or multiple entier with or without affectation*/
         |AffecEnt vg idf equal ce
         | idf
         |idf equal ce
;

AffecFloat : idf               /*declare one or multiple float with or without affectation*/
         | idf equal cr
         | AffecFloat vg idf
         | AffecFloat vg idf equal cr
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
printf("error Syntaxique a la ligne %d\n",nb_ligne); /* print error lexicale in cmd*/
}
