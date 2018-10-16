# assembly_and_c

## 概要

「組み込みユーザのためのアセンブリ/C言語読本」学習記録

[書籍ページ](https://www.ohmsha.co.jp/book/9784274208713/)

## 実行環境

実行環境は次の通り。

- CPU: Intel Core i5-2520M (x86_64)
- OS: Ubuntu18.04 LTS 64bit
- RAM: 8GB
- コンパイラ: gcc
- アセンブラ: GNU assembler (GAS)
- デバッガ: GNU gdb

書籍中のプログラムはx86アーキテクチャ (32bit CPU) 上での実行が想定されている。

書籍中に記載されているツールと、実行環境でのツールはバージョンが異なり、
`gcc -S`で生成されるアセンブリソースには差がある。

| ツール | 書籍中 | 実行環境 |
|:-:|:-|:-|
| コンパイラ | gcc version 2.7.2 | gcc version 7.3.0 (Ubuntu 7.3.0-17ubuntu3) |
| アセンブラ | GNU assembler version 960425 (i486-linux),<br>using BFD version 2.6.0.14 | GNU assembler version 2.30 (x86_64-linux-gnu)<br>using BFD version<br>(GNU Binutils for Ubuntu) 2.30 |
| デバッガ | GDB 4.16.1 (i386-cygwin32) | GNU gdb (Ubuntu 8.1-0ubuntu3)<br>8.1.0.20180409 |

## 追記：x86_64環境での32bitバイナリ生成と実行

`gcc-multilib`を導入する。
`gcc-multilib-i686-linux-gnu`がx86アーキテクチャ向けのパッケージである。

```sh
$ sudo apt install gcc-multilib
$ sudo apt list | grep gcc-multilib
...
gcc-multilib-i686-linux-gnu/bionic-updates 4:7.3.0-3ubuntu2.1 amd64
  GNU C compiler for the i386 architecture
...
```

コンパイル時に`-m32`オプションを付加すると、x86アーキテクチャ向けにクロスコンパイルされる。

```sh
$ vi hello.c
$ cat hello.c 
#include <stdio.h>

int main()
{
    printf("Hello\n");

    return 0;
}

$ gcc hello.c -m32 -o hello
$ file ./hello
./hello: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=b776b8af9a4aad4b82088a32e04887ccf795bdd4, not stripped
```

生成した実行ファイルはそのまま実行できる。

```sh
$ ./hello
Hello

```

### 参考

- [Ubuntu-bionic の gcc-multilib パッケージに関する詳細](https://packages.ubuntu.com/bionic/gcc-multilib)
- [64 bitのUbuntu Linuxで32 bitの実行ファイルを動かす方法のメモ](http://inaz2.hatenablog.com/entry/2016/03/09/221626)

## 追記：サンプルプログラムのエラー

### エラーの発生

2章11節「C言語とのリンク」において、次の関数`intadd`を呼び出すプログラムがSegmentation faultにより停止した。

```asm
.file "intadd.s"
.text
.align  4
.globl  intadd
.type   intadd, @function
# void intadd(int a, int b, int *c)
intadd:
        pushl   %ebp
        movl    %esp, %ebp
        movl    16(%ebp), %ebx  # get address of c
        movl    8(%ebp), %edx   # a
        addl    12(%ebp), %edx  # a + b
        movl    %edx, (%ebx)    # *c = a + b
        movl    %ebp, %esp
        popl    %ebp
        ret
```

### エラーの原因

処理を確認してみたところ、**EBX**レジスタの値の変化が原因であった。

1. プログラムが動作を開始する。EBXはあるアドレスを指している（静的データへアクセスする際のベースアドレスとなっている？）。
1. `intadd`内部でEBXにデータを書き込む。
1. 呼び出し元mainに復帰する。**呼び出し前とEBXの値は異なっている**。
1. 次に`printf`を呼び出す。
1. `printf`内部で、EBXの値を参照して（間接アドレッシング）データにアクセスする。
1. EBXは`intadd`内部でデータ値を上書きされているため。**不正な領域にアクセスしてしまう**。

EBXの代わりにECXを利用すると、問題なく動作することを確認した。

### エラーとなる理由

関数の**呼出規約**（サブルーチンを呼び出す際の決まりごと）に違反していた。

Linux環境で使われるx86の呼び出し規約は**cdecl**というものである。
cdeclでは、関数呼び出しの際に元の値を保存しなくてもよいレジスタが次の3つに規定されている。

- EAX
- ECX
- EDX

[呼出規約 - Wikipedia](https://ja.wikipedia.org/wiki/%E5%91%BC%E5%87%BA%E8%A6%8F%E7%B4%84)

EBXを変更しその値を元に戻さないまま呼び出し元に戻ると、上記エラーのような問題が発生するようだ。

書籍中の環境と異なっているために起こったことかもしれないが、詳細はわからなかった。
