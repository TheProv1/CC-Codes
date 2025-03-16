%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(const char *);
%}

%%

"#include <stdio.h>"    return HEADER;
"int"                   return INT;
"main"                  return MAIN;
"("                     return LB;
")"                     return RB;
"{"                     return LCB;
"}"                     return RCB;
";"                     return SC;
","                     return COMMA;
[a-z]+                  return VAR;
"="			return EQ;
"-"			return OP;
"+"			return OP;
"*"			return OP;
"/"			return OP;
[ \t\n]+                ;
.                       yyerror("Invalid");

%%

int yywrap(){
	return 1;
}
