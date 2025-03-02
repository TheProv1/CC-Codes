%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(const char *s);
%}

%%

[0-9]+		{yylval = atoi(yytext);		return INTEGER;}
"+"		return PLUS;
"-"		return MINUS;
"\n"		return NL;
[ \t]		;
.		yyerror("Invalid Character Sequence entered\n");

%%

int yywrap(){
	return 1;
}
