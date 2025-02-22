%{
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
bool oddeven(int);
bool partof(int, int[], int);
void correctness(int, bool);
%}

%%

[0-9]+    oddeven(atoi(yytext));

%%

void main() {
	yylex();
}

bool oddeven(int num) {
	bool isEven = false;

	if ((num % 2) == 0) {
		printf("%d is Even\n", num);
		isEven = true;
	} else {
		printf("%d is Odd\n", num);
	}
	correctness(num, isEven);
}

bool partof(int num, int arr[], int size) {
	for (int i = 0; i < size; i++) {
		if (num == arr[i]) {
			return true;
		}
	}
	return false;
}

void correctness(int num, bool isEven) {
	int pos = num / 10;
	int oddArr[] = {1, 3, 5, 7, 9};
	int evenArr[] = {0, 2, 4, 6, 8};

	if ((!isEven && partof(pos, evenArr, 5)) || (isEven && partof(pos, oddArr, 5))) {
		printf("The input is correct\n");
	} 
	
	else {
		printf("Input is not correct\n");
	}
}

int yywrap() {
	return 1;
}
