<p align="center">
  <img src="./assets/pocketdesktop-logo.svg" alt="PocketDesktop" width="420"/>
</p>

PocketDesktop — Desktop Linux Build Environment for Handheld Devices (fork of ROCKNIX)
===================================================================================

PocketDesktop is a minimal, fast desktop Linux build environment tailored for handheld gaming devices. It focuses on building the kernel and bootloader, then pairs them with an external ARM64 root filesystem (Ubuntu/Debian/Arch/Alpine).

[![Project](https://img.shields.io/badge/Project-PocketDesktop-FF5555?style=flat-square)](./)
[![Upstream](https://img.shields.io/badge/Upstream-ROCKNIX-5555FF?style=flat-square)](https://github.com/ROCKNIX/distribution)


Quick Start
-----------

1) Download an ARM64 rootfs

```
./scripts/get_rootfs
```

2) Configure your environment

```
export PROJECT=Rockchip
export DEVICE=RK3588
export ARCH=aarch64
export EXTERNAL_ROOTFS=/absolute/path/to/rootfs.tar.gz
export ROOTFS_DISTRO_TYPE=ubuntu   # or: debian | arch | alpine
```

3) Validate the setup

```
./scripts/test_external_rootfs
```

4) Build (fast path: kernel + bootloader + image)

```
make all
```


Docker (recommended)
--------------------

```
make docker-image-build
make docker-all
```


What this includes
------------------

- External rootfs workflow and config: `config/rootfs.conf`, `config/packages.conf`
- Faster kernel-only rebuild loop (minutes instead of hours)
- Image creation tuned for three-partition layout (boot, rootfs, storage)
- Helper scripts:
  - `scripts/get_rootfs` — fetch common ARM64 rootfs archives
  - `scripts/install_packages` — optional package install inside the rootfs (per distro)
  - `scripts/test_external_rootfs` — quick validation of prerequisites


Acknowledgements
----------------

PocketDesktop is possible thanks to the incredible work of the ROCKNIX community. This project stands on their shoulders and reuses large parts of their build system to enable a fast desktop-centric workflow for handheld devices. If you use PocketDesktop, please consider starring and supporting the upstream:

- ROCKNIX repository: https://github.com/ROCKNIX/distribution

Notes
-----

- Ensure `EXTERNAL_ROOTFS` points to a valid `*.tar.gz` rootfs archive.
- When using Docker, privileged mode is enabled for image creation tasks.
- For full upstream docs, features, and device support, see [ROCKNIX/distribution](https://github.com/ROCKNIX/distribution).

- After writing the produced `.img.gz` to your SD card, manually expand the storage partition to use the full card capacity. You can do this with `gparted` or `parted` on a Linux host (resize the third partition, typically labeled storage).

