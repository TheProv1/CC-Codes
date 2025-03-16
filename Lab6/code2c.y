%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yylex(void);
%}

%token HEADER INT FLOAT CHAR DOUBLE MAIN LB RB LCB VAR COMMA OP EQ SC RCB
%left OP

%%

PGM:    HEADER INT MAIN LB RB LCB BODY RCB      {printf("Program Template Parsed Successfully");}
;

BODY:   DECL_STMTS PROG_STMTS
;

DECL_STMTS:     DECL_STMT DECL_STMTS
|               DECL_STMT
;

PROG_STMTS:     PROG_STMT PROG_STMTS
|               PROG_STMT
;

DECL_STMT:      DT VAR_LIST SC
;

DT:		INT
|		CHAR
|		DOUBLE
|		FLOAT
;

VAR_LIST:       VAR COMMA VAR_LIST
|               VAR
;

PROG_STMT:      VAR EQ A_EXPN SC
;

A_EXPN: A_EXPN OP A_EXPN
|       LB A_EXPN RB
|       VAR
;

%%

void yyerror(const char *s){
        printf("%s\n", s);
}


void main(){
        yyparse();
}
