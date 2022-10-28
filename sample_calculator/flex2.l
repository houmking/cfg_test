%{
#include "bison.tab.h"
%}
%%
"+"         { return ADD; }
"*"         { return MUL; }
"("         { return OP; }
")"         { return CP; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
\n          { return EOL;}
[ \t]       { /*ignore*/ }
.           { printf("other = %s\n", yytext); }
%%

