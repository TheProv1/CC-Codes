%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(const char *);
%}

%%

[0-9]+		{yylval = atoi(yytext);		return INTEGER;}
"+"		return PLUS;
"-"		return MINUS;
"*"		return MULTIPLY;
[\^]		return POWER;
"/"		return DIVIDE;
"("		return LBRAC;
")"		return RBRAC;
"\n"		return NL;

[ \t]		;
.		yyerror("Invalid Input Sequence");

%%

int yywrap(){
	return 1;
}
