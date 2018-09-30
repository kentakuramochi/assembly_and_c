.file "ex21.s"
.text
.globl  main
main:
        movw    $0b1010111000010011, %bx
        movb    $-128, %al
        movw    $-128, %bx
        movb    $0, %ch
        movb    %al, %cl
        ret
