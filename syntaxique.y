%token  cst pvg aff idf
%%
S: idf aff cst pvg S{printf("syntaxe correcte");          	            YYACCEPT;}
   |idf aff cst pvg
   ;
%%
main () 
{
yyparse();
}
yywrap()
{}
