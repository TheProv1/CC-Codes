%{
#include <stdio.h>
%}

%%

[0-9]+		printf("Number\n");
"+"		printf("Operator '-'\n");
"*"		printf("Operator '*'\n");
"/"		printf("Operator '/'\n");
"-"		printf("Operator '-'\n");
"|"		printf("Operator '|'\n");
"\n"		printf("Newline\n");
.		printf("Mystery Character\n");

%%

void main(){
	yylex();
}

int yywrap(){
	return 1;
}
