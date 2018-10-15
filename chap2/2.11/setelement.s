.file "setelement.s"
.align  4
.data
dim:    .long   0                   # dim. of array
baddr:  .long   0                   # base addr.
row:    .long   0
col:    .long   0
count:  .long   0
.text
.globl  setelement
.type   setelement, @function
setelement:
        pushl   %ebp
        movl    %esp, %ebp
#
        movl    8(%ebp), %edx       # real size of dim.
        movl    %edx, dim
        movl    12(%ebp), %edx      # get base addr.
        movl    %edx, baddr
        movl    16(%ebp), %edx      # get row
        movl    %edx, row
        movl    20(%ebp), %edx      # get column
        movl    %edx, col
        movl    $0, %edi            # first row
loop1:
        movl    dim, %eax           # dim. x row
        mull    %edi
        shll    %eax                # x 4
        shll    %eax
        movl    baddr, %ecx         # base addr. of array
        addl    %eax, %ecx
        movl    $0, %esi            # first column
loop2:
        movl    count, %edx
        incl    count
        movl    %edx, (%ecx, %esi, 4)
        incl    %esi
        cmpl    col, %esi
        jb      loop2
#
        incl    %edi
        cmpl    row, %edi
        jb      loop1

        movl    %ebp, %esp
        popl    %ebp
        ret
