	.file	"examsum.c"
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
	subl	$16, %esp
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	movl	$0, -4(%ebp)
	movl	$1, -8(%ebp)
	jmp	.L2
.L5:
	movl	$1, -12(%ebp)
	jmp	.L3
.L4:
	movl	-4(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	addl	%eax, -4(%ebp)
	addl	$1, -12(%ebp)
.L3:
	cmpl	$1000000, -12(%ebp)
	jle	.L4
	addl	$1, -8(%ebp)
.L2:
	cmpl	$100, -8(%ebp)
	jle	.L5
	movl	$0, %eax
	leave
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
