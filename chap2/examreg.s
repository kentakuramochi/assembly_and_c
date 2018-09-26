.file "examreg.s"
.text
.globl  main
main:
        movb    $0xd5, %al  # a1 = 213
        movb    $3, %bl     # bl = 3
        subb    %bl, %al    # al = al - bl
        ret                 # end of program
