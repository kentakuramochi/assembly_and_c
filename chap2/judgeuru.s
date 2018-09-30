.file "judgeuru.s"
.data
year:   .word   1996
.text
.globl  main
main:
        movw    year, %ax
        andw    $0x0003, %ax    # mod(year, 4) = (year & 0x3)
        jnz     heinen

        movw    year, %ax
        movb    $100, %bl
        div     %bl             # reminder: %ah
        andb    %ah, %ah        # if %ah = 0, zero flag = 1
        jnz     uru

        xorl    %eax, %eax      # zero clear
        movw    year, %ax
        movw    $400, %bx
        div     %bx             # reminder: %dx
        andb    %dx, %dx
        jnz     heinen
uru:
        movl    $1, %eax
        jmp     Finish
heinen:
        movl    $0, %eax
Finish:
        ret
