# This include is for the common setting used to build TISDK images.  These images
# include both host and target side content.
LICENSE = "MIT"

IMAGE_FSTYPES = "tar.xz"
IMAGE_NAME_SUFFIX = ""

inherit tisdk-bundle

COMPATIBLE_MACHINE = "k3"
PR_append = "_psdkla"

# List of packages to remove from the host package.  This is usually due to
# licensing issues and unneeded dependencies.
HOST_CLEANUP_PACKAGES = ""
TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"

IMAGE_INSTALL_remove += "chromium"


# Set DTB filters for each machine.  Use "unknown" by default to avoid
# picking up DTB files for devices with no DTB support.
DTB_FILTER = "unknown"
DTB_FILTER_am65xx = "am65"
DTB_FILTER_j7-evm = "j721e"

# List of target side images to build for the SDK
TARGET_IMAGES = "tisdk-default-image"

IMAGE_INSTALL = "\
    packagegroup-arago-tisdk-addons-sdk-host \
    packagegroup-arago-tisdk-crypto-sdk-host \
    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics-sdk-host','',d)} \
    packagegroup-arago-tisdk-amsdk-sdk-host${ARAGO_KERNEL_SUFFIX} \
"
DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"

DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb u-boot.img Image"
DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin ti-sci-firmware-am65x_sr2-gp.bin"
DEPLOY_IMAGES_NAME_append_j7-evm = " sysfw-psdkra.itb ti-sci-firmware-j721e-gp.bin"

ARAGO_TISDK_IMAGE ?= "arago-core-psdkla-bundle"
export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
