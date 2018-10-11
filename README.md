# assembly_and_c

## 概要

「組み込みユーザのためのアセンブリ/C言語読本」学習記録

[書籍ページ](https://www.ohmsha.co.jp/book/9784274208713/)

## 環境

書籍中のプログラムはx86アーキテクチャ（32bit CPU）での実行を想定。

書籍中で明記されているツールのバージョンと、実行環境 (Ubuntu 18.04 LTS 64bit) との差は次の通り。

| ツール | 書籍中 | 実行環境 |
|:-:|:-|:-|
| コンパイラ | gcc version 2.7.2 | gcc version 7.3.0<br>(Ubuntu 7.3.0-17ubuntu3) |
| アセンブラ | GNU assembler<br>version 960425 (i486-linux),<br>using BFD version 2.6.0.14 | GNU assembler<br>version 2.30 (x86_64-linux-gnu)<br> using BFD version<br>(GNU Binutils for Ubuntu) 2.30 |
| デバッガ | GDB 4.16.1<br>(i386-cygwin32) | GNU gdb<br>(Ubuntu 8.1-0ubuntu3)<br>8.1.0.20180409 |

アーキテクチャおよびツールの違いにより、`gcc -S`で生成されるアセンブリソース出力は書籍中のものと異なる。

## x86_64環境での32bitバイナリ生成と実行

### 生成

`gcc-multilib`、`g++-multilib`を導入する。

```sh
$ sudo apt install gcc-multilib
```

既存のgccが置き換わる形で導入され、`-m32`/`-m64`オプションでそれぞれ32bit/64bitアーキテクチャ向けにクロスコンパイルできる。

```sh
$ cat ex.s
.file "ex.s"
.data
cnt:     .long 0xa  # 0xa=10
.text
.globl   main
main:
    movl $0, %esi
loop:               # %esiを10回インクリメント
    incl %esi
    cmpl cnt, %esi
    jb   loop
end:
    ret

$ gcc ex.s -m32 -o ex
```

生成したELFバイナリを確認すると、32bitアーキテクチャ向けの実行ファイルとなっている。

```
$ file ex
ex: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0,
BuildID[sha1]=4e1f5dbc5473cbe61d2af21c3b429227ab47e4c5, not stripped
```

### 実行

`multiarch-support`を導入する（自分の環境ではすでに導入済みだった）。

```sh
$ sudo apt-get install multiarch-support
```

```sh
$ file ex
ex: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV),
dynamically linked, interpreter /lib/ld-linux.so.2, for GNU/Linux 3.2.0,
BuildID[sha1]=4e1f5dbc5473cbe61d2af21c3b429227ab47e4c5, not stripped
$ ./ex
（出力はない）
```
