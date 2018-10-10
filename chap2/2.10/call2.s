.file "call2.s"
.data
var:    .long   0x1234
.text
.globl  main
main:
        movl    $0, %eax
        movb    $1, %al
        push    %eax            # stack argument
        call    IncReg          # function call
        pop     %eax            # get return value
        push    var
        call    IncReg
        pop     %ecx            # dummy
        ret
IncReg:
        movl    %esp, %ebp      # return address
        movl    4(%ebp), %edx   # argument @(%ebp)+4
        incl    %edx            # argument++
        movl    %edx, 4(%ebp)   # return value @(%ebp)+4
        ret
