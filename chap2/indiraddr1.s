.file "indiraddr1.s"
.data
.comm   array, 10
.text
.globl  main
main:
        movl    $array, %edi
        movb    $0, %cl
looptop:
        movb    %cl, (%edi)     # indirect addressing
        incl    %edi
        incb    %cl
        cmpb    $10, %cl
        jb      looptop
        ret
