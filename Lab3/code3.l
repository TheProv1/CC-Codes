%{
#include <stdio.h>
void counter();
int wordcount = 0, charcount = 0;
%}

%%

[a-zA-Z]+	counter();

%%

void main(){
	yylex();
	printf("Word Count = %d\nCharacter Count = %d", wordcount, charcount);
}

void counter(){
	if (yyleng >= 6){
		wordcount++;
		charcount += yyleng;	
		printf("Word: %s", yytext);
	}
}

int yywrap(){
	return 1;
}
