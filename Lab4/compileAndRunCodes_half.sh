echo -e "Program Compilation\n\n"

echo -e "Program 1"
yacc -d code1.y && lex code1.l && cc lex.yy.c y.tab.c -ll -o code1

echo -e "\nProgram 2"
yacc -d code2.y && lex code2.l && cc lex.yy.c y.tab.c -ll -o code2

echo -e "\nProgram 3"
yacc -d code3.y && lex code3.l && cc lex.yy.c y.tab.c -ll -o code3

echo -e "\nProgram Execution\n"

echo -e "Program 1 - Begin"
code1 || ./code1

echo -e "Program 1- End \n\nProgram 2 - Begin"
code2 || ./code2

echo -e "Program 2 - End \n\nProgram 3 - Begin"
code3 || ./code3

echo -e "Program 3 - End \n"
echo -e "\n\nAll Complete"
