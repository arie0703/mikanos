# dev-containerを使って起動

## Xquartzの設定
- Xquartzの環境設定のセキュリティでネットワーク接続を許可する
- 起動後は以下コマンドを実行
  - `xhost + 127.0.0.1`

## remote containerモードでVSCodeを開く

mikanos-devcontainerをVSCodeで開くとDev Containerモードで開くことが可能


## dev-containerの設定

### mikanOSをclone

`cd /workspaces/mikanos-devcontainer/`

`git clone https://github.com/uchan-nos/mikanos.git`

### mikanosのPATH定義

`OS_DIR=/workspaces/mikanos-devcontainer/mikanos`

### edk2にシンボリックリンクを貼る

(edk2, osbookはホームディレクトリにあるという前提)

`ln -s ${OS_DIR}/MikanLoaderPkg ./`

### tools_def.txtの設定

`vi ~/edk2/Conf/tools_def.txt`

```diff
--- a/edk2/Conf/tools_def.txt
+++ b/edk2/Conf/tools_def.txt

-DEFINE CLANG38_X64_TARGET           = -target x86_64-pc-linux-gnu
+DEFINE CLANG38_X64_TARGET           = -target x86_64-linux-gnu

-DEBUG_CLANG38_X64_CC_FLAGS         = DEF(CLANG38_ALL_CC_FLAGS) -m64 "-DEFIAPI=__attribute__((ms_abi))" -mno-red-zone -mcmodel=small -fpie -Oz -flto DEF(CLANG38_X64_TARGET) -g
+DEBUG_CLANG38_X64_CC_FLAGS         = DEF(CLANG38_ALL_CC_FLAGS) -m64 "-DEFIAPI=__attribute__((ms_abi))" -mno-red-zone -mcmodel=small -fpie -Oz -flto DEF(CLANG38_X64_TARGET) -g -I/usr/x86_64-linux-gnu/include
```

viが重くて挙動がおかしい場合、rmでtools_def.txt消して、本リポジトリの`/resources/tool_def_modified.txt`をコピペすればOK


## dev-containerでの起動(edk2)

`cd ~/edk2`

`source edksetup.sh`

`build`

`../osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi ${OS_DIR}/kernel/kernel.elf
`

## 参考

https://zenn.dev/karaage0703/articles/1bdb8930182c6c
