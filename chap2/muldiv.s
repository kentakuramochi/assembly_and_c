.file "muldiv.s"
.data
lval:   .long   0x56789abc
.text
.globl  main
main:
# 16 x 16 bit
        movw    $300, %ax
        movw    $500, %bx
        mulw    %bx                 # %ax * %bx = (%dx << 16) + %ax
# 32 x 32 bit
        movl    $0x12345678, %eax
        mull    lval                # %eax * long = (%edx << 32) + %eax
# 16 / 8 bit
        movw    $-12801, %ax
        movb    $100, %bh
        idiv    %bh                 # %ax / %bh = %al, reminder: %ah
        ret
