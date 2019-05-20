section .text
	global cifra
	extern printf

cifra:
	push 	ebp
	mov 	ebp, esp

	push 	ebx
	push 	esi
	push 	edi

	;mov 	esi, dword[ebp + 16]	; char* chave
	;mov 	edx, dword[ebp + 12]	; int fd_saida
	mov 	esi, 0 					; percorre o arquivo (nunca vai ser zerado)

zera_edi:
	mov 	edi, 0					; percorre a chave
	jmp 	le_arquivo

le_chave:
	mov 	edx, dword[ebp + 16]	; endereco inicial da chave
	mov 	ebx, dword[edx + edi]	; caractere da vez
	mov 	dword[chave], ebx		; move o caractere pra variavel chave
	cmp 	dword[chave], 0 		; terminador nulo?
	je 		zera_edi 				; se a chave acabou, zera o edi e volta para o comeco da mesma
	inc 	edi						; incrementa para pegar o proximo caractere
	jmp 	faz_cifra 				; usa o cactere atual na cifragem

le_arquivo:
	push 	edx 					; salva o endereco inicial da chave

	mov 	eax, 3 					; sys_read
	mov 	ebx, dword[ebp + 8]		; int fd_entrada
	mov 	ecx, c					; char c;
	mov 	edx, 1					; tamanho (um caractere por vez)
	int 	80h						; chama o kernel


	cmp 	dword[c], '0'			; nao sei como compara com EOF, ai precisa ter um '0' no final do arquivo
	je 		termina 				; se encontra o zero, sai da sub-rotina

	; cmp 	dword[c], ' '     		; se e um espaco em branco, escreve no arquivo sem fazer cifragem
	; je 		escreve_arquivo

	pop 	edx 					; volta para edx o enredero inicial da chave
	jmp 	le_chave



faz_cifra:
	;add 	dword[c], 1 			; funciona isso de somar um número com o cod ascii :)
	mov 	eax, 0
	add 	eax, dword[chave]
	mov 	ebx, 0
	add 	ebx, dword[c]

	add   	eax, ebx

	; push 	eax
	; push 	str_c
	; call 	printf
	; add 	esp, 8


	xor 	edx, edx
	mov 	ebx, 26 				; para fazer o % 26
	div 	ebx
	
	add 	edx, 65
	
	push 	edx
	push 	str_c
	call 	printf
	add 	esp, 8

	jmp 	le_arquivo

; escreve_arquivo:
; 	jmp 	le_arquivo

termina:
	pop     edi
	pop     esi
    pop     ebx

    mov     esp, ebp
    pop     ebp

section .bss
	c: 		resd 1
	chave 	resd 1

section .data
	str_c	db '[%c]'