%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
void yyerror(const char *);
%}

%%
[0-9]+                          { yylval.int_val = atoi(yytext); return INTEGER; }
[0-9]+"."[0-9]+                 { yylval.float_val = atof(yytext); return FLOAT; }
[a-z]                           { yylval.char_val = yytext[0]; return VARIABLE; }
"="                             { return ASSIGN; }
"+"                             { return PLUS; }
"-"                             { return MINUS; }
"*"                             { return MULTIPLY; }
"/"                             { return DIVIDE; }
"^"                             { return POWER; }
"("                             { return LBRAC; }
")"                             { return RBRAC; }
"\n"                            { return NL; }
[ \t]                           ;
.                               { yyerror("Invalid character"); }

%%
int yywrap() {
    return 1;
}
