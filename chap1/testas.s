	.file	"testas.c"
	.text
	.section	.rodata
.LC0:
	.string	"Enter y:"
.LC1:
	.string	"%d"
.LC2:
	.string	"Add is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	y.1795(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	scanf@PLT
	movl	x.1794(%rip), %edx
	movl	y.1795(%rip), %eax
	addl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.local	y.1795
	.comm	y.1795,4,4
	.data
	.align 4
	.type	x.1794, @object
	.size	x.1794, 4
x.1794:
	.long	1
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
