yacc -d project.y
lex project.l
cc y.tab.c lex.yy.c -ll -lm -o project

echo -e "\nRunning test-cases"

echo -e "\n\t\tInput 1.c\n"
cat input1.c
echo -e "\n"
./project < input1.c

echo -e "\n\t\tInput 2.c\n"
cat input2.c
echo -e "\n"
./project < input2.c

echo -e "\n\t\tInput 3.c\n"
cat input3.c
echo -e "\n"
./project < input3.c

echo -e "\n\t\tInput 4.c\n"
cat input4.c
echo -e "\n"
./project < input4.c

echo -e "\n\t\tInput 5.c\n"
cat input5.c
echo -e "\n"
./project < input5.c

echo -e "\n\t\tInput 6.c\n"
cat input6.c
echo -e "\n"
./project < input6.c

echo -e "\n\t\tInput 7.c\n"
cat input7.c
echo -e "\n"
./project < input7.c


