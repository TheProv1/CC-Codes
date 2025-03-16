%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
#include "y.tab.h"
%}

%%

"#include <stdio.h>"	return HEADER;
"int"			return INT;
"main"			return MAIN;
"("			return LB;
")"			return RB;
"{"			return LCB;
"}"			return RCB;
";"			return SC;
","			return COMMA;
[a-z]+			return VAR;
[ \t\n]+		;
.			yyerror("Invalid");

%%

int yywrap(){
	return 1;
}
