BITS 64

section .text
	global ft_strdup
	extern malloc
	extern ft_strlen
	extern ft_strcpy


ft_strdup:
	xor rax, rax
	cmp rdi, 0x0
	je .exit
	push rdi
	call ft_strlen wrt ..plt
	cmp rax, 0x0
	je .error
	mov rdi, rax
	inc	rdi
	call malloc wrt ..plt
	mov rdi, rax
	pop rsi
	call ft_strcpy wrt ..plt
.exit:
	ret
.error:
	pop rsi
	ret


section .note.GNU-stack
