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
	saida = fopen("saida.txt", "a");

	if (entrada == NULL) {
		puts("O arquivo de entrada não foi criado.");
		return EXIT_FAILURE;
	} else {
		// puts("Arquivo de entrada criado com sucesso.");
	}
	if (saida == NULL) {
		puts("O arquivo de saida não foi criado.");
		return EXIT_FAILURE;
	} else {
		// puts("Arquivo de saida criado com sucesso.");
	}

	int fd_entrada = fileno(entrada);
	int fd_saida = fileno(saida);

	char* chave = "LIMAO";

	int cifraFinal = cifra(fd_entrada, fd_saida, chave);
	putchar('\n');

	fclose(entrada);
	fclose(saida);
}