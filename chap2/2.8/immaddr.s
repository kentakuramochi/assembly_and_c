.file "immaddr.s"
.data
var:    .word   0
.text
.globl  main
main:
        movl    $var, %eax
        addw    $0x1234, %ax
        addw    $0x5678, %ax
        ret
