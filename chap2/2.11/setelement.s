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
        movl    8(%ebp), %edx           # real size of dim.
        movl    %edx, dim
        movl    12(%ebp), %edx          # get base addr.
        movl    %edx, baddr
        movl    16(%ebp), %edx          # get row
        movl    %edx, row
        movl    20(%ebp), %edx          # get column
        movl    %edx, col
        movl    $0, %edi

# access to a[i][j]
#
# (base addr.) + i * (dim size) * (byte size)  (-> column)
#              + j * (byte size)               (-> row)

loop1:                                  # column loop
        movl    dim, %eax               # (dim size) * i
        mull    %edi
        shll    %eax                    # * 4[bytes]
        shll    %eax
        movl    baddr, %ecx             # + (base addr.)
        addl    %eax, %ecx
        movl    $0, %esi
loop2:                                  # row loop
        movl    count, %edx
        incl    count
        movl    %edx, (%ecx, %esi, 4)   # (%ecx + 4 * %esi)
                                        # -> (column) + j * 4[bytes]
        incl    %esi
        cmpl    col, %esi               # loop with num of columns
        jb      loop2
#
        incl    %edi
        cmpl    row, %edi               # loop with num of rows
        jb      loop1

        movl    %ebp, %esp
        popl    %ebp
        ret
