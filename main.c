#include <stdlib.h>
#include <stdio.h>

int cifra(int fd_entrada, int fd_saida, const char* chave);
int decifra(int fd_entrada, int fd_saida, const char* chave);

int main(void) {
	FILE *entrada;
	FILE *saida;
	char c;

	entrada = fopen("entrada.txt", "r");
	saida = fopen("saida.txt", "a");

	if (entrada == NULL) {
		puts("O arquivo de entrada não foi criado.");
		return EXIT_FAILURE;
	} else {
		puts("Arquivo de entrada criado com sucesso.");
	}
	if (saida == NULL) {
		puts("O arquivo de saida não foi criado.");
		return EXIT_FAILURE;
	} else {
		puts("Arquivo de saida criado com sucesso.");
	}

	do {
		c = getc(entrada);
		if (c != 32 && c != 10) {
			printf("%c", c);
		}
	} while (c != EOF);
	printf("\n");
}