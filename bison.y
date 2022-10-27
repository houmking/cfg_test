%{
#include <stdio.h>
%}
%token SENTENCE
%token IF ELSE
%token EOL

%%
cal:
        |cal exp EOL {printf("true\n");}
exp:    SENTENCE
        |exp exp {}
        |IF exp {}
        |IF exp ELSE exp {}
        ;
%%
void main(){
    yyparse();
}
yyerror(char *s){
    fprintf(stderr, "error:%s\n",s);
}