#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

typedef struct{
	char op[5];
	char arg1[20];
	char arg2[20];
	char result[20];
} Quadruple;

bool isNumber(char s[20]){

	int start_index = 0;
	
	if ((s == NULL) || (s[start_index] == '\0')) {
		return false;
	}
	
	if (s[0] == '-'){
		if (s[1] == '\0'){
			printf("Not a valid value\n");
			return false;
		}
		start_index = 1;
	}

	for (int i = start_index; s[i] != '\0'; i++){
		if (!isdigit(s[i])){
			return false;
		}
	}

	return true;
}

int main(){
	FILE *fin = fopen("quad.in", "r");
	FILE *fout = fopen("quad.s", "w");

	if (!fin || !fout){
		printf("Error opening Input or Output file(s)\n");
		exit(0);
	}

	Quadruple quads[100];
	int n = 0;
	
	while ((n < 100) && (fscanf(fin, "%s %s %s %s", quads[n].op, quads[n].arg1, quads[n].arg2, quads[n].result)) == 4){
		n++;
	}

	fprintf(fout, ".section .data\nmsg:\n");
	fprintf(fout, "\t.string \"Final result of LHS var = %%d\\n\"\n");
	fprintf(fout, "\n.section .bss\n\t.lcomm a,4\n\t.lcomm b,4\n\t.lcomm c,4\n\t.lcomm z,4\n");

	fprintf(fout, "\n.section .text\n.globl main\nmain:\n");
	fprintf(fout, "\tpushq %%rbp\n\tmovq %%rsp, %%rbp\n\n");

	for (int i = 0; i < n; i++){
		if (strcmp(quads[i].op, "=") == 0){
			if (strcmp(quads[i].arg2, "nil") == 0){
				if (isNumber(quads[i].arg1)){
					fprintf(fout, "\tmovl $%s, %s(%%rip)\n", quads[i].arg1, quads[i].result);
				}

				else if (strcmp(quads[i].arg1, "eax") == 0){
					fprintf(fout, "\tmovl %%%s, %s(%%rip)\n",quads[i].arg1, quads[i].result);
				}

				else{
					fprintf(fout, "\tmovl %s(%%rip), %%%s\n", quads[i].arg1, quads[i].result);
				}
			}

			else if (strcmp(quads[i].result, "eax") == 0){
				fprintf(fout, "\tmovl %s(%%rip), %%eax\n\n", quads[i].arg1);
				}
		}

		else if (strcmp(quads[i].op, "+") == 0)
		{
			fprintf(fout, "\taddl %s(%%rip), %%eax\n", quads[i].arg1);
		}
		
		else if (strcmp(quads[i].op, "-") == 0)
		{
			fprintf(fout, "\tsubl %s(%%rip), %%eax\n", quads[i].arg1);
		}
		
		else if (strcmp(quads[i].op, "*") == 0)
		{
			fprintf(fout, "\timul %s(%%rip), %%eax\n", quads[i].arg1);
		}
		
		else if (strcmp(quads[i].op, "/") == 0)
		{
			fprintf(fout, "\tmovl $0, %%eax\n\tdivl %s(%%rip)\n", quads[i].arg1);
		}
	}

	fprintf(fout, "\n\tmovl z(%%rip), %%esi\n\tleaq msg(%%rip), %%rdi\n\tmovl $0, %%eax\n\tcall printf");
	fprintf(fout, "\n\n\tmovl $0, %%eax\n\tpopq %%rbp\n\tret\n");

	fclose(fout);
	fclose(fin);

	printf("Assembly code generated successfully\n");

	return 0;
}
