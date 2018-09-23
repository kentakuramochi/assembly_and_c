	.file	"examsum.c"
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
	movq	$0, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L2
.L5:
	movq	$1, -24(%rbp)
	jmp	.L3
.L4:
	movq	-24(%rbp), %rax
	addq	%rax, -8(%rbp)
	addq	$1, -24(%rbp)
.L3:
	cmpq	$1000000, -24(%rbp)
	jle	.L4
	addq	$1, -16(%rbp)
.L2:
	cmpq	$100, -16(%rbp)
	jle	.L5
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
