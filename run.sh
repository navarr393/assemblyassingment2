
#David Navarro
#CPSC240-1 
#Bash file to compile and link all files from "Quadratic Formula program"


echo "Bash script has started"

rm *.out    # Remove other helper files.
rm *.o
rm *.lis

echo "Assembling Quadratic.asm"

    # Assemble x86 module.
nasm -f elf64 -l Quadratic.lis -o Quadratic.o Quadratic.asm

echo "Compiling isfloat.cpp"
gcc -c -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17

echo "Compiling quadlibrary.cpp"
gcc -c -Wall -m64 -no-pie -o quadlibrary.o quadlibrary.cpp -std=c++17

echo "Compiling second_degree.c"
    # Compile C module.
gcc -c -Wall -m64 -no-pie -o Second_degree.o Second_degree.c -std=c11

echo "Linking the object files"

    # Link object files.
g++ -m64 -no-pie -o executable.out -std=c11 Quadratic.o quadlibrary.o Second_degree.o isfloat.o 

echo "Running the program"
./executable.out

echo "The bash script file will terminate"