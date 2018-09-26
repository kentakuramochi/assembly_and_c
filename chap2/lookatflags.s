.file "lookatflags.s"
.text
.globl  main
main:
        movl    $0, %eax
        movb    $2, %al
        # $ps: 0  0  0  0  0  0  0  0  0  0  0  0
        #      OF DF IF TF SP ZF -- AF -- PF -- CF
        decb    %al         # decrement, ZF=0
        decb    %al         # ZF=1
#
        movb    $0x8a, %al
        andb    $0x82, %al  # mask: SF=1, ZF=0, PF=1, CF=0
        addb    $0x80, %al  # addition: CF=1, OF=1
        ret
