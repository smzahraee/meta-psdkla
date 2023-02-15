# This include is for the common setting used to build TISDK images.  These images
# include both host and target side content.
LICENSE = "MIT"

IMAGE_FSTYPES = "tar.xz"
IMAGE_NAME_SUFFIX = ""

inherit tisdk-bundle

COMPATIBLE_MACHINE = "k3"
PR_append = "_psdkla_10"

# List of packages to remove from the host package.  This is usually due to
# licensing issues and unneeded dependencies.
HOST_CLEANUP_PACKAGES = ""
TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"

IMAGE_INSTALL_remove += "chromium"


# Set DTB filters for each machine.  Use "unknown" by default to avoid
# picking up DTB files for devices with no DTB support.
DTB_FILTER = "unknown"
DTB_FILTER_am65xx-evm = "am65"
DTB_FILTER_j7-evm = "j721e"
DTB_FILTER_j7200-evm = "j7200"
DTB_FILTER_j721s2-evm = "j721s2\|am68"
DTB_FILTER_j784s4-evm = "j784s4\|am69"

# List of target side images to build for the SDK
TARGET_IMAGES = "tisdk-default-image"
TARGET_IMAGES_append_j7-evm = " tisdk-edgeai-image"
TARGET_IMAGES_append_j721s2-evm = " tisdk-edgeai-image"
TARGET_IMAGES_append_j784s4-evm = " tisdk-edgeai-image"

TARGET_IMAGE_TYPES = "tar.xz"

TISDK_TOOLCHAIN = "${@bb.utils.contains('MACHINE_FEATURES','gpu','meta-toolchain-arago-tisdk','meta-toolchain-arago-tisdk-server',d)}"
TOOLCHAIN_SUFFIX = "${@bb.utils.contains('MACHINE_FEATURES','gpu','-tisdk','-tisdk-server',d)}"


IMAGE_INSTALL = "\
    packagegroup-arago-tisdk-addons-sdk-host \
    packagegroup-arago-tisdk-crypto-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-qte-sdk-host','',d)} \
"
DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"

DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin u-boot.img Image"
DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x_sr2-gp.bin"
DEPLOY_IMAGES_NAME_append_j7-evm = "\
    sysfw.itb ti-fs-firmware-j721e-gp.bin \
    ti-fs-firmware-j721e-hs-cert.bin ti-fs-firmware-j721e-hs-enc.bin \
    ti-fs-firmware-j721e_sr1_1-hs-cert.bin ti-fs-firmware-j721e_sr1_1-hs-enc.bin \
    ipc_echo_testb_mcu1_0_release_strip.xer5f"
DEPLOY_IMAGES_NAME_append_j7200-evm = "\
    ti-fs-firmware-j7200-gp.bin \
    ti-fs-firmware-j7200-hs-cert.bin ti-fs-firmware-j7200-hs-enc.bin \
    ti-fs-firmware-j7200_sr2-hs-cert.bin ti-fs-firmware-j7200_sr2-hs-enc.bin \
    ipc_echo_testb_mcu1_0_release_strip.xer5f"
DEPLOY_IMAGES_NAME_append_j721s2-evm = "\
    ti-fs-firmware-j721s2-gp.bin \
    ti-fs-firmware-j721s2-hs-cert.bin ti-fs-firmware-j721s2-hs-enc.bin \
    ipc_echo_testb_mcu1_0_release_strip.xer5f"
DEPLOY_IMAGES_NAME_append_j784s4-evm = "\
    ti-fs-firmware-j784s4-gp.bin \
    ti-fs-firmware-j784s4-hs-cert.bin ti-fs-firmware-j784s4-hs-enc.bin \
    ipc_echo_testb_mcu1_0_release_strip.xer5f"

ARAGO_TISDK_IMAGE ?= "arago-core-psdkla-bundle"
export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
