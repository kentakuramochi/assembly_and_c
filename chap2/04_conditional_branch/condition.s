.file "condition.s"
.data
x:      .byte   12
result: .byte   0
.text
.globl  main
main:
        movl    $0, %eax
        movb    x, %al          # %al = 12
        cmpb    $10, %al
        ja      AlIsAboveThan10 # if (%al > 10) jump
#
        movb    %al, result     # %al = 0
        jmp     Finish
AlIsAboveThan10:
        movb    $10, result     # %al = 10
Finish:
        ret
