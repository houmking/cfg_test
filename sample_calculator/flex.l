%option noyywrap
%{
	enum yytokentype{
	    NUMBER = 258,
	    ADD = 259,
	    MUL = 260,
	    OP = 261,
	    CP = 262,
	    EOL = 263,
	};
	int yylval;
%}

%%
"+"	    { return ADD; }
"*"	    { return MUL; }
"("	    { return OP; }
")"	    { return CP; }
[0-9]+	    { yylval = atoi(yytext); return NUMBER; }
\n	    { return EOL;}
[ \t]	    { /*ignore*/ }
.	    { printf("other = %s\n", yytext); }
%%
void main(){
	int tok;
	while(tok = yylex()){
		if(tok == NUMBER) printf("%d=%d\n",tok,yylval);
		else printf("%d\n",tok);
	}
}
