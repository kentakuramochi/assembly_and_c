.file "concat.s"
.data
string1:    .ascii  "abcde\0"
string2:    .ascii  "012345\0"
.comm       dest, 80
.text
.globl  main
main:
        movl    $0, %eax
        movl    $dest, %edi     # result
        movl    $string1, %esi
firstloop:
        movb    (%esi), %al     # load char from string1
        incl    %esi
        cmpb    $0x00, %al      # loop until '\0'
        je      nextstep
        movb    %al, (%edi)     # set char to dest
        incl    %edi
        jmp     firstloop
nextstep:
        movl    $string2, %esi
secondloop:
        movb    (%esi), %al     # same processing
        incl    %esi
        cmpb    $0x00, %al
        je      exit
        movb    %al, (%edi)
        incl    %edi
        jmp     secondloop
exit:
        movb    %al, (%edi)     # NULL terminate
        ret

