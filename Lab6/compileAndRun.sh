clear

echo -e "Program Compilation\n"

yacc -d code1a.y && lex code1a.l
cc lex.yy.c y.tab.c -ll -o code1a

yacc -d code1b.y && lex code1b.l
cc lex.yy.c y.tab.c -ll -o code1b

yacc -d code1c.y && lex code1c.l
cc lex.yy.c y.tab.c -ll -o code1c

yacc -d code2a.y && lex code2a.l
cc lex.yy.c y.tab.c -ll -o code2a

yacc -d code2b.y && lex code2b.l
cc lex.yy.c y.tab.c -ll -o code2b

yacc -d code2c.y && lex code2c.l
cc lex.yy.c y.tab.c -ll -o code2c

echo -e "\nCode Execution\n"

echo -e "\n\nCode 1a\n"
echo -e "Test case 1\n"
cat code1a1.txt
./code1a < code1a1.txt || code1a < code1a1.txt

echo -e "\nTest case 2\n"
cat code1a2.txt
./code1a < code1a2.txt || code1a < code1a2.txt

echo -e "\nTest case 3\n"
cat code1a3.txt
./code1a < code1a3.txt || code1a < code1a3.txt

sleep 5

echo -e "\n\nCode 1b\n"
echo -e "Test case 1\n"
cat code1b1.txt
./code1b < code1b1.txt || code1b < code1b1.txt

echo -e "\nTest case 2\n"
cat code1b2.txt
./code1b < code1b2.txt || code1b < code1b2.txt

echo -e "\nTest case 3\n"
cat code1b3.txt
./code1b < code1b3.txt || code1b < code1b3.txt

sleep 5

echo -e "\n\nCode 1c\n"
echo -e "Test case 1\n"
cat code1c1.txt
./code1c < code1c1.txt || code1c < code1c1.txt

echo -e "\nTest case 2\n"
cat code1c2.txt
./code1c < code1c2.txt || code1c < code1c2.txt

echo -e "\nTest case 3\n"
cat code1c3.txt
./code1c < code1c3.txt || code1c < code1c3.txt

