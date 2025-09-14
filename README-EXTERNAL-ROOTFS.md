PocketDesktop External Rootfs
=======================

This repository includes support for building PocketDesktop images that boot with an external Linux root filesystem (e.g., Debian/Ubuntu/Arch/Alpine) while only building the kernel and bootloader within ROCKNIX. See the project documentation and the patches applied in this branch for details.

Usage overview:

1. Download a rootfs:
   - `./scripts/get_rootfs`
2. Configure environment:
   - `export PROJECT=Rockchip`
   - `export DEVICE=RK3588`
   - `export ARCH=aarch64`
   - `export EXTERNAL_ROOTFS=/absolute/path/to/rootfs.tar.gz`
   - `export ROOTFS_DISTRO_TYPE=ubuntu` (or debian/arch/alpine)
3. Test configuration:
   - `./scripts/test_external_rootfs`
4. Build:
   - `make all`

For complete documentation, consult your working implementation’s README for the external rootfs system.


