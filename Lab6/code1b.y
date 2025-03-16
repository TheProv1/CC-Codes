%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yylex(void);
%}

%token HEADER INT MAIN LB RB LCB VAR COMMA SC RCB

%%

PGM:	HEADER INT MAIN LB RB LCB BODY RCB	{printf("Program Template Parsed Successfully");}
;

BODY:	DECL_STMTS
;

DECL_STMTS:	DECL_STMT DECL_STMTS
|		DECL_STMT
;


DECL_STMT:	INT VAR_LIST SC
;

VAR_LIST:	VAR COMMA VAR_LIST
|		VAR
;

%%

void yyerror(const char *s){
	printf("%s\n", s);
}

void main(){
	yyparse();
}
