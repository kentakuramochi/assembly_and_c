.file "datatype.s"
.data
var:    .word   0xe1a3
string: .ascii  "abcd"
.text
.globl  main
main:
        movl    $0, %eax
        movl    $0, %esi
        movl    $var, %esi      # get address var
        movb    var, %al        # transfer 1Byte
        movw    var, %ax        # transfer 2Byte
        movw    $0, %ax
        movb    (%esi), %al     # al = *(%esi) = var
        inc     %esi            # %esi++
        movb    (%esi), %al     # al = *(%esi + 1)
        movb    string, %al
        movw    string, %ax
        movl    string, %eax
        ret
