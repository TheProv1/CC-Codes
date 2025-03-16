%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
void yyerror(const char *);
%}

%%

"#include <stdio.h>"	return HEADER;
"int"			return INT;
"main"			return MAIN;
"{"			return LCB;
"}"			return RCB;
"("			return LB;
")"			return RB;
[ \t\n]+		;
.			printf("Invalid input");

%%

int yywrap(){
	return 1;
}
