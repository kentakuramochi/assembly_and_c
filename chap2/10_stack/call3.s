.file "call3.s"
.data
var:    .long   0x1234
.text
.globl  main
main:
        movl    $0x1234, %eax
        push    %eax
        call    ByVal           # call by value
        pop     %eax
#
        push    $var
        call    ByRef           # call by reference
        pop     %eax            # dummy
        ret
#
ByVal:
        movl    %esp, %ebp
        movl    4(%ebp), %edx
        incl    %edx
        ret                     # don't return value
ByRef:
        movl    %esp, %ebp
        movl    4(%esp), %ebx
        incl    (%ebx)          # increment $var by indirect addressing
        ret                     # don't return value
