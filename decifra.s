section .text
	global decifra
	extern printf

%macro imprime 1
	push 	%1
	push 	str_c
	call 	printf
	add 	esp, 8
%endmacro


%macro LETRA2NUM 2 		 			; macro que traduz a letra para um numero (de 0 a 25)
	cmp		%1, 'A' 				; %1 tem a letra
	mov 	%2, 0
	je 		le_chave	
	cmp 	%1, 'B'	
	mov 	%2, 1
	je 		le_chave	
	cmp 	%1, 'C'	
	mov 	%2, 2
	je 		le_chave	
	cmp 	%1, 'D'	
	mov 	%2, 3
	je 		le_chave	
	cmp 	%1, 'E'	
	mov 	%2, 4
	je 		le_chave	
	cmp 	%1, 'F'	
	mov 	%2, 5
	je 		le_chave	
	cmp 	%1, 'G'	
	mov 	%2, 6
	je 		le_chave	
	cmp 	%1, 'H'	
	mov 	%2, 7
	je 		le_chave	
	cmp 	%1, 'I'	
	mov 	%2, 8
	je 		le_chave	
	cmp 	%1, 'J'	
	mov 	%2, 9
	je 		le_chave	
	cmp 	%1, 'K'
	mov 	%2, 10
	je 		le_chave	
	cmp 	%1, 'L'
	mov 	%2, 11
	je 		le_chave	
	cmp 	%1, 'M'
	mov 	%2, 12
	je 		le_chave	
	cmp 	%1, 'N'
	mov 	%2, 13
	je 		le_chave	
	cmp 	%1, 'O'
	mov 	%2, 14
	je 		le_chave	
	cmp 	%1, 'P'
	mov 	%2, 15
	je 		le_chave
	cmp 	%1, 'Q'
	mov 	%2, 16
	je 		le_chave	
	cmp 	%1, 'R'
	mov 	%2, 17
	je 		le_chave	
	cmp 	%1, 'S'
	mov 	%2, 18
	je 		le_chave	
	cmp 	%1, 'T'
	mov 	%2, 19
	je 		le_chave	
	cmp 	%1, 'U'
	mov 	%2, 20
	je 		le_chave	
	cmp 	%1, 'V'
	mov 	%2, 21
	je 		le_chave	
	cmp 	%1, 'W'
	mov 	%2, 22
	je 		le_chave	
	cmp 	%1, 'X'
	mov 	%2, 23
	je 		le_chave	
	cmp 	%1, 'Y'
	mov 	%2, 24
	je 		le_chave	
	cmp 	%1, 'Z'	
	mov 	%2, 25
	je 		le_chave	
%endmacro
%macro CHAVE2NUM 2 		 			; macro que traduz a chave para um numero (de 0 a 25)
	cmp		%1, 'A' 				; %1 tem a letra
	mov 	%2, 0
	je 		desfaz_cifra	
	cmp 	%1, 'B'	
	mov 	%2, 1
	je 		desfaz_cifra	
	cmp 	%1, 'C'	
	mov 	%2, 2
	je 		desfaz_cifra	
	cmp 	%1, 'D'	
	mov 	%2, 3
	je 		desfaz_cifra	
	cmp 	%1, 'E'	
	mov 	%2, 4
	je 		desfaz_cifra	
	cmp 	%1, 'F'	
	mov 	%2, 5
	je 		desfaz_cifra	
	cmp 	%1, 'G'	
	mov 	%2, 6
	je 		desfaz_cifra	
	cmp 	%1, 'H'	
	mov 	%2, 7
	je 		desfaz_cifra	
	cmp 	%1, 'I'	
	mov 	%2, 8
	je 		desfaz_cifra	
	cmp 	%1, 'J'	
	mov 	%2, 9
	je 		desfaz_cifra	
	cmp 	%1, 'K'
	mov 	%2, 10
	je 		desfaz_cifra	
	cmp 	%1, 'L'
	mov 	%2, 11
	je 		desfaz_cifra	
	cmp 	%1, 'M'
	mov 	%2, 12
	je 		desfaz_cifra	
	cmp 	%1, 'N'
	mov 	%2, 13
	je 		desfaz_cifra	
	cmp 	%1, 'O'
	mov 	%2, 14
	je 		desfaz_cifra	
	cmp 	%1, 'P'
	mov 	%2, 15
	je 		desfaz_cifra
	cmp 	%1, 'Q'
	mov 	%2, 16
	je 		desfaz_cifra	
	cmp 	%1, 'R'
	mov 	%2, 17
	je 		desfaz_cifra	
	cmp 	%1, 'S'
	mov 	%2, 18
	je 		desfaz_cifra	
	cmp 	%1, 'T'
	mov 	%2, 19
	je 		desfaz_cifra	
	cmp 	%1, 'U'
	mov 	%2, 20
	je 		desfaz_cifra	
	cmp 	%1, 'V'
	mov 	%2, 21
	je 		desfaz_cifra	
	cmp 	%1, 'W'
	mov 	%2, 22
	je 		desfaz_cifra	
	cmp 	%1, 'X'
	mov 	%2, 23
	je 		desfaz_cifra	
	cmp 	%1, 'Y'
	mov 	%2, 24
	je 		desfaz_cifra	
	cmp 	%1, 'Z'	
	mov 	%2, 25
	je 		desfaz_cifra	
%endmacro

decifra:
	push 	ebp
	mov 	ebp, esp

	push 	ebx
	push 	esi
	push 	edi

	mov 	edi, -1				; para percorrer a cheave

	;mov 	esi, dword[ebp + 16]	; char* chave
	;mov 	edx, dword[ebp + 12]	; int fd_saida

le_arquivo:
	mov 	eax, 3 					; sys_read
	mov 	ebx, dword[ebp + 8]		; int fd_entrada
	mov 	ecx, letra				; char c;
	mov 	edx, 1					; tamanho (um caractere por vez)
	int 	80h						; chama o kernel

	cmp 	dword[letra], '0'		; nao sei como compara com EOF, ai precisa ter um '0' no final do arquivo
	je 		termina 				; se encontra o zero, sai da sub-rotina
	; imprime dword[letra]
	; cmp 	dword[c], ' '     		; se e um espaco em branco, escreve no arquivo sem fazer cifragem
	; je 		escreve_arquivo
	LETRA2NUM 	dword[letra], dword[num_letra]

le_chave:
	inc 	edi 					; incrementa para o proximo caractere
	mov 	edx, [ebp + 16]			; endereco inicial da chave
	mov 	bl, byte[edx + edi]		; caractere da vez
	mov 	byte[chave], bl			; move o caractere pra variavel chave
	cmp 	byte[chave], 0 			; terminador nulo?
	je 		zera_edi 				; se a chave acabou, zera o edi e volta para o comeco da mesma
	; imprime dword[chave]
	CHAVE2NUM 	byte[chave], dword[num_chave]
	; jmp 	faz_cifra 				; usa o cactere atual na cifragem

zera_edi:
	mov 	edi, -1					; percorre a chave
	jmp 	le_arquivo
desfaz_cifra:
	; --------------------------------------------------------------------------
	; FORMULA PARA DECIFRAR Letra = Cifra - Chave + 26 (mod 26)
	; --------------------------------------------------------------------------
	mov 	eax, dword[num_letra]	; coloca em eax o numero correpondente a letra
	mov 	ebx, dword[num_chave]	; coloca em eax o numero correpondente a chave'
	mov 	ecx, 26 				; coloca 26 em eax para obter o modulo

	xor 	edx, edx				; zera edx para fazer a divisao

	sub 	eax, ebx				; eax -= ebx
	add 	eax, 26
	div 	ecx						; eax / ecx

	add 	edx, 65					; soma 65 ao resto da divisao para obter o cod ascii

	mov 	dword[cifra_pnt], edx   ; edx tem o CONTEUDO, a sys_call precisa de um ponteiro
	; imprime 	edx

escreve_arquivo:
	mov 	eax, 4					; sys_write
	; mov 	ebx, 1 					; std out (para teste)
	mov 	ebx, dword[ebp + 12] 	; fd_saida
	mov 	ecx, cifra_pnt 			; ponteiro para a letra cifrada
	mov 	edx, 1 					; tamanho do que sera escrito (1 byte)
	int 	80h						; kernel

	jmp 	le_arquivo 				; faz todo o processo novamente

termina:
	pop     edi 					; retira da pilha os registradores que foram "salvos" no comeco da sub-rotina
	pop     esi
    pop     ebx

    mov     esp, ebp				
    pop     ebp

section .bss
	letra 		resd 1 				; ira guardar o caractere da vez do arquivo
	chave 		resb 1				; ira guardar o caractere da vez da chave'
	num_chave	resd 1				; ira guardar o num correpondente a chave
	num_letra 	resd 1				; ira guardar o num correpondente a letra
	cifra_pnt	resd 1 				; PONTEIRO para a letra cifrada

section .data
	str_c	db '[%c]'