.file "braddr2.s"
.data
.comm   array, 10
.text
.globl  main
main:
        movb    $0x12, array + 8
        movb    $0x34, array + 2
        ret
