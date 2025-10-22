%token  mc_use bib_io bib_math
%%
S: mc_use BIB {printf("syntaxe correcte");}
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
