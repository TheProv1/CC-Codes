%{
	#include <stdio.h>
	void yyerror(const char *);
	#include "y.tab.h"
%}

%%

[0-9]+		{yylval.cval = (char)(yytext[0]);	return INTEGER;}
[a-z]+		{yylval.cval = (char)(yytext[0]);	return VAR;}
"+"		return PLUS;
"-"		return MINUS;
"/"		return DIV;
"*"		return MUL;
"="		return EQ;
"("		return LB;
")"		return RB;
"\n"		return NL;
[ \t]		;
.		yyerror("Invalid character(s)");

%%

int yywrap(){
	return 1;
}
