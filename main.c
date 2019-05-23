#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int cifra(int fd_entrada, int fd_saida, const char* chave);
int decifra(int fd_entrada, int fd_saida, const char* chave);

int main(void) {
	// int fd_entrada = open("entrada'.txt", O_RONLY);
	// int fd_saida = open("saida.txt", O_WONLY);
	FILE *entrada;
	FILE *saida;
	char c;

	entrada = fopen("entrada.txt", "r");
	saida = fopen("saida.txt", "w");

	if (entrada == NULL) {
		puts("O arquivo de entrada não foi criado.");
		return EXIT_FAILURE;
	}
	if (saida == NULL) {
		puts("O arquivo de saida não foi criado.");
		return EXIT_FAILURE;
	}

	int fd_entrada = fileno(entrada);
	int fd_saida = fileno(saida);

	// printf("%d %d\n", fd_entrada, fd_saida);
	char* chave = "LIMAOLIMAOLIMAOLIMAO";
	// fprintf(saida, "%s\n", chave);

	int cifraFinal = cifra(fd_entrada, fd_saida, chave);
	putchar('\n');

	fclose(entrada);
	// fclose(saida);
}