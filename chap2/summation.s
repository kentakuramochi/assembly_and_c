.file "summation.s"
.data
num:    .word   10
array:  .word   4096, -8, 6091, -2, 1, 7, 8192, 9, 1, 5050
.text
.globl  main
main:
        movl    $0, %eax        # array element
        movl    $0, %edx        # sum
        movl    $0, %ecx        # counter
        movw    num, %cx
        movl    $array, %esi    # load array address
looptop:
        movswl  (%esi), %eax    # load word (w, 2B) to long word (4B, l)
                                # with sign
        addl    %eax, %edx
        incl    %esi            # %esi + 2
        incl    %esi
        decw    %cx
        jnz     looptop         # while %cx != 0
loopend:
        ret
