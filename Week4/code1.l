%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
#include "y.tab.h"
%}

%%

[0-9]+		{
		yylval = atoi(yytext);	
		return INTEGER;
		}

"+"		return PLUS;
"-"		return MINUS;
"\n"		return NL;
[ \t]		;
.		yyerror("Invalid Character or String entered");

%%

int yywrap(void){
	return 1;
}
