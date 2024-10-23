BITS 64

section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi				; ret = dest
	cmp rdi, 0x0				; if dest == NULL
	je .exit
	cmp rsi, 0x0				; if src == NULL
	je .exit
	xor rcx, rcx				; counter
.loop:
	mov dl, byte [rsi + rcx]	; dl is 8 lower bit of rdx 
	cmp dl, 0x0					; if src[i] = 0
	je .exit_zero
	mov byte [rdi + rcx], dl
	inc rcx
	jmp .loop
.exit_zero:
	mov byte [rdi + rcx], 0x0
	ret
.exit:
	ret

section .note.GNU-stack