%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
void yyerror(const char *);
int yylex(void);

double symbolTable[26];
%}

%union {
    int int_val;
    double float_val;
    char char_val; 
}

%token <int_val> INTEGER
%token <float_val> FLOAT
%token <char_val> VAR
%token LBRAC RBRAC NL ASSIGN
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right POWER NEGATE

%type <float_val> expr

%%

program:
       |	program statement NL
;

statement:
	 expr                  { printf("%lf\n", $1); }
|	VARIABLE ASSIGN expr  {
	      if ($1 >= 'a' && $1 <= 'z') { 
		 symbolTable[$1 - 'a'] = $3;
	      }
	      else{
		yyerror("invalid variable name");
		exit(1);
	      }
	   }

expr:
    INTEGER                         { $$ = (double)$1; }
	| FLOAT                           { $$ = $1; }
	| VARIABLE                        {
	    if ($1 >= 'a' && $1 <= 'z') {
		$$ = symbolTable[$1 - 'a'];
	    } else {
		yyerror("Invalid variable");
		exit(1);  // Or return YYERROR;
	    }
	  }
	| expr PLUS expr          { $$ = $1 + $3; }
	| expr MINUS expr         { $$ = $1 - $3; }
	| expr MULTIPLY expr        { $$ = $1 * $3; }
	| expr DIVIDE expr         {
	      if ($3 == 0.0) {
		yyerror("Division by zero");
		exit(1);
	      }
	      $$ = $1 / $3;
	    }
	| expr POWER expr         { $$ = pow($1, $3); }
	| MINUS expr %prec NEGATE { $$ = -$2; }
	| LBRAC expr RBRAC        { $$ = $2; }
	;

%%

void yyerror(const char *s) {
	printf("%s\n", s);
}

void main() {
    for (int i = 0; i < 26; i++) {
	symbolTable[i] = 0.0;
    }

yyparse();
}
