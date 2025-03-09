echo -e "Program Compilation\n\n"

echo -e "\nProgram 4"
yacc -d code4.y && lex code4.l && cc lex.yy.c y.tab.c -ll -lm -o code4

echo -e "\nProgram 5"
yacc -d code5.y && lex code5.l && cc lex.yy.c y.tab.c -ll -lm -o code5

echo -e "\nProgram 6"
yacc -d code6.y && lex code6.l && cc lex.yy.c y.tab.c -ll -lm -o code6

echo -e "\nProgram Execution\n"

echo -e "\nProgram 4 - Begin"
code4 || ./code4

echo -e "Program 4 - End \n\nProgram 5 - Begin"
code5 || ./code5

echo -e "Program 5 - End \n\nProgram 6 - Begin"
code6 || ./code6

echo -e "\n\nAll Complete"
