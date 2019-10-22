#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int cifra(int fd_entrada, int fd_saida, const char* chave);
int decifra(int fd_entrada, int fd_saida, const char* chave);

int main(int argc, char const *argv[]) {
	FILE *entrada;
	FILE *saida;

	if (argc != 4) {
		if (argc == 2) {
			if ((strncmp(argv[1], "-h", 2) == 0)) {
				printf("Use vigenere [argumento] [chave] [arquivo de entrada]\n");
				printf("[argumento]:\n\t-c Cifra o arquivo\n\t-d Decifra o arquivo\n\t-h Ajuda\n");
				printf("[chave]:\n\tA string que sera utilizada para cifrar/decifrar o arquivo.\n");
				printf("[arquivo de entrada]:\n\tO arquivo que contem a mensagem a ser cifrada/decifrada.\n");
				printf("O arquivo cifrado/decifrado vai estar em \"out.txt\".\n");
				return 0;
			}
		}
		printf("Parametros invalidos.\n");
		printf("Use vigenere -h para ajuda.\n");
		return 0;
	} else if (!((strncmp(argv[1], "-c", 2) == 0) || (strncmp(argv[1], "-d", 2) == 0) || (strncmp(argv[1], "-h", 2) == 0))) {
		printf("Argumento \"%s\" invalido.\n", argv[1]);
		printf("Use vigenere -h para ajuda.\n");
		return 0;
	}

	entrada = fopen(argv[3], "r");
	if (entrada == NULL) {
		printf("Falha ao abir arquivo de entrada. Verifique se o arquivo existe.\n");
		return 0;
	}

	saida = fopen("out.txt", "w");
	if (saida == NULL) {
		printf("Falha ao criar arquivo de saida.\n");
		return 0;
	}	

	int fd_entrada = fileno(entrada);
	int fd_saida = fileno(saida);

	const char* chave = argv[2];

	int resultado = -1;

	if (strncmp(argv[1], "-d", 2) == 0) {
		resultado = decifra(fd_entrada, fd_saida, chave);
	} else if (strncmp(argv[1], "-c", 2) == 0) {
		resultado = cifra(fd_entrada, fd_saida, chave);
	}

	if (resultado == 0) {
		puts("Sucesso!");
	} else {
		puts("Ocorreu algum problema.");
	}

	fclose(entrada);
	fclose(saida);

	return 0;
}