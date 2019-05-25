#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int cifra(int fd_entrada, int fd_saida, const char* chave);
int decifra(int fd_entrada, int fd_saida, const char* chave);

int main(void) {
	// int fd_entrada = open("entrada'.txt", O_RONLY);
	// int fd_saida = open("saida.txt", O_WONLY);
	FILE *entrada_cifra;
	FILE *saida_cifra;
	FILE *entrada_decifra;
	FILE *saida_decifra;
	char c;

	entrada_cifra = fopen("entrada_cifra.txt", "r");
	saida_cifra = fopen("saida_cifra.txt", "w");

	entrada_decifra = fopen("entrada_decifra.txt", "r");
	saida_decifra = fopen("saida_decifra.txt", "w");

	if (entrada_cifra == NULL) {
		puts("Erro no arquivo de entrada da cifra.\n");
		return EXIT_FAILURE;
	}
	if (entrada_decifra == NULL) {
		puts("Erro no arquivo de entrada da decifra.\n");
		return EXIT_FAILURE;
	}

	if (saida_cifra == NULL) {
		puts("Erro no arquivo de saida da cifra.\n");
		return EXIT_FAILURE;
	}

	if (saida_decifra == NULL) {
		puts("Erro no arquivo de saida da decifra.\n");
		return EXIT_FAILURE;
	}

	int fd_entrada_cifra = fileno(entrada_cifra);
	int fd_saida_cifra = fileno(saida_cifra);

	int fd_entrada_decifra = fileno(entrada_decifra);
	int fd_saida_decifra = fileno(saida_decifra);

	// printf("%d %d\n", fd_entrada, fd_saida);
	char* chave = "LIMAO";
	// fprintf(saida, "%s\n", chave);

	int cifraFinal = cifra(fd_entrada_cifra, fd_saida_cifra, chave);
	// putchar('\n');
	int decifraFinal = decifra(fd_entrada_decifra, fd_saida_decifra, chave);

	fclose(entrada_cifra);
	fclose(saida_cifra);
	fclose(entrada_decifra);
	fclose(saida_decifra);

	if (cifraFinal == 0) {
		puts("Cifragem com sucesso!");
	} else {
		puts("Algo deu errado na cifragem");
	}
	if (decifraFinal == 0) {
		puts("Decifragem com sucesso!");
	} else {
		puts("Algo deu errado na decifragem");
	}
}