.file "bubblesort.s"
.text
.align  4
.globl  bubblesort
.type   bubblesort, @function
# void bubblesort(int n, int x[])
bubblesort:
        pushl   %ebp
        movl    %esp, %ebp
        pushl   %ebx            # save ebx (local stack)
# Outer loop
        movl    8(%ebp), %edx   # n
        decl    %edx
OuterLoopTop:
        movl    %edx, %ecx      # counter
# Inner loop
        movl    12(%ebp), %esi  # x[0] (x[k])
        movl    %esi, %edi
        addl    $4, %edi        # x[1] (x[k + 1])
InnerLoopTop:
        movl    (%esi), %eax
        movl    (%edi), %ebx
        cmpl    %ebx, %eax
        jb      NotSwap
# Swap
        movl    %eax, (%edi)
        movl    %ebx, (%esi)
NotSwap:
        addl    $4, %esi        # increment 4Byte pointer
        addl    $4, %edi
        decl    %ecx
        jnz     InnerLoopTop
#
        decl    %edx            # while > 0
        jnz     OuterLoopTop
# Exit
        popl    %ebx            # retrieve %ebx
        movl    %ebp, %esp
        popl    %ebp
        ret
