.file "braddr1.s"
.data
.comm   array, 10
.text
.globl  main
main:
        movl    $0, %edi
        movb    $0, %cl
looptop:
        movb    %cl, array(%edi)    # base relative addressing
        incl    %edi
        incb    %cl
        cmpb    $10, %cl
        jb      looptop
        ret
