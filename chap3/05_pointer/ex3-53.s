	.file	"ex3-53.c"
	.text
	.comm	p,4,4
	.globl	s
	.data
	.align 4
	.type	s, @object
	.size	s, 6
s:
	.string	"abcde"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	p@GOT(%eax), %edx
	leal	s@GOTOFF(%eax), %ecx
	movl	%ecx, (%edx)
	jmp	.L2
.L3:
	movl	p@GOT(%eax), %edx
	movl	(%edx), %edx
	movzbl	(%edx), %edx
	leal	-32(%edx), %ecx
	movl	p@GOT(%eax), %edx
	movl	(%edx), %edx
	movb	%cl, (%edx)
	movl	p@GOT(%eax), %edx
	movl	(%edx), %edx
	leal	1(%edx), %ecx
	movl	p@GOT(%eax), %edx
	movl	%ecx, (%edx)
.L2:
	movl	p@GOT(%eax), %edx
	movl	(%edx), %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	jne	.L3
	movl	$0, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB1:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE1:
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
