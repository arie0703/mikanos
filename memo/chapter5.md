## フォントを増やそう

フォントのバイナリファイルからオブジェクトファイルを取得

`cd mikanos/kernel`

`../tools/makefont.py -o hankaku.bin hankaku.txt`

`objcopy -I binary -O elf64-x86-64 -B i386:x86-64 hankaku.bin hankaku.o`


オブジェクトファイルから変数を参照

```cpp
extern const uint8_t _binary_hankaku_bin_start;
extern const uint8_t _binary_hankaku_bin_end;
extern const uint8_t _binary_hankaku_bin_size;
```
