clear
nasm -f elf cifra.s
gcc -m32 main.c cifra.o
./a.out
