%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *);
int yylex(void);
%}

%token INTEGER LBRAC RBRAC NL
%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

program:
|	program expr NL		{printf("%d\n", $2);}
;

expr:
INTEGER {$$ = $1;}
|	expr PLUS expr		{$$ = $1 + $3;}
|	expr MINUS expr		{$$ = $1 - $3;}
|	expr MULTIPLY expr	{$$ = $1 * $3;}
|	expr DIVIDE expr	{if ($3 == 0){
					yyerror("Division by 0");
					exit(1);
					}
				$$ = $1 / $3;
				}
|	LBRAC expr RBRAC	{$$ = $2;}
;

%%

void yyerror(const char *s){
	printf("%s\n", s);
}

void main(){
	yyparse();
}
