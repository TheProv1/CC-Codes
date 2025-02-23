lex code1.l && cc lex.yy.c -ll -o code1 
lex code2.l && cc lex.yy.c -ll -o code2 
lex code3.l && cc lex.yy.c -ll -o code3 
lex code4.l && cc lex.yy.c -ll -o code4 

echo "Code 1: Begin"
./code1 || code1
echo "Code 1: End"

echo "Code 2: Begin"
./code2 || code2
echo "Code 2: End"

echo "Code 3: Begin"
./code3 || code3
echo "Code 3: End"

echo "Code 4: Begin"
./code4 || code4
echo "Code 4: End"
