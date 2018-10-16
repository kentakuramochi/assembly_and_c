.file "call1.s"
.text
.globl  main
main:
        movl    $0, %eax
        movb    $1, %al
        call    increment_al    # call "increment_al"
        movb    $2, %ah         # return here
        call    increment_ah    # call "increment_ah"
        nop                     # return here
increment_al:
        incb    %al
        ret
increment_ah:
        incb    %ah
        ret
