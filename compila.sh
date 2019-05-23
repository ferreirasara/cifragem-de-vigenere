clear
nasm -f elf decifra.s
gcc -m32 main.c decifra.o
./a.out

