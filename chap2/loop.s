.file "loop.s"
.text
.globl  main
main:
        movl    $0, %eax    # sum
        movl    $1, %ecx    # loop counter
looptop:
        addw    %cx, %ax
        incw    %cx         # increment
        cmpw    $100, %cx
        jbe     looptop     # jump if %cx <= (if below) 100
loopend:
        ret
