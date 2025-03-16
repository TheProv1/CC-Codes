%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yylex(void);
%}

%token HEADER INT MAIN LB RB LCB RCB

%%

PGM: HEADER INT MAIN LB RB LCB RCB	{ printf("Program Template successfully parsed\n"); }
;

%%

void yyerror(const char *s){
	printf("%s\n", s);
}

void main(){
	yyparse();
//	return 0;
}
