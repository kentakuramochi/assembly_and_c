.file "lower2upper"
.text
.align  2
.globl  lower2upper
.type   lower2upper, @function
lower2upper:
        pushl   %ebp
        movl    %esp, %ebp
#
        movl    12(%ebp), %edx  # address of string
        xorl    %ecx, %ecx      # counter: zero clear
looptop:
        movb    (%edx), %al
        cmpb    $0, %al         # is '\0' ?
        je      exit
        cmpb    $'a', %al       # < 'a' ?
        jb      next
        cmpb    $'z', %al       # > 'z' ?
        ja      next
        andb    $0xdf, (%edx)   # = subb $0x20, (%edx) : lower to upper
next:
        incl    %edx            # next character
        incl    %ecx            # increment counter
        jmp     looptop
#
exit:
        movl    8(%ebp), %edx   # address of counter
        movl    %ecx, (%edx)    # save count
        movl    %ebp, %esp
        popl    %ebp
        ret
