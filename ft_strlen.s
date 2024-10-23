BITS 64

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax 		; return value (counter too)
	cmp rdi, 0x0 		
	je .exit
.loop:
	cmp byte [rdi + rax], 0x0
	je .exit
	inc rax
	jmp .loop
.exit:
	ret

section .note.GNU-stack