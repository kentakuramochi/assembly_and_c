.file "flagforadd.s"
.text
.globl  main
main:
#1st-stage
        movl    $0, %eax
        movb    $0x64, %al  # %al = 0x64 (100)
        cmpb    $120, %al   # %al < 120
        cmpb    $80, %al    # %al > 80
        cmpb    $100, %al   # %al = 100
#2nd-stage
        movb    $0xa0, %ah  # %ah = 0xa0 (160/-96)
        cmpb    $10, %ah
        cmpb    $0xb0, %ah  # 170/-80
        cmpb    $0x80, %ah  # 128/-128
        cmpb    $0x64, %ah  # 120
        ret
