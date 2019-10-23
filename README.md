# cifragem-de-vigenere
Objetivo: Implementar em linguagem de montagem (Assembly) da arquitetura Intel® IA-32 (“x86”) um conjunto de sub-rotinas para cifragem e decifragem de um arquivo-texto pelo método de Vigenère. 


# Ferramentas necessárias
`gcc-multilib`
`nasm`

# Como compilar
`nasm -f elf cifra.s`
`nasm -f elf decifra.s`
`gcc -m32 main.c cifra.o decifra.o -o vigenere`

# Como utilizar
Após compilado, use:
`./vigenere [argumento] [chave] [arquivo de entrada]`
Ou `./vigenere -h` para ver a ajuda.

# Como funciona
