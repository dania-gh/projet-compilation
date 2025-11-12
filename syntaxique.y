%token  dp pt pvg mc_use bib_io bib_math mc_name idf mc_start mc_stop mc_float mc_int mc_text equal ce cr
%%
S: ImporterBib Header Code {printf(" syntaxe correcte");}    /*boucle to run multiple bib (recursivite) */
;
ImporterBib : mc_use BIB ImporterBib   /*declare bib en boucle*/   
   |
;
BIB :bib_io    /*to be able to choose between multiple bib */
   |bib_math 
;
Header : mc_name dp idf    /*to be able to accept Name : nameOfProgramme*/
;

Code : mc_start dp Dec mc_stop pt   /*accept generale form of code area (start: code stop.)*/
;

Dec : mc_int idf equal ce      /*to be able to choose on of the type of variable*/
      |mc_float idf equal cr
      |mc_text idf equal ce 
;



%%
main () 
{
yyparse();
}
yywrap()
{}
