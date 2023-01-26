## ビルドしたディスクイメージをUSBなどにマウントする

`mount -t ext4 -o loop disk.img mnt`


### mount -t
- ext4
    - Linuxのファイルシステム
- ext2，ext3
    - 少し前のLinuxのファイルシステム
- msdos
    - MS-DOSのファイルシステム
- vfat
    - FATのファイルシステム
- iso9660
    - CD-ROMなどの光学ディスク全般
- nfs
    - ネットワークファイルシステム
