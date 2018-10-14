.file "intadd.s"
.text
.align  4
.globl  intadd
.type   intadd, @function
# void intadd(int a, int b, int *c)
intadd:
        pushl   %ebp            # save %ebp: it mustn't be changed
                                # between function call/return
        movl    %esp, %ebp
        movl    16(%ebp), %edx  # set address of c to %edx
        movl    8(%ebp), %eax   # %eax = a
        addl    12(%ebp), %eax  # %eax += b
        movl    %eax, (%edx)    # *c = %eax
        movl    %ebp, %esp      # retrieve %ebp
        popl    %ebp
        ret
