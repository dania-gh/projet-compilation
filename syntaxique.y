%token  dp mc_use bib_io bib_math mc_name idf mc_start mc_stop pt mc_float mc_int mc_text
%%
S: ImporterBib Header Code {printf("syntaxe correcte");}    /*boucle to run multiple bib (recursivite) */
;
ImporterBib : mc_use BIB ImporterBib      
   |
;
BIB :bib_io
   |bib_math 
;
Header : mc_name dp idf
;

Code : mc_start dp Dec mc_stop pt
;

Dec : MC idf
;

MC : mc_float
   | mc_int
   |mc_text
;


%%
main () 
{
yyparse();
}
yywrap()
{}
