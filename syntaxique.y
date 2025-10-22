%token  mc_use bib_io bib_math
%%
S: ImporterBib {printf("syntaxe correcte");}    /*boucle to run multiple bib (recursivite) */
;
ImporterBib : mc_use BIB ImporterBib      
   |
;
BIB :bib_io
   |bib_math ;
%%
main () 
{
yyparse();
}
yywrap()
{}
