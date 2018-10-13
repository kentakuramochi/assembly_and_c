.file "intadd.s"
.text
.align  4
.globl  intadd
.type   intadd, @function
# void intadd(int a, int b, int *c)
intadd:
        pushl   %ebp
        movl    %esp, %ebp
        movl    16(%ebp), %ebx  # get address of "c"
        movl    8(%ebp), %edx   # get value of "a"
        addl    12(%ebp), %edx  # "a" + "b"
        movl    %edx, (%ebx)    # set result to "c"
#
        movl    %ebp, %esp
        popl    %ebp
        ret
