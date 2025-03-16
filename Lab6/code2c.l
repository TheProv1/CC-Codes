%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
#include "y.tab.h"
%}

%%

"#include <stdio.h>"		return HEADER;
"int"				return INT;
"main"				return MAIN;
"("				return LB;
")"				return RB;
"{"				return LCB;
"}"				return RCB;
";"				return SC;
","				return COMMA;
"double"			return DOUBLE;
"float"				return FLOAT;
"char"				return CHAR;
"="				return EQ;
"+"				return OP;
"-"				return OP;
"/"				return OP;
"*"				return OP;
"if"				yyerror("Keyword");
"while"				yyerror("Keyword");
"do"				yyerror("Keyword");
"for"				yyerror("Keyword");
[a-zA-Z]+"_"*[a-zA-Z0-9]*	return VAR;
[ \t\n]+			;
.				yyerror("Invalid");

%%

int yywrap(){
	return 1;
}
