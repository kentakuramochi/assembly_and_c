.file "fibonacci.s"
.data
.comm   fibo, 40                # result
num:    .word   10              # loop counter
.text
.globl  main
main:
        movl    $0, %eax
        movl    $0, %ecx
        movl    $0, %edx
        movw    num, %cx
        subw    $1, %cx
        movl    $fibo, %edi     # set address
        movw    $0, (%edi)      # f0 = 0
        addl    $2, %edi
        movw    $1, (%edi)      # f1 = 1
        addl    $2, %edi
looptop:
        movw    -4(%edi), %ax   # %ax = f(n-2)
        addw    -2(%edi), %ax   # %ax = %ax + f(n-1)
        movw    %ax, (%edi)     # %ax -> fn
        addl    $2, %edi
        decw    %cx
        jnz     looptop
loopend:
        ret
