%option noyywrap
%{
    enum yytokentype{
        SENTENCE = 258,
        IF = 259,
        ELSE = 260,
        EOL = 261,
    };
    char *yylval;
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
[a-zA-Z]+   { yylval = yytext; return SENTENCE; }
\n          { return EOL; }
[ \t]       { /*ignore*/ }
.           { printf("other = $s\n", yytext); }
%%
void main(){
    int tok;

    while ( tok = yylex()){
        if ( tok == SENTENCE)
            printf("%d = %s \n",tok,yylval);
        else
            printf("%d\n",tok);
    }
}
