.file "asmsum.s"
.text
.globl  main
main:
        movl    $1, %edx
loop1:
        movl    $0, %eax
        movl    $1, %ecx
loop2:
        addl    %ecx, %eax
        incl    %ecx
        cmpl    $1000000, %ecx
        jbe     loop2
#
        incl    %edx
        cmpl    $100, %edx
        jbe     loop1
        ret
