%{
#include "bison.tab.h"
%}

%%
"if"        { return IF; }
"else"      { return ELSE; }
[a-zA-Z]+   { yylval = yytext; return SENTENCE; }
\n          { return EOL; }
[ \t]       { /*ignore*/ }
.           { printf("other = $s\n", yytext); }
%%

