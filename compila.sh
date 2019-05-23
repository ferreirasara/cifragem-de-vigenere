clear
nasm -f elf cifra.s
nasm -f elf decifra.s
gcc -m32 main.c cifra.o decifra.o
./a.out

