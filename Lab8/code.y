%{	
	#include <stdio.h>
	#include <stdlib.h>
	#include <ctype.h>
	void yyerror(const char *);
	int yylex(void);

	char addtotable(char, char, char);
	void threeAdd();
	void quadruple();
	int find(char l);
	void triple();

	int index1 = 0;
	char temp = 'A' - 1;

	struct expr{
		char opd1;
		char opd2;
		char opr;
		char res;
	};
%}

%union{
	char cval;
}

%token EQ LB RB NL
%token <cval> INTEGER 
%token <cval> VAR
%left PLUS MINUS
%left MUL DIV
%type <cval> expr

%%

program:
|	VAR EQ expr NL	{addtotable((char)$1, (char)$3, '='); return $3;}
;

expr:
INTEGER	{$$ = (char)$1;}
|	VAR			{$$ = (char)$1;}
|	expr PLUS expr		{$$ = addtotable((char)$1, (char)$3, '+');}
|	expr MINUS expr		{$$ = addtotable((char)$1, (char)$3, '-');}
|	expr DIV expr		{$$ = addtotable((char)$1, (char)$3, '/');}
|	expr MUL expr		{$$ = addtotable((char)$1, (char)$3, '*');}
|	LB expr RB			{$$ = (char)$2;}
;

%%

struct expr arr[20];

void yyerror(const char *s){
	printf("%s\n", s);
	exit(0);
}

int main(){
	yyparse();

	printf("\n\t\tThree address code\n\n");
	threeAdd();

	printf("\n\t\tQuadruple\n\n");
	quadruple();

	printf("\n\t\tTriple\n\n");
	triple();

	return 0;
}

char addtotable(char a, char b, char o){
	temp++;
	arr[index1].opd1 = a;
	arr[index1].opd2 = b;
	arr[index1].opr = o;
	arr[index1].res = temp;
	index1++;
	return temp;
}

void threeAdd(){
	int i = 0;
	char temp = 'A';
	printf("Result\t\tOperand1\tOperator\tOperand2\n");
	
	while (i < index1){
		printf("%c:= \t", arr[i].res);
		printf("\t%c \t", arr[i].opd1);
		printf("\t%c \t", arr[i].opr);
		printf("\t%c \t", arr[i].opd2);
		i++;
		temp++;
		printf("\n");
	}
}

void quadruple(){
	int i = 0;
	char temp = 'A';
	printf("Operator\tOperand1\tOperand2\tResult\n");
		
	while (i < index1){
		printf("%c \t", arr[i].opr);
		printf("\t%c \t", arr[i].opd1);
		printf("\t%c \t", arr[i].opd2);
		printf("\t%c \t", arr[i].res);
		i++;
		temp++;
		printf("\n");
	}
}


int findchar(char l){
	int i;
	for (i = 0; i < index1; i++){
		if (arr[i].res == l){
		break;
		}
	}
	return i;	
}

void triple(){
	int i = 0;
	char temp = 'A';
	printf("Operator\tOperand1\t\tOperand2\n");

	while (i < index1){
		printf("%c \t", arr[i].opr);
		
		if (!isupper(arr[i].opd1)){
			printf("\t%c\t\t", arr[i].opd1);
		}
		
		else{
			printf("\tPointer");
			printf("%d\t", findchar(arr[i].opd1));
		}

		if (!isupper(arr[i].opd2)){
			printf("\t%c\t\t", arr[i].opd2);
		}
		
		else{
			printf("\tPointer");
			printf("%d\t\t", findchar(arr[i].opd2));
		}

		i++;
		temp++;
		printf("\n");
	}
}
