.file "indiraddr2.s"
.data
.comm   array, 10
.text
.globl  main
main:
        movl    $array, %edi
        addl    $8, %edi
        movb    $0x12, (%edi)   # (array + 8) = 0x12
        movl    $array, %edi
        addl    $2, %edi
        movb    $0x34, (%edi)   # (array + 2) = 0x34
        ret
