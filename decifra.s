section .text
	global decifra

decifra:
	push 	ebp
	mov 	ebp, esp

	push 	ebx
	push 	esi
	push 	edi

	mov 	eax, dword[ebp + 16]	; char* chave
	mov 	ebx, dword[ebp + 12]	; int fd_saida
	mov 	ecx, dword[ebp + 8]		; int fd_entrada

	