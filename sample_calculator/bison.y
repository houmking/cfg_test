%{
#include <stdio.h>
%}
%token NUMBER
%token ADD MUL OP CP
%token EOL
%%
cal:
   	|cal exp EOL {printf("=%d\n",$2);}
	;
exp:	factor
   	|exp ADD factor {$$=$1+$3;}
factor: term
      	|factor MUL term {$$=$1*$3;}
term:	NUMBER
    	| OP exp CP {$$=$2;}
	;
%%
void main(){
	yyparse();
}
yyerror(char *s){
	fprintf(stderr,"error:%s\n",s);
}
