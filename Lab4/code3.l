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
"/"		return DIVIDE;
"\n"		return NL;
"("		return LBRAC;
")"		return RBRAC;
[ \t]		;
.		yyerror("Invalid Character Sequence");

%%

int yywrap(){
	return 1;
}
