.file "caralarm.s"
.data
sensor: .byte   0b00100001
.text
.globl  main
main:
        movl    $0, %eax
# examine 1st logic: (b0=1 AND b5=1) with mask
        movb    sensor, %al
        andb    $0b00100001, %al
        jp      Alarm               # jump with PF
# examine 2nd logic: (b7=0 AND b6=1) with shift
        movb    sensor, %al
        salb    $1, %al
        jc      NotAlarm            # jump with CF
        salb    $1, %al
        jc      Alarm
        jmp     NotAlarm
Alarm:
        nop
NotAlarm:
        nop
