	.file	"ex3-71.c"
	.text
	.comm	x,40,32
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
	movl	x@GOT(%eax), %edx
	movb	$65, (%edx)
	movl	x@GOT(%eax), %edx
	movb	$0, 19(%edx)
	movl	x@GOT(%eax), %edx
	movl	$186, 20(%edx)
	movl	x@GOT(%eax), %edx
	movb	$49, 24(%edx)
	movl	x@GOT(%eax), %edx
	movb	$0, 32(%edx)
	movl	x@GOT(%eax), %eax
	movl	$30, 36(%eax)
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
