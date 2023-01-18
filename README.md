# ゼロからのOS自作入門学習用リポジトリ for Mac

## 概要
[ゼロからのOS自作入門](https://www.amazon.co.jp/%E3%82%BC%E3%83%AD%E3%81%8B%E3%82%89%E3%81%AEOS%E8%87%AA%E4%BD%9C%E5%85%A5%E9%96%80-%E5%86%85%E7%94%B0-%E5%85%AC%E5%A4%AA/dp/4839975868)の学習内容をMacOS環境で動かすリポジトリ  


## 環境構築

### リポジトリのclone  
`git clone https://github.com/tianocore/edk2.git`  

`git clone https://github.com/uchan-nos/mikanos-build.git osbook`  

`git clone https://github.com/uchan-nos/mikanos.git`  


## ビルドツールのインストール

`cd osbook/devenv`  

`curl -L https://github.com/uchan-nos/mikanos-build/releases/download/v2.0/x86_64-elf.tar.gz | tar xz`  


### パッケージインストール

`brew install qemu`  

`brew install llvm`  

`brew install nasm dosfstools binutils`  

MacでEDK2を使うにはLLVM9以上が必要


## パッチ適用

osbookにmac.patchを配置  

`patch -p1 < mac.patch`


## QEMUを立ち上げる
環境変数  
`EDK_TOOLS_PATH=~/desktop/projects/osdev/edk2/BaseTools`

osファイルをビルド  
`cd edk2`  
`source edksetup.sh`  
`build`  

qemu起動  
`cd edk2`  
`sh start.sh`  

## 参考
https://qiita.com/yamoridon/items/4905765cc6e4f320c9b5  
https://zenn.dev/karaage0703/scraps/b2705131673377
