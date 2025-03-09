%{
#include <stdio.h>
int yylex(void);
#include <stdlib.h>
void yyerror(const char *);
#include <math.h>
%}

%token INTEGER LBRAC RBRAC NL
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right NEGATE POWER

%%

program:
|	program expr NL		{printf("%d\n", $2);}
;

expr:
INTEGER { $$ = $1; }
|	expr PLUS expr		{$$ = $1 + $3;}
|	expr MINUS expr		{$$ = $1 - $3;}
|	expr MULTIPLY expr	{$$ = $1 * $3;}
|	expr DIVIDE expr	{
					if ($3 == 0){
						yyerror("Division by 0");
						exit(1);
					}
					$$ = $1 / $3;
				}
|	MINUS expr %prec NEGATE	{$$ = -$2;} 
|	expr POWER expr		{
					if ($3 < 0 || ($1 == 0 && $3 < 0)){
						yyerror("0^(-ve number) is not defined");
						exit(1);
					}
					$$ = pow($1, $3);
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
