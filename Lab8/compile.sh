yacc -d code.y
lex code.l

cc y.tab.c lex.yy.c -ll -o pgmout


echo -e "Running\n"

./pgmout || pgmout
