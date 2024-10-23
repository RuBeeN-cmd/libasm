BITS 64

section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax
	cmp rdi, 0x0				; if s1 == NULL
	je .check_rsi
	cmp rsi, 0x0
	je .ret_rdi
	xor rcx, rcx				; i = 0
.loop:
	mov dl, byte [rsi + rcx]
	cmp dl, byte [rdi + rcx]
	jne .ret

	cmp dl, 0x0
	je .ret

	inc rcx
	jmp .loop
.ret:
	mov al, byte [rdi + rcx]
	movzx r8, byte [rsi + rcx]
	sub rax, r8
.exit:
	ret

.ret_rdi:
	mov al, byte [rdi]
	jmp .exit
.check_rsi:
	cmp rsi, 0x0				; if s2 == NULL
	je .exit
	movzx rax, byte [rsi]
	neg rax
	jmp .exit	


section .note.GNU-stack