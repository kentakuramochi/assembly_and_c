.file "jump.s"
.data
result: .byte   0
.text
.globl  main
main:
        movl    $0, %eax
        movb    $1, %al
        cmpb    $0x80, %al
        #ja      IsBigger
        jg      IsBigger
#
        jmp     Finish
IsBigger:
        movb    $1, result
Finish:
        ret
