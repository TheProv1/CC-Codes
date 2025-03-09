%{
#include <stdio.h>
void yyerror(const char *);
#include <stdlib.h>
int yylex(void);
#include <math.h>
%}

%union{
	int int_val;
	double float_val;
}

%token <int_val> INTEGER
%token <float_val> FLOAT
%token LBRAC RBRAC NL
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right POWER NEGATE

%type <float_val> expr

%%

program:
|	program expr NL		{ printf("%lf\n", $2); }
;

expr:
INTEGER				{ $$ = (double)$1; }
|	FLOAT			{ $$ = $1; }
|	expr PLUS expr		{ $$ = $1 + $3; }
|	expr MINUS expr		{ $$ = $1 - $3; }
|	expr MULTIPLY expr	{ $$ = $1 * $3; }
|	expr DIVIDE expr	{ 
					if ($3 == 0){
						yyerror("Division by 0");
						exit(1);
					}					
					else{
						$$ = $1 / $3;
					}
				}
|	expr POWER expr		{ $$ = pow($1, $3); }
|	MINUS expr %prec NEGATE	{ $$ = -$2; }
|	LBRAC expr RBRAC	{ $$ = $2; }
;

%%

void yyerror(const char *s){
	printf("%s\n", s);
}

void main(){
	yyparse();
}
