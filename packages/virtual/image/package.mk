# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2019-present Team LibreELEC (https://libreelec.tv)

# SPDX-License-Identifier: GPL-2.0-or-later
# Root package used to build and create complete image

PKG_NAME="image"
PKG_VERSION=""
PKG_SITE="https://libreelec.tv"
PKG_SECTION="virtual"
PKG_LONGDESC="Root package used to build and create complete image"

# Stripped down to only build kernel and bootloader for external rootfs
# Note: initramfs is excluded when using external rootfs
if [ -f "${ROOT}/config/rootfs.conf" ] && [ -n "${EXTERNAL_ROOTFS}" ]; then
  PKG_DEPENDS_TARGET="toolchain dosfstools:host fakeroot:host kmod:host mtools:host gcc:host linux linux-drivers linux-firmware ${BOOTLOADER}"
else
  PKG_DEPENDS_TARGET="toolchain dosfstools:host fakeroot:host kmod:host mtools:host gcc:host initramfs linux linux-drivers linux-firmware ${BOOTLOADER}"
fi

true
