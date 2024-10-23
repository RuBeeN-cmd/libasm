BITS 64


section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0	; read syscall number
	syscall
	cmp rax, 0x0
	jl .error
	jmp .exit
.error:
	neg rax
	push rax
	call __errno_location wrt ..plt
	; call __errno_location
	pop rdx
	mov [rax], rdx
	mov rax, -1
.exit:
	ret


section .note.GNU-stack