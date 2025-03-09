%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(const char *);
%}

%%

[0-9]+			{yylval.int_val = atoi(yytext);		return INTEGER;}
[0-9]+"."[0-9]?		{yylval.float_val = atof(yytext);	return FLOAT;}
"+"			return PLUS;
"-"			return MINUS;
"*"			return MULTIPLY;
"/"			return DIVIDE;
"^"			return POWER;
"("			return LBRAC;
")"			return RBRAC;
"\n"			return NL;
[ \t]			;
.			yyerror("Invalid Character Sequence");

%%

int yywrap(){
	return 1;
}
