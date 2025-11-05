%token  dp mc_use bib_io bib_math mc_name idf 
%%
S: ImporterBib Header {printf("syntaxe correcte");}    /*boucle to run multiple bib (recursivite) */
;
ImporterBib : mc_use BIB ImporterBib      
   |
;
BIB :bib_io
   |bib_math 
;
Header : mc_name dp idf
;
%%
main () 
{
yyparse();
}
yywrap()
{}
