.file "examgdb.s"
.data
num:    .long   0x6
string: .ascii  "abcdef"
iarray: .word   0x1234, 0x5678, 0x9abc, 0xdef0, 0x1234, 0xffff
.text
.globl  main
main:
        movl    $0, %esi
looptop:
        movb    string(%esi), %al
        movw    iarray(, %esi, 2), %dx
        incl    %esi
        cmpl    num, %esi
        jb      looptop
endloop:
        ret
