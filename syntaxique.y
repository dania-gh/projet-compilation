%token  dp mc_use bib_io bib_math mc_name idf mc_start mc_stop pt
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

Code : mc_start dp mc_stop pt
;

%%
main () 
{
yyparse();
}
yywrap()
{}
