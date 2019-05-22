section .text
	global main
	extern printf

main:
	mov 	eax, 18
	mov 	ebx, 5
	xor 	edx, edx
	div 	ebx
	push 	edx
	push 	str_c
	call 	printf
	add 	esp, 8

section .data
	str_c 	db '%d'

section .bss
