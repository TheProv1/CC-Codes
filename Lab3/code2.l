%{
#include <stdio.h>
int linecount = 0, charcount = 0, wordcount = 0;
%}

%%

[a-zA-Z]*	wordcount++; charcount += yyleng;
"\n"		linecount++;

%%


void main(){
	yylex();
	printf("Character Count: %d\nWord Count: %d\nLine Count: %d\n", charcount, wordcount, linecount);
}

int yywrap(){
	return 1;
}
