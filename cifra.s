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
	mov 	esi, 0 					; percorre o arquivo

zera_edi:
	mov 	edi, 0					; percorre a chave

le_chave:
	mov 	ebx, dword[ebp + 16] 	; endereco incial da chave
	cmp 	dword[ebx], 0

le_arquivo:
	mov 	eax, 3 					; sys_read
	mov 	ebx, dword[ebp + 8]		; int fd_entrada
	mov 	ecx, c					; char c;
	mov 	edx, 1					; tamanho
	int 	80h						; kernel

	cmp 	dword[c], '0'			; terminador nulo?
	je 		termina
	jne 	imprime


imprime:
	push 	dword[c]
	push 	str_c
	call 	printf
	add 	esp, 8
	jmp 	le_arquivo

termina:
	push 	dword[ebp + 16]
	push 	str_s
	call 	printf
	add 	esp, 8

	pop     edi
	pop     esi
    pop     ebx

    mov     esp, ebp
    pop     ebp

section .bss
	c: 		resd 1

section .data
	str_s 	db ' %s'
	str_c	db '%c'