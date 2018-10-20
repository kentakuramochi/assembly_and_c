	.file	"ex3-61.c"
	.text
	.comm	cal,160,32
	.section	.rodata
.LC0:
	.string	"day=%d, meal=%d?"
.LC1:
	.string	"%d"
.LC2:
	.string	"%4d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x78,0x6
	.cfi_escape 0x10,0x3,0x2,0x75,0x7c
	subl	$16, %esp
	call	__x86.get_pc_thunk.bx
	addl	$_GLOBAL_OFFSET_TABLE_, %ebx
	movl	$0, -20(%ebp)
	jmp	.L2
.L5:
	movl	$0, -16(%ebp)
	jmp	.L3
.L4:
	subl	$4, %esp
	pushl	-16(%ebp)
	pushl	-20(%ebp)
	leal	.LC0@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	leal	0(,%eax,4), %edx
	movl	cal@GOT(%ebx), %eax
	addl	%edx, %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC1@GOTOFF(%ebx), %eax
	pushl	%eax
	call	__isoc99_scanf@PLT
	addl	$16, %esp
	addl	$1, -16(%ebp)
.L3:
	cmpl	$3, -16(%ebp)
	jle	.L4
	addl	$1, -20(%ebp)
.L2:
	cmpl	$6, -20(%ebp)
	jle	.L5
	movl	$0, -20(%ebp)
	jmp	.L6
.L9:
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	.L7
.L8:
	movl	cal@GOT(%ebx), %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	(%ecx,%eax,4), %eax
	addl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
.L7:
	cmpl	$3, -16(%ebp)
	jle	.L8
	movl	cal@GOT(%ebx), %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	leal	16(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	addl	$1, -20(%ebp)
.L6:
	cmpl	$6, -20(%ebp)
	jle	.L9
	movl	$0, -16(%ebp)
	jmp	.L10
.L13:
	movl	$0, -12(%ebp)
	movl	$0, -20(%ebp)
	jmp	.L11
.L12:
	movl	cal@GOT(%ebx), %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	(%ecx,%eax,4), %eax
	addl	%eax, -12(%ebp)
	addl	$1, -20(%ebp)
.L11:
	cmpl	$6, -20(%ebp)
	jle	.L12
	movl	-12(%ebp), %ecx
	movl	$-1840700269, %edx
	movl	%ecx, %eax
	imull	%edx
	leal	(%edx,%ecx), %eax
	sarl	$2, %eax
	movl	%eax, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	cal@GOT(%ebx), %eax
	movl	-20(%ebp), %edx
	addl	$35, %edx
	movl	%ecx, (%eax,%edx,4)
	addl	$1, -16(%ebp)
.L10:
	cmpl	$3, -16(%ebp)
	jle	.L13
	movl	$0, -20(%ebp)
	jmp	.L14
.L17:
	movl	$0, -16(%ebp)
	jmp	.L15
.L16:
	movl	cal@GOT(%ebx), %ecx
	movl	-20(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	%edx, %eax
	movl	(%ecx,%eax,4), %eax
	subl	$8, %esp
	pushl	%eax
	leal	.LC2@GOTOFF(%ebx), %eax
	pushl	%eax
	call	printf@PLT
	addl	$16, %esp
	addl	$1, -16(%ebp)
.L15:
	cmpl	$4, -16(%ebp)
	jle	.L16
	subl	$12, %esp
	pushl	$10
	call	putchar@PLT
	addl	$16, %esp
	addl	$1, -20(%ebp)
.L14:
	cmpl	$7, -20(%ebp)
	jle	.L17
	movl	$0, %eax
	leal	-8(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.bx,"axG",@progbits,__x86.get_pc_thunk.bx,comdat
	.globl	__x86.get_pc_thunk.bx
	.hidden	__x86.get_pc_thunk.bx
	.type	__x86.get_pc_thunk.bx, @function
__x86.get_pc_thunk.bx:
.LFB1:
	.cfi_startproc
	movl	(%esp), %ebx
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
