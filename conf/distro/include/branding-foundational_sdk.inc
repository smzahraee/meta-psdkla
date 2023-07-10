require conf/distro/include/branding-core.inc

# Build for SK device variants for supported SOCs

# For AM68-SK, default tiboot3.bin should be HSFS
IMAGE_BOOT_FILES:j721s2 = "tispl.bin u-boot.img uEnv.txt tiboot3-j721s2-hs-fs-evm.bin;tiboot3.bin"

# For AM69-SK, default tiboot3.bin should be HSFS
IMAGE_BOOT_FILES:j784s4 = "tispl.bin u-boot.img uEnv.txt tiboot3-j784s4-hs-fs-evm.bin;tiboot3.bin"

# Remove run-time dependency for TI ETH firmware in the rootfs
RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:j721s2 = "ti-eth-fw"
RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:j784s4 = "ti-eth-fw"

# Update defaults in prebuilt-images in bundle
SYSFW_SUFFIX:pn-tisdk-core-bundle:j721s2 = "hs-fs"
SYSFW_SUFFIX:pn-tisdk-core-bundle:j784s4 = "hs-fs"

# Add demos relevant to foundational SDK for am68-sk, am69-sk to tisdk-default-image
IMAGE_INSTALL:append:pn-tisdk-default-image:j721s2 = " ti-apps-launcher"
IMAGE_INSTALL:append:pn-tisdk-default-image:j784s4 = " ti-apps-launcher"

