.file "sumint.s"
.text
.align  4
.globl  sumint
.type   sumint, @function
sumint:
        pushl   %ebp
        movl    %esp, %ebp

        movl    12(%ebp), %esi  # n
        movl    8(%ebp), %ecx   # x[0]
        xorl    %eax, %eax      # zero clear
looptop:
        addl    (%esi), %eax
        addl    $4, %esi        # pointer += 4
        decl    %ecx            # loop counter
        jnz     looptop
loopend:
        movl    %ebp, %esp
        popl    %ebp
        ret
