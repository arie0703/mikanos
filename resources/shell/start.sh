# 起動用スクリプト

# source edksetup.sh
# build

OS_DIR=/workspaces/mikanos-devcontainer/mikanos

../osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi ${OS_DIR}/kernel/kernel.elf
