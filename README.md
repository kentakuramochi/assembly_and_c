# assembly_and_c

## 概要

オーム社「組み込みユーザのためのアセンブリ/C言語読本」の学習記録。

[書籍ページ](https://www.ohmsha.co.jp/book/9784274208713/)

## 環境

書籍中のプログラムはx86アーキテクチャ（32bit CPU）での実行が想定されています。
ツールのバージョンも異なり、`gcc -S`でのアセンブリソース出力は書籍中のものとは差があります。

- Ubuntu 18.04 LTS 64bit
- gcc version 7.3.0 (Ubuntu 7.3.0-17ubuntu3)
- GNU assembler version 2.30 (x86_64-linux-gnu) using BFD version (GNU Binutils for Ubuntu) 2.30
- GNU gdb (Ubuntu 8.1-Oubuntu3) 8.1.0.20180409

### 追記：x86_64アーキテクチャでの32bitバイナリ生成と実行

`gcc-multilib`、`g++-multilib`を導入する。

```sh
$ sudo apt install gcc-multilib
```

`gcc -m32`で32bitアーキテクチャ向けのクロスコンパイルが可能。

```sh
$ cat ex.s
.file "example.s"
.data
cnt:     .long 0xa
.text
.globl   main
main:
    movl $0, %esi
loop:
    incl %esi
    cmpl cnt, %esi
    jb   loop
end:
    ret

$ gcc ex.s -m32 -o ex
$ file ex
ex: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0,
BuildID[sha1]=4e1f5dbc5473cbe61d2af21c3b429227ab47e4c5, not stripped
$ ./ex
$
```

